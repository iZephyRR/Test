package com.mart.controller;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mart.dao.AdminDAO;
import com.mart.dao.CartDAO;
import com.mart.dao.CustomerDAO;
import com.mart.dao.ProductDAO;
import com.mart.dao.VoucherDAO;
import com.mart.model.AdminBean;
import com.mart.model.CartBean;
import com.mart.model.CouponBean;
import com.mart.model.ProductBean;
import com.mart.model.VoucherBean;

@Controller
public class AdminController {

	@GetMapping(value = "/contact")
	public String contact() {
		return "contact";
	}

	// Logout
	@GetMapping(value = "/logout")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		if (session != null && session.getAttribute("adminLoginId") != null) {
			session.invalidate();
			return "redirect:/";
		} else if (session != null && session.getAttribute("customerLoginId") != null) {
			Integer cusId = (Integer) session.getAttribute("customerLoginId");
			CartDAO.deleteCartByCusId(cusId);
			session.invalidate();
			return "redirect:/";
		} else {
			return "redirect:/";
		}
	}

	@GetMapping(value = "/aceMartAdminSite")
	public String getAdminLogin(HttpServletRequest request, Model model) {

		if (request.getSession(false) != null && request.getSession(false).getAttribute("adminLoginId") != null) {
			List<VoucherBean> vou_list = VoucherDAO.selectVoucher();
			model.addAttribute("vou_list", vou_list);
			int totalCustomer = CustomerDAO.countCustomer();
			model.addAttribute("totalCustomer", totalCustomer);
			double totalsale = VoucherDAO.totalSale();
			String formattedResult = String.format("%.2f", totalsale);
			model.addAttribute("totalSale", Double.parseDouble(formattedResult));
			int newOrder = VoucherDAO.newOrder();
			model.addAttribute("newOrder", newOrder);
			return "adminHub";
		} else if (request.getSession(false) != null
				&& request.getSession(false).getAttribute("customerLoginId") != null) {
			return "redirect:/";
		} else {
			return "adminLogin";
		}
	}

	// adminLogin
	@PostMapping(value = "/aceMartAdminSite")
	public String adminLogin(@RequestParam("email") String email, @RequestParam("password") String password,
			RedirectAttributes redirectAttribute, HttpServletRequest request, Model model) {

		AdminBean existBean = AdminDAO.selectAdmin(email, password);

		if (existBean != null && existBean.getPassword() != null) {
			request.getSession().setAttribute("adminLoginId", existBean.getId());
			model.addAttribute("bean", existBean);
			int totalCustomer = CustomerDAO.countCustomer();
			model.addAttribute("totalCustomer", totalCustomer);
			double totalsale = VoucherDAO.totalSale();
			model.addAttribute("totalSale", Double.parseDouble(String.format("%.2f", totalsale)));
			List<VoucherBean> vou_list = VoucherDAO.selectVoucher();
			model.addAttribute("vou_list", vou_list);
			int newOrder = VoucherDAO.newOrder();
			model.addAttribute("newOrder", newOrder);
			return "adminHub";
		} else {
			redirectAttribute.addFlashAttribute("error", "incorrect password");
			return "redirect:/aceMartAdminSite";
		}
	}

	// addAdmin
	@GetMapping(value = "/add-admin")
	public String getAdminReg(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("adminLoginId") != null) {
			int adminId = (int) session.getAttribute("adminLoginId");
			AdminBean bean = AdminDAO.selectAdminById(adminId);
			if (bean.getRole() == 1) {
				return "redirect:/aceMartAdminSite";
			} else {
				model.addAttribute("bean", new AdminBean());
				return "adminReg";
			}
		} else {
			return "redirect:/";
		}
	}

	// adminReg
	@PostMapping(value = "/adminSignup")
	public String addAdmin(Model model,@ModelAttribute("bean") @Validated AdminBean bean) {

		int rs = AdminDAO.insertAdmin(bean);
		if (rs == 0) {
			model.addAttribute("error", "Insert Failed");
			return "adminReg";
		}
		return "redirect:/aceMartAdminSite";
	}

	// viewAdmin
	@GetMapping(value = "/viewAdmin")
	public String ViewAdmin(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("adminLoginId") != null) {
			List<AdminBean> adminLst = AdminDAO.selectAllAdmin();
			model.addAttribute("admin_lst", adminLst);
			return "showAdmin";
		} else {
			return "redirect:/";
		}
	}

	@GetMapping(value = "adminDetail/{id}/{name}")
	public String adminDetail(Model model, HttpServletRequest request, @PathVariable("id") int id) {

		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("adminLoginId") != null) {
			int adminId = (int) session.getAttribute("adminLoginId");
			AdminBean adminBean = AdminDAO.selectAdminById(adminId);
			if (adminBean.getRole() == 1) {
				return "redirect:/viewAdmin";
			} else {
				AdminBean bean = AdminDAO.selectAdminById(id);
				model.addAttribute("adminBean", bean);
				List<ProductBean> lst = ProductDAO.selectByAdminId(id);
				model.addAttribute("proLst", lst);
				return "adminDetail";
			}
		} else {
			return "redirect:/";
		}
	}

	@GetMapping(value = "/coupon")
	public String viewCoupon(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("adminLoginId") != null) {
			List<CouponBean> lst = AdminDAO.selectAllCoupon();
			model.addAttribute("coupon_lst", lst);
			return "viewCoupon";
		} else {
			return "redirect:/";
		}
	}

	@GetMapping(value = "/create-coupon")
	public String getCreateCoupon(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("adminLoginId") != null) {
			int adminId = (int) session.getAttribute("adminLoginId");
			AdminBean bean = AdminDAO.selectAdminById(adminId);
			if (bean.getRole() == 1) {
				return "redirect:/aceMartAdminSite";
			} else {
				return "createCoupon";
			}
		} else {
			return "redirect:/";
		}
	}

	// create coupon
	@PostMapping(value = { "createCoupon" })
	public String createCoupon(@RequestParam("dis_amount") int dis_amount, @RequestParam("date") String dateString,
			Model model, HttpServletRequest request) {

		String coupon = generateCoupon();
		CouponBean bean = new CouponBean();
		bean.setAdminId((int) request.getSession(false).getAttribute("adminLoginId"));
		bean.setCode(coupon);
		bean.setDis_percent(dis_amount);
		bean.setEndDate(dateString);

		AdminDAO.createCoupon(bean);

		return "redirect:/coupon";
	}

	@GetMapping(value = "/adminProfile")
	public String showAdmin(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("adminLoginId") != null) {
			int adminId = (int) session.getAttribute("adminLoginId");
			AdminBean bean = AdminDAO.selectAdminById(adminId);
			model.addAttribute("admin", bean);
			return "adminProfileDetails";
		} else {
			return "redirect:/";
		}
	}

	@GetMapping(value = "/adminEdit/{id}")
	public String cart(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("adminLoginId") != null) {
			int adminId = (int) session.getAttribute("adminLoginId");
			AdminBean bean = AdminDAO.selectAdminById(adminId);

			model.addAttribute("profile", bean);
			return "adminProfileUpdate";
		} else {
			return "redirect:/";
		}
	}

	@PostMapping(value = "/adminUpdate")
	public String adminUpdate(@RequestParam("id") int id, @RequestParam("name") String name,
			@RequestParam("email") String email, @RequestParam("phone") String phone,

			Model model, HttpServletRequest request) throws IOException {

		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("adminLoginId") != null) {
			AdminBean admins = new AdminBean();
			admins.setId(id);
			admins.setName(name);
			admins.setEmail(email);
			admins.setPhone(phone);

			int success = AdminDAO.updateAdmin(admins);
			if (success == 0) {
				model.addAttribute("error", "Update Failed");
				return "adminProfileUpdate";
			}
		}
		return "redirect:/adminProfile";
	}

	// view order
	@GetMapping(value = "/orders")
	public String viewOrders(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("adminLoginId") != null) {
			List<VoucherBean> lst = VoucherDAO.selectAllVoucher();
			model.addAttribute("vou_list", lst);
			return "order";
		}
		return "redirect:/";
	}

	@GetMapping(value = "orderDetail/{id}")
	public String viewOrderDetail(@PathVariable("id") int vouId, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("adminLoginId") != null) {
			List<CartBean> cartList = CartDAO.productByVoucherId(vouId);
			model.addAttribute("cartList", cartList);
			VoucherBean bean = VoucherDAO.selectVoucherById(vouId);
			model.addAttribute("bean", bean);
			return "viewOrderDetail";
		} else {
			return "redirect:/";
		}
	}

	@GetMapping(value = "/orderDetail/orderConfirm/{id}")
	public String orderConfirm(@PathVariable("id") int vouId, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("adminLoginId") != null) {
			Integer adminId = (Integer) session.getAttribute("adminLoginId");
			VoucherDAO.addAdminIdToVoucher(adminId, vouId, "Order Confirmed");
			return "redirect:/aceMartAdminSite";
		}
		return "redirect:/";
	}

	@GetMapping(value = "/orderDetail/orderCancel/{id}")
	public String orderCancel(@PathVariable("id") int vouId, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("adminLoginId") != null) {
			Integer adminId = (Integer) session.getAttribute("adminLoginId");
			VoucherDAO.addAdminIdToVoucher(adminId, vouId, "Order Cancelled");
			List<CartBean> lst = CartDAO.selectProIdByVouId(vouId);
			for (int i = 0; i < lst.size(); i++) {
				int proId = lst.get(i).getPro_id();
				int qtyValue = lst.get(i).getQty();
				int qty = ProductDAO.getQty(proId);
				ProductDAO.updateQty(proId, qty + qtyValue);
			}
			return "redirect:/aceMartAdminSite";
		}
		return "redirect:/";
	}

	@GetMapping(value = "viewOrderDetail/{id}")
	public String viewOrderDetail_1(@PathVariable("id") int vouId, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("adminLoginId") != null) {
			List<CartBean> cartList = CartDAO.productByVoucherId(vouId);
			model.addAttribute("cartList", cartList);
			VoucherBean bean = VoucherDAO.selectVoucherById(vouId);
			model.addAttribute("bean", bean);
			return "viewOrderDetail_1";
		} else {
			return "redirect:/";
		}
	}

	// Change Password
	@GetMapping("/changePass/{id}")
	public String showChangePasswordForm(HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("adminLoginId") != null) {
			return "adminChangePassword"; // Return the view containing the form
		} else {
			return "redirect:/";
		}
	}

	@PostMapping("/changePass/adminchangePass")
	public String changePassword(@RequestParam("currentPassword") String currentPassword,
			@RequestParam("newPassword") String newPassword, HttpServletRequest request, Model model) {
		Integer adminId = (Integer) request.getSession().getAttribute("adminLoginId");
		AdminBean admin = AdminDAO.selectAdminById(adminId);

		if (admin != null && admin.getPassword().equals(currentPassword)) {
			// Update the password in the database
			AdminDAO.changePassword(adminId, newPassword);
			return "redirect:/adminProfile";
		} else {
			model.addAttribute("message", "Incorrect Current Password!");
			return "adminChangePassword";
		}
	}

	// show Customer Order Detail
	@GetMapping(value = "detail/{id}")
	public String showCusOrderDetail(@PathVariable("id") int cusId, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("adminLoginId") != null) {
			List<VoucherBean> vou_list = CustomerDAO.getVoucher(cusId);
			model.addAttribute("vou_list", vou_list);
			return "cusOrderAdminSite";
		} else {
			return "redirect:/";
		}
	}

	// view Customer Order Detail
	@GetMapping(value = "/detail/viewCustomerOrderDetail/{id}")
	public String viewCusOrderDetailAdminSite(@PathVariable("id") int vouId, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("adminLoginId") != null) {
			List<CartBean> cartList = CartDAO.productByVoucherId(vouId);
			model.addAttribute("cartList", cartList);
			double total = CustomerDAO.getTotalAmount(vouId);

			String tax = null;
			if (total - 1.5 >= 150) {
				tax = "Tax Free";
			} else {
				tax = "included Tax - $1.5";
			}
			model.addAttribute("tax", tax);

			model.addAttribute("total", total);
			return "viewCusOrderDetailAdminSite";
		} else {
			return "redirect:/";
		}
	}

	// removed products
	@GetMapping(value = "/removedProduct")
	public String removedProduct(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("adminLoginId") != null) {
			List<ProductBean> lst = ProductDAO.selectRemovedProduct();
			model.addAttribute("pro_lst", lst);
			return "removedProduct";
		} else {
			return "redirect:/";
		}
	}

	private static String generateCoupon() {
		// Generate a random UUID
		UUID uuid = UUID.randomUUID();
		// Extract a portion of the UUID and convert it to a string
		String coupon = "M49" + uuid.toString().replaceAll("-", "").substring(0, 5);
		return coupon;
	}
}
