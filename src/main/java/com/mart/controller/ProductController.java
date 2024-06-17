package com.mart.controller;

import java.io.IOException;
import java.util.Base64;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mart.dao.CategoryDAO;
import com.mart.dao.ProductDAO;
import com.mart.model.CategoryBean;
import com.mart.model.ProductBean;

@Controller
public class ProductController {

	@GetMapping(value = { "/" })
	public String getHome(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "12") int size) {
		ProductDAO proDao = new ProductDAO();

		int totalProducts = proDao.getTotalProducts();
		int totalPages = (int) Math.ceil(totalProducts / size);
		List<CategoryBean> lst = CategoryDAO.selectCategory();
		List<ProductBean> proLst = proDao.getProductByPage(page, size);

		model.addAttribute("cateLst", lst);
		model.addAttribute("proLst", proLst);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", page);

		return "home";
	}

	@GetMapping(value = "{id}")
	public String anotherHome(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "12") int size, @PathVariable("id") int cateId) {
		ProductDAO proDao = new ProductDAO();

		int totalProducts = proDao.getTotalProducts();
		int totalPages = (int) Math.ceil(totalProducts / size);
		List<CategoryBean> lst = CategoryDAO.selectCategory();
		List<ProductBean> proLst = proDao.getProductByCateByPage(cateId, page, size);

		model.addAttribute("cateLst", lst);
		model.addAttribute("proLst", proLst);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", page);

		return "home";
	}

	// shop
	@GetMapping(value = { "/shop", "shopDetail/shop", "/shop/{id}", "/shop/shop/{id}", "/shop/shop/shop/{id}",
			"/shop/shop/shop/shop/{id}" })
	public String getShop(Model model, @PathVariable(required = false) Integer id,
			@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "9") int size) {
		ProductDAO proDao = new ProductDAO();
		int totalProducts = proDao.getTotalProducts();
		int totalPages = (int) Math.ceil(totalProducts / size);
		List<CategoryBean> lst = proDao.countProduct();
		List<ProductBean> proLst;

		if (id != null) {
			proLst = proDao.getProductByCateByPage(id, page, size);
			model.addAttribute("cateId", id);
		} else {
			proLst = proDao.getProductByPage(page, size);
		}

		model.addAttribute("cateLst", lst);
		model.addAttribute("proLst", proLst);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", page);

		return "shop";
	}

	// product search
	@GetMapping(value = { "/search", "/shop/search" })
	public String productSearch(@RequestParam("search") String name, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "9") int size, Model model) {
		ProductDAO proDao = new ProductDAO();
		int totalProducts = proDao.getTotalProducts();
		int totalPages = (int) Math.ceil(totalProducts / size);
		List<CategoryBean> lst = proDao.countProduct();
		List<ProductBean> proLst;

		if (name != null) {
			proLst = proDao.searchProduct(name);
			model.addAttribute("cateId", name);
		} else {
			proLst = proDao.getProductByPage(page, size);
		}

		model.addAttribute("cateLst", lst);
		model.addAttribute("proLst", proLst);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", page);

		return "shop";
	}

	// addProduct
	/*
	 * @GetMapping(value = { "/add-product", "/adminProfile/add-product" }) public
	 * String addProduct(Model model, HttpServletRequest request) { HttpSession
	 * session = request.getSession(false); if (session != null &&
	 * session.getAttribute("adminLoginId") != null) { List<CategoryBean> list =
	 * CategoryDAO.selectCategory(); model.addAttribute("lst", list); return
	 * "addProduct"; } else { return "redirect:/"; } }
	 */

	// addProduct
	@PostMapping(value = "/addProduct")
	public String addProductData(@RequestParam("name") String name, @RequestParam("description") String description,
			@RequestParam("stock_qty") int stock_qty, @RequestParam("price") double price,
			@RequestParam("pro_cate_id") int pro_cate_id, @RequestParam("file") MultipartFile file, ModelMap model,
			RedirectAttributes ra, HttpServletRequest request) throws IOException {

		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("adminLoginId") != null) {
			int adminId = (int) session.getAttribute("adminLoginId");
			ProductBean product = new ProductBean();
			product.setAdminId(adminId);
			product.setName(name);
			product.setDescription(description);
			product.setStock_qty(stock_qty);
			product.setUnit_price(price);
			product.setPro_cate_id(pro_cate_id);
			product.setImage(Base64.getEncoder().encodeToString(file.getBytes()));
			ProductDAO proDao = new ProductDAO();
			proDao.insertProduct(product);
		}

		ra.addFlashAttribute("message", "New Product adds to the Shop");
		return "redirect:/product";
	}

	// addCategory

	@GetMapping(value = { "/add-category"})
	public String addCategory(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("adminLoginId") != null) {
			return "addCategory";
		} else {
			return "redirect:/";
		}
	}

	// addCategory
	@PostMapping(value = "/addCategory")
	public String addCategoryData(@RequestParam("name") String name, @RequestParam("imgFile") MultipartFile imgFile,
			RedirectAttributes ra, HttpServletRequest request) throws IOException {

		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("adminLoginId") != null) {
			int adminId = (int) session.getAttribute("adminLoginId");
			CategoryBean cateBean = new CategoryBean();
			cateBean.setName(name);
			cateBean.setAdmin_id(adminId);
			cateBean.setImage(Base64.getEncoder().encodeToString(imgFile.getBytes()));
			CategoryDAO cateDao = new CategoryDAO();
			cateDao.insertCategory(cateBean);
		}
		ra.addFlashAttribute("message", "New Product adds to the Shop");
		return "redirect:/product";
	}

	// shopDetail
	@GetMapping(value = "/shopDetail/{id}")
	public String shopDetail(@PathVariable("id") int proId, Model model) {

		ProductBean bean = ProductDAO.selectProductById(proId);
		model.addAttribute("bean", bean);

		ProductDAO proDao = new ProductDAO();

		List<CategoryBean> cateLst = proDao.countProduct();
		model.addAttribute("cateLst", cateLst);

		List<ProductBean> proLst = proDao.relatedProduct(proDao.getCategotyId(proId), proId);
		model.addAttribute("proLst", proLst);

		return "shopDetail";
	}

	@GetMapping(value = { "/product" })
	public String getProduct(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("adminLoginId") != null) {
			ProductDAO proDao = new ProductDAO();
			List<ProductBean> prolst = proDao.selectProduct();
			model.addAttribute("prolst", prolst);
			List<CategoryBean> catelst = proDao.countProduct();
			model.addAttribute("catelst", catelst);
			List<CategoryBean> list = CategoryDAO.selectCategory();
			model.addAttribute("lst", list);

			return "product";
		} else {
			return "redirect:/";
		}
	}

	/*
	 * @GetMapping(value = { "/category" }) public String getCate(Model model,
	 * HttpServletRequest request) {
	 * 
	 * HttpSession session = request.getSession(false); if (session != null &&
	 * session.getAttribute("adminLoginId") != null) { ProductDAO proDao = new
	 * ProductDAO(); List<CategoryBean> catelst = proDao.countProduct();
	 * model.addAttribute("catelst", catelst); return "category"; } else { return
	 * "redirect:/"; } }
	 */

	// productDetail
	@GetMapping(value = "/detailProduct/{id}")
	public String productDetail(@PathVariable("id") int proId, Model model) {

		ProductBean bean = ProductDAO.selectProductById(proId);
		model.addAttribute("bean", bean);
		return "productDetail";
	}

	// updateProduct
	@PostMapping(value = "/updateProduct")
	public String updateProduct(HttpServletRequest request, Model model, @RequestParam("id") int id,
			@RequestParam("name") String name, @RequestParam("unitInstock") int instock,
			@RequestParam("unitPrice") double price, @RequestParam("desc") String desc) {
		ProductBean product = new ProductBean();
		product.setId(id);
		product.setName(name);
		product.setUnit_price(price);
		product.setDescription(desc);
		product.setStock_qty(instock);

		int rs = ProductDAO.updateProduct(product);
		if (rs == 0) {
			model.addAttribute("error", "Failed to update product information.");
			return "error";
		} else {
			return "redirect:/product";
		}
	}

	@GetMapping(value = "/deleteProduct/{id}")
	public String softDeleteProduct(@PathVariable("id") int proId, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("adminLoginId") != null) {
			ProductDAO.softDelete(proId);
			return "redirect:/product";
		}
		return "redirect:/";
	}

	@GetMapping(value = "/add/{id}")
	public String readdProduct(@PathVariable("id") int proId, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("adminLoginId") != null) {
			ProductDAO.readdProduct(proId);
			return "redirect:/removedProduct";
		}
		return "redirect:/";
	}

}
