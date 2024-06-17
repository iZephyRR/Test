package com.mart.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mart.dao.AdminDAO;
import com.mart.dao.CartDAO;
import com.mart.dao.ProductDAO;
import com.mart.dao.VoucherDAO;
import com.mart.model.CartBean;
import com.mart.model.CouponBean;
import com.mart.model.PaymentBean;
import com.mart.model.ProductBean;
import com.mart.model.VoucherBean;

@Controller
public class CartController {

	@PostMapping(value = "/shopDetail/addToCart/{id}")
	public String addToCart(@PathVariable("id") int proId, @RequestParam("quantityValue") int qtyValue,
			HttpServletRequest request, Model model) {

		if (request.getSession(false) != null && request.getSession(false).getAttribute("adminLoginId") != null) {
			return "redirect:/shopDetail/" + proId;
		} else if (request.getSession(false) != null
				&& request.getSession(false).getAttribute("customerLoginId") != null) {
			
			int cusId = (int) request.getSession(false).getAttribute("customerLoginId");
			CartDAO cartDao = new CartDAO();
			CartBean existCbean = new CartBean();
			ProductBean pbean = new ProductBean();
			existCbean = cartDao.searchProduct(cusId, proId);
			
			if (existCbean != null && existCbean.getCustomer_id() == cusId) {
				cartDao.updateCart(existCbean.getId(), existCbean.getQty() + qtyValue,
						amount(existCbean.getUnit_price(), existCbean.getQty() + qtyValue));
			} else {
				pbean = ProductDAO.selectProductById(proId);
				CartBean cbean = new CartBean();
				cbean.setCustomer_id(cusId);
				cbean.setPro_id(pbean.getId());
				cbean.setUnit_price(pbean.getUnit_price());
				cbean.setQty(qtyValue);
				cbean.setAmount(amount(pbean.getUnit_price(), qtyValue));
				cbean.setImage(pbean.getImage());
				cartDao.insertProductToCart(cbean);
			}
			return "redirect:/shopDetail/" + proId;
		} else {
			return "redirect:/login";
		}
	}

	@GetMapping(value = { "/delete/{id}", "shopDetail/delete/{id}" })
	public String delete(@PathVariable("id") int cartId) {
		CartDAO.deleteProFromCart(cartId);
		return "redirect:/cart";
	}

	@GetMapping(value = { "/cart" })
	public String cart(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("customerLoginId") != null) {
			int cusId = (int) session.getAttribute("customerLoginId");
			List<CartBean> lst = CartDAO.selectAllCart(cusId);
			model.addAttribute("cartlst", lst);
			double totalAmount = CartDAO.totalAmount(cusId);

			String formattedResult = String.format("%.2f", totalAmount);
			double total = Double.parseDouble(formattedResult);
			model.addAttribute("total", total);
			return "cart";
		} else {
			return "redirect:/login";
		}
	}

	// checkout
	@PostMapping(value = { "checkout/{total}", "/checkout/checkout/{total}" })
	public String checkOut(@PathVariable("total") double total,
			@RequestParam(value = "coupon", required = false) String coupon, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("customerLoginId") != null) {
			if (total == 0.0) {
				model.addAttribute("message", "You didn't buy anything!! Please Buy Something!!");
				return "cart";
			}

			String tax = null;
			if (total >= 150) {
				tax = "Tax Free";
			} else {
				tax = "included Tax - $1.5";
				total += 1.5;
			}
			model.addAttribute("tax", tax);

			List<CartBean> lst = CartDAO.selectAllCart((int) session.getAttribute("customerLoginId"));
			model.addAttribute("cartlst", lst);

			if (coupon != null && !coupon.isEmpty()) {
				CouponBean bean = AdminDAO.selectCoupon(coupon);
				if (bean != null && bean.getCode() != null) {

					LocalDate currentDateTime = LocalDate.now();
					// Using LocalDate instead of LocalDateTime for date comparison
					DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
					// Parse the end date from the bean
					String endDateString = bean.getEndDate();
					LocalDate endDate = LocalDate.parse(endDateString, formatter);
					if (endDate.isEqual(currentDateTime) || endDate.isAfter(currentDateTime)) {
						// Coupon is valid
						int percent = bean.getDis_percent();
						total -= (total * percent / 100);
						String formattedResult = String.format("%.2f", total);
						double totalAmount = Double.parseDouble(formattedResult);
						model.addAttribute("total", totalAmount);
						model.addAttribute("coupon_id", bean.getId());
						model.addAttribute("percent", percent);
						model.addAttribute("message", "Coupon Applied. You get " + percent + " % discount.");
					} else {
						// Coupon has expired
						model.addAttribute("message", "Your Coupon is expired!!");
						return "cart";
					}
				} else {
					model.addAttribute("message", "Unknown Coupon Code!!");
					return "cart";
				}
			} else {
				model.addAttribute("message", "You do not use coupon");
			}
			String formattedResult = String.format("%.2f", total);
			double totalAmount = Double.parseDouble(formattedResult);
			model.addAttribute("total", totalAmount);
			return "checkout";
		} else {
			return "redirect:/";
		}
	}

	@PostMapping(value = { "checkout/getInfo", "checkout/checkout/getInfo" })
	public String getInfo(@RequestParam("name") String name, @RequestParam("phone") String phone,
			@RequestParam("floor") String floor, @RequestParam("street") String street,
			@RequestParam("township") String township, @RequestParam("city") String city,
			@RequestParam("total") double total, @RequestParam("tax") String tax,
			@RequestParam(value = "coupon", required = false) Integer couponId,
			@RequestParam(value = "percent", required = false) Integer percent, HttpServletRequest request, Model model)
			throws IOException {

		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("customerLoginId") != null) {

			String[] info = { name, phone, floor + "," + street + " Street, " + township + "Township," + city };
			session.setAttribute("info", info);
			/* System.out.println(total); */
			model.addAttribute("total", total);
			List<PaymentBean> lst = CartDAO.selectPayment();

			model.addAttribute("payment", lst);
			model.addAttribute("tax", tax);
			model.addAttribute("coupon_id", couponId);
			model.addAttribute("percent", percent);
			return "payment";
		} else {
			return "redirect:/";
		}
	}

	@PostMapping(value = { "/checkout/pay", "checkout/checkout/pay", "/shopDetail/checkout/pay"})
	public String pay(@RequestParam("total") double total, @RequestParam("payment") int paymentId,
			@RequestParam("file") MultipartFile image,
			@RequestParam(value = "coupon", required = false) Integer couponId,
			@RequestParam(value = "percent", required = false) Integer percent, HttpServletRequest request, Model model)
			throws IOException {

		HttpSession session = request.getSession(false);
		int cusId = (int) session.getAttribute("customerLoginId");
		String[] info = (String[]) session.getAttribute("info");
		// Get the current date and time
		LocalDateTime currentDateTime = LocalDateTime.now();

		// Define a format for displaying the date and time
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		// Format the current date and time using the defined format
		String currentDate = currentDateTime.format(formatter);
		int success = 1;
		
		VoucherBean vbean = new VoucherBean();
		vbean.setTotal_amount(total);
		vbean.setDate(currentDate);
		vbean.setPaymentId(paymentId);
		vbean.setImage(Base64.getEncoder().encodeToString(image.getBytes()));
		vbean.setName(info[0]);
		vbean.setPhone(info[1]);
		vbean.setAddress(info[2]);
		vbean.setCustomerId(cusId);
		
		if(couponId != null && percent != null) {
			vbean.setCouponId(couponId);
			vbean.setDis_percent(percent);
			success = VoucherDAO.insertVoucher(vbean);
		}else {
			success = VoucherDAO.insertVoucherwithoutCoupon(vbean);
		}
		
		if (success == 1) {
			int vouId = VoucherDAO.selectVoucherId(cusId, currentDate);//
			CartDAO.insertVoucherId(vouId, cusId);//

			List<CartBean> lst = CartDAO.selectProIdByVouId(vouId);
			for (int i = 0; i < lst.size(); i++) {
				int proId = lst.get(i).getPro_id();
				int qtyValue = lst.get(i).getQty();
				int qty = ProductDAO.getQty(proId);
				ProductDAO.updateQty(proId, qty - qtyValue);
			}
			return "success";
		} else {
			List<PaymentBean> lst = CartDAO.selectPayment();
			model.addAttribute("payment", lst);
			model.addAttribute("total", total);
			return "payment";
		}

	}

	private double amount(double price, int qty) {
		String formattedResult = String.format("%.2f", price * qty);
		return Double.parseDouble(formattedResult);
	}
}
