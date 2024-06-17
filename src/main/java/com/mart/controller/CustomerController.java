package com.mart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mart.dao.CartDAO;
import com.mart.dao.CustomerDAO;
import com.mart.model.CartBean;
import com.mart.model.CustomerBean;
import com.mart.model.VoucherBean;

@Controller
public class CustomerController {

	@GetMapping(value = { "/login", "shopDetail/login" })
	public String getLoginForm(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		Integer customerId = (Integer) session.getAttribute("customerLoginId");
		if (session != null && customerId != null) {
			CustomerBean bean = CustomerDAO.selectCustomerById(customerId.intValue());
			model.addAttribute("customer", bean);
			return "customerProfile";
		} else if (session != null && session.getAttribute("adminLoginId") != null) {
			return "redirect:/";
		} else {
			return "login";
		}
	}

	// customerLogin
	@PostMapping(value = { "/customerLogin", "shopDetail/customerLogin" })
	public String CustomerLogin(@RequestParam("email") String email, @RequestParam("password") String password,
			HttpServletRequest request, RedirectAttributes redirectAttribute, Model model) {
		CustomerDAO cusDao = new CustomerDAO();
		CustomerBean existCustomer = cusDao.selectCustomer(email, password);

		if (existCustomer != null && existCustomer.getPassword() != null) {
			request.getSession(false).setAttribute("customerLoginId", existCustomer.getId());
			return "redirect:/";
		} else {
			redirectAttribute.addFlashAttribute("error", "Incorrect Password");
			return "redirect:/login";
		}
	}

	@GetMapping(value = "/customerReg")
	public String getCustomerReg(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("adminLoginId") != null) {
			return "redirect:/";
		} else {
			model.addAttribute("cusObj", new CustomerBean());
			return "customerReg";
		}
	}

	// customerRegister
	@PostMapping(value = "/signup")
	public String signUp(@ModelAttribute("cusObj") @Validated CustomerBean bean, BindingResult result, ModelMap model,
			RedirectAttributes redirectAttributes, HttpServletRequest request) {

		if (result.hasErrors()) {
			model.addAttribute("error", "invalid");
			return "customerReg";
		}

		int rs = CustomerDAO.insertData(bean);
		if (rs == 0) {
			redirectAttributes.addFlashAttribute("message", "Registration failed. Please try again.");
			return "customerReg";
		}
		CustomerDAO cusDao = new CustomerDAO();
		CustomerBean existCustomer = cusDao.selectCustomer(bean.getEmail(), bean.getPassword());
		request.getSession(false).setAttribute("customerLoginId", existCustomer.getId());
		return "redirect:/";
	}

	@GetMapping(value = { "/viewCustomer", "/adminProfile/viewCustomer" })
	public String ViewCustomer(Model model) {
		List<CustomerBean> lst = CustomerDAO.selectAllCustomer();
		model.addAttribute("cus_lst", lst);
		return "showCustomer";
	}

	// view profile
	@GetMapping(value = "/profileCustomer")
	public String profileView(HttpServletRequest request, Model model) {

		Integer customerId = (Integer) request.getSession().getAttribute("customerLoginId");

		if (customerId != null) {
			CustomerBean customer = CustomerDAO.selectCustomerById(customerId);
			model.addAttribute("customer", customer);
			return "customerProfile";
		} else {
			return "redirect:/login";
		}
	}

	// update form
	@GetMapping(value = "/Updating")
	public String UpdateForm(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("customerLoginId") != null) {
			int customerId = (int) session.getAttribute("customerLoginId");
			CustomerBean customer = CustomerDAO.selectCustomerById(customerId);
			model.addAttribute("customer", customer);

			return "customerUpdate";
		} else {
			return "redirect:/login";
		}
	}

	// Updated
	@PostMapping(value = "/Updated")
	public String updateCustomer(@ModelAttribute("customer") @Validated CustomerBean customer, BindingResult result,
			HttpServletRequest request, Model model) {
		if (result.hasErrors()) {

			return "customerUpdate";
		}

		int rs = CustomerDAO.updateCustomer(customer);
		if (rs == 0) {

			model.addAttribute("error", "Failed to update customer information.");
			return "error";
		} else {
			return "redirect:/profileCustomer";
		}
	}

	// Change Password
	@GetMapping("/changePassword")
	public String showChangePasswordForm(HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("customerLoginId") != null) {
			return "customerPassword"; // Return the view containing the form
		} else {
			return "redirect:/";
		}
	}

	@PostMapping("/changePassword")
	public String changePassword(@RequestParam("currentPassword") String currentPassword,
			@RequestParam("newPassword") String newPassword, HttpServletRequest request,
			Model model) {
		// Retrieve the current user's ID from the session
		Integer customerId = (Integer) request.getSession().getAttribute("customerLoginId");

		if (customerId != null) {
			// Retrieve customer details from the database
			CustomerBean customer = CustomerDAO.selectCustomerById(customerId);

			if (customer != null && customer.getPassword().equals(currentPassword)) {
				// Update the password in the database

				int result = CustomerDAO.changePassword(customerId, newPassword);
				if (result != 0) {
					// Password changed successfully
					model.addAttribute("message", "Password changed successfully!");
					return "redirect:/profileCustomer";
				} else {
					// Failed to update password
					model.addAttribute("message", "Failed to change password.");
				}
			} else {
				// Incorrect current password
				model.addAttribute("message", "Incorrect current password.");
			}
		}
		// Redirect back to the change password form
		return "redirect:/changePassword";
	}

	// my order
	@GetMapping(value = { "/myorder" })
	public String myOrder(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("customerLoginId") != null) {
			Integer cusId = (Integer) session.getAttribute("customerLoginId");
			List<VoucherBean> vou_list = CustomerDAO.getVoucher(cusId);
			model.addAttribute("vou_list", vou_list);
			return "myOrder";
		} else {
			return "redirect:/";
		}
	}

	// view order detail
	@GetMapping(value = "/viewMyOrderDetail/{id}")
	public String customerOrderDetail(@PathVariable("id") int vouId, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("customerLoginId") != null) {
			List<CartBean> cartList = CartDAO.productByVoucherId(vouId);
			model.addAttribute("cartList", cartList);
			double total = CustomerDAO.getTotalAmount(vouId);
			model.addAttribute("total", total);
			return "customerOrderDetail";
		} else {
			return "redirect:/";
		}
	}

}
