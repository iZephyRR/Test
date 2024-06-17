package com.mart.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mart.model.CategoryBean;
import com.mart.model.ProductBean;

public class ProductDAO {

	public static Connection con = null;
	static {
		con = MyConnection.getConnection();
	}

	// insert
	public int insertProduct(ProductBean bean) {
		int result = 0;

		String sql = "insert into product (name ,description, unit_price, stock_qty, "
				+ "product_category_id , admin_id, image, is_delete) " + "values (?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, bean.getName());
			ps.setString(2, bean.getDescription());
			ps.setDouble(3, bean.getUnit_price());
			ps.setInt(4, bean.getStock_qty());
			ps.setInt(5, bean.getPro_cate_id());
			ps.setInt(6, bean.getAdminId());
			ps.setString(7, bean.getImage());
			ps.setInt(8, 0);

			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insert product :" + e.getMessage());
		}
		return result;
	}

	public List<ProductBean> getProductByPage(int pageNumber, int pageSize) {
		List<ProductBean> lst = new ArrayList<ProductBean>();

		String sql = "SELECT p.*, pc.name AS pcname FROM product p INNER JOIN product_category pc ON pc.id = p.product_category_id \r\n"
				+ "WHERE p.is_delete = " + 0 + " ORDER BY RAND() LIMIT ?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, pageSize);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ProductBean bean = new ProductBean();
				bean.setId(rs.getInt("id"));
				bean.setName(rs.getString("name"));
				bean.setUnit_price(rs.getDouble("unit_price"));
				bean.setStock_qty(rs.getInt("stock_qty"));
				bean.setDescription(rs.getString("description"));
				bean.setImage(rs.getString("image"));
				bean.setPro_cate(rs.getString("pcname"));
				lst.add(bean);
			}
		} catch (SQLException e) {
			System.out.println("limit product :" + e.getMessage());
		}
		return lst;
	}

	public List<ProductBean> getProductByCateByPage(int cateId, int pageNumber, int pageSize) {
		List<ProductBean> lst = new ArrayList<ProductBean>();
		String sql = "select p.*, pc.name as pcname from product p inner join product_category pc on pc.id= p.product_category_id "
				+ "where p.is_delete = " + 0 + " and product_category_id=? limit ?,?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, cateId);
			ps.setInt(2, (pageNumber - 1) * pageSize);
			ps.setInt(3, pageSize);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ProductBean bean = new ProductBean();
				bean.setId(rs.getInt("id"));
				bean.setName(rs.getString("name"));
				bean.setUnit_price(rs.getDouble("unit_price"));
				bean.setStock_qty(rs.getInt("stock_qty"));
				bean.setDescription(rs.getString("description"));
				bean.setImage(rs.getString("image"));
				bean.setPro_cate(rs.getString("pcname"));
				lst.add(bean);
			}
		} catch (SQLException e) {
			System.out.println("limit product :" + e.getMessage());
		}
		return lst;
	}

	// search product
	public List<ProductBean> searchProduct(String name) {
		List<ProductBean> lst = new ArrayList<ProductBean>();
		String sql = "select p.*, pc.name as pcname from product p inner join product_category pc on pc.id= p.product_category_id "
				+ "where p.is_delete = " + 0 + " and p.name like ? ";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "%" + name + "%");
			/*
			 * ps.setInt(2, (pageNumber - 1) * pageSize); ps.setInt(3, pageSize);
			 */
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ProductBean bean = new ProductBean();
				bean.setId(rs.getInt("id"));
				bean.setName(rs.getString("name"));
				bean.setUnit_price(rs.getDouble("unit_price"));
				bean.setStock_qty(rs.getInt("stock_qty"));
				bean.setDescription(rs.getString("description"));
				bean.setImage(rs.getString("image"));
				bean.setPro_cate(rs.getString("pcname"));
				lst.add(bean);
			}
		} catch (SQLException e) {
			System.out.println("limit product :" + e.getMessage());
		}
		return lst;
	}

	// count total Product
	public int getTotalProducts() {
		int totalProducts = 0;
		String sql = "select count(*) from product";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				totalProducts = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("count product :" + e.getMessage());
		}
		return totalProducts;
	}

	// selectAll not delete
	public List<ProductBean> selectProduct() {
		List<ProductBean> lst = new ArrayList<ProductBean>();

		String sql = "select p.*, pc.name as pcname from product p inner join product_category pc on \r\n"
				+ "pc.id= p.product_category_id where p.is_delete = " + 0;
		try {
			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ProductBean bean = new ProductBean();
				bean.setId(rs.getInt("id"));
				bean.setName(rs.getString("name"));
				bean.setUnit_price(rs.getDouble("unit_price"));
				bean.setStock_qty(rs.getInt("stock_qty"));
				bean.setDescription(rs.getString("description"));
				bean.setImage(rs.getString("image"));
				bean.setPro_cate(rs.getString("pcname"));
				lst.add(bean);
			}

		} catch (SQLException e) {
			System.out.println("select product :" + e.getMessage());
		}
		return lst;
	}

	// selectAll delete
	public static List<ProductBean> selectRemovedProduct() {
		List<ProductBean> lst = new ArrayList<ProductBean>();

		String sql = "select p.*, pc.name as pcname from product p inner join product_category pc on \r\n"
				+ "pc.id= p.product_category_id where p.is_delete = " + 1;
		try {
			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ProductBean bean = new ProductBean();
				bean.setId(rs.getInt("id"));
				bean.setName(rs.getString("name"));
				bean.setUnit_price(rs.getDouble("unit_price"));
				bean.setStock_qty(rs.getInt("stock_qty"));
				bean.setDescription(rs.getString("description"));
				bean.setImage(rs.getString("image"));
				bean.setPro_cate(rs.getString("pcname"));
				lst.add(bean);
			}

		} catch (SQLException e) {
			System.out.println("select product :" + e.getMessage());
		}
		return lst;
	}

	// selectByCateId
	public static List<ProductBean> selectProductByCateId(int id) {
		List<ProductBean> lst = new ArrayList<>();

		String sql = "select p.id,p.name,p.unit_price,p.stock_qty,p.image,p.description, pc.name as pcname from product p "
				+ "inner join product_category pc on pc.id= p.product_category_id where pc.id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();
				bean.setId(rs.getInt("id"));
				bean.setName(rs.getString("name"));
				bean.setUnit_price(rs.getDouble("unit_price"));
				bean.setStock_qty(rs.getInt("stock_qty"));
				bean.setDescription(rs.getString("description"));
				bean.setImage(rs.getString("image"));
				bean.setPro_cate(rs.getString("pcname"));

			}
		} catch (SQLException e) {
			System.out.println("select product :" + e.getMessage());
		}
		return lst;
	}

	// selectByProId
	public static ProductBean selectProductById(int id) {
		ProductBean bean = new ProductBean();

		String sql = "select p.id,p.name,p.unit_price,p.stock_qty,p.image,p.description, pc.name as pcname from product p inner join product_category pc on"
				+ " pc.id= p.product_category_id where p.id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				bean.setId(rs.getInt("id"));
				bean.setName(rs.getString("name"));
				bean.setUnit_price(rs.getDouble("unit_price"));
				bean.setStock_qty(rs.getInt("stock_qty"));
				bean.setDescription(rs.getString("description"));
				bean.setImage(rs.getString("image"));
				bean.setPro_cate(rs.getString("pcname"));

			}
		} catch (SQLException e) {
			System.out.println("select product :" + e.getMessage());
		}
		return bean;
	}

	// count
	public List<CategoryBean> countProduct() {

		List<CategoryBean> lst = new ArrayList<CategoryBean>();
		String sql = "select pc.id, pc.name, count(*) as Amount_of_Product from product_category pc inner join product p on "
				+ "pc.id = p.product_category_id group by pc.id";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CategoryBean bean = new CategoryBean();
				bean.setId(rs.getInt("id"));
				bean.setName(rs.getString("name"));
				bean.setCount(rs.getInt("Amount_of_product"));

				lst.add(bean);
			}

		} catch (SQLException e) {
			System.out.println("select count :" + e.getMessage());
		}
		return lst;
	}

	// getCategoryId
	public int getCategotyId(int proId) {
		int cateId = 0;
		String sql = "select product_category_id from product where id = ?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, proId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				cateId = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("select categoryId :" + e.getMessage());
		}

		return cateId;
	}

	// relatedProduct
	public List<ProductBean> relatedProduct(int cateId, int proId) {
		List<ProductBean> lst = new ArrayList<ProductBean>();
		String sql = "select p.id,p.name,p.unit_price,p.stock_qty,p.image,p.description, pc.name as pcname from product p "
				+ "inner join product_category pc on pc.id= p.product_category_id where p.product_category_id=? "
				+ "and p.is_delete=? and p.id <>" + proId;
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, cateId);
			ps.setInt(2, 0);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();
				bean.setId(rs.getInt("id"));
				bean.setName(rs.getString("name"));
				bean.setUnit_price(rs.getDouble("unit_price"));
				bean.setStock_qty(rs.getInt("stock_qty"));
				bean.setDescription(rs.getString("description"));
				bean.setImage(rs.getString("image"));
				bean.setPro_cate(rs.getString("pcname"));
				lst.add(bean);
			}

		} catch (SQLException e) {
			System.out.println("select meat :" + e.getMessage());
		}
		return lst;
	}

	// updateQty
	public static boolean updateQty(int id, int newQty) {
		boolean success = true;
		String sql = "update product set stock_qty = ? where id = ?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, newQty);
			ps.setInt(2, id);

			success = ps.execute();

		} catch (SQLException e) {
			System.out.println("update qty :" + e.getMessage());
		}
		return success;
	}

	// selectByAdminId
	public static List<ProductBean> selectByAdminId(int adminId) {
		List<ProductBean> lst = new ArrayList<ProductBean>();
		String sql = "select p.id,p.name,p.unit_price,p.stock_qty,p.image, pc.name as pcname from product p "
				+ "inner join product_category pc on pc.id= p.product_category_id where p.admin_id = ?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, adminId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ProductBean bean = new ProductBean();
				bean.setName(rs.getString("name"));
				/* bean.setDescription(rs.getString("description")); */
				bean.setUnit_price(rs.getDouble("unit_price"));
				bean.setStock_qty(rs.getInt("stock_qty"));
				bean.setImage(rs.getString("image"));
				bean.setPro_cate(rs.getString("pcname"));

				lst.add(bean);
			}
		} catch (SQLException e) {
			System.out.println("selectByAdminId :" + e.getMessage());
		}
		return lst;
	}

	// select qty
	public static int getQty(int id) {
		int qty = 0;
		String sql = "select stock_qty from product where id =" + id;
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				qty = rs.getInt("stock_qty");
			}
		} catch (SQLException e) {
			System.out.println("get qty : " + e.getMessage());
		}
		return qty;
	}

	// update Product
	public static int updateProduct(ProductBean product) {
		int result = 0;
		String sql = "UPDATE product SET name=?,description=?,unit_price=?,stock_qty=? WHERE id=?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, product.getName());
			ps.setString(2, product.getDescription());
			ps.setDouble(3, product.getUnit_price());
			ps.setInt(4, product.getStock_qty());
			ps.setInt(5, product.getId());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// Log the exception or handle it appropriately
			System.out.println("Database update product : " + e.getMessage());
		}

		return result;
	}

	// soft delete Product
	public static int softDelete(int id) {
		int result = 0;
		String sql = "UPDATE product SET is_delete = " + 1 + " WHERE id=?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// Log the exception or handle it appropriately
			System.out.println("Database softdelete product : " + e.getMessage());
		}
		return result;
	}

	// add product again
	public static int readdProduct(int id) {
		int result = 0;
		String sql = "UPDATE product SET is_delete =" + 0 + " WHERE id=?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// Log the exception or handle it appropriately
			System.out.println("Database readd product : " + e.getMessage());
		}

		return result;
	}

}
