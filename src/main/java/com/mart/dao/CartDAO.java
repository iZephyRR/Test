package com.mart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.mart.model.CartBean;
import com.mart.model.PaymentBean;

public class CartDAO {

	public static Connection con = null;
	static {
		con = MyConnection.getConnection();
	}

	// searchProduct
	public CartBean searchProduct(int cus_id, int pro_id) {
		CartBean bean = new CartBean();
		String sql = "select * from cart where customer_id = ? and product_id=? and after_purchase = " + 0;

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, cus_id);
			ps.setInt(2, pro_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				bean.setId(rs.getInt("id"));
				bean.setCustomer_id(rs.getInt("customer_id"));
				bean.setPro_id(rs.getInt("product_id"));
				bean.setUnit_price(rs.getDouble("unit_price"));
				bean.setQty(rs.getInt("qty"));
				bean.setAmount(rs.getDouble("amount"));
				bean.setImage(rs.getString("image"));
			}
		} catch (SQLException e) {
			System.out.println("select cart by proID :" + e.getMessage());
		}
		return bean;
	}

	// insertCart
	public int insertProductToCart(CartBean cbean) {
		int result = 0;

		String sql = "insert into cart (customer_id, product_id, unit_price, qty, amount,after_purchase,image) values (?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, cbean.getCustomer_id());
			ps.setInt(2, cbean.getPro_id());
			ps.setDouble(3, cbean.getUnit_price());
			ps.setInt(4, cbean.getQty());
			ps.setDouble(5, cbean.getAmount());
			ps.setInt(6, 0);
			ps.setString(7, cbean.getImage());
			result = ps.executeUpdate();

		} catch (SQLException e) {
			System.out.println("insert products to cart :" + e.getMessage());
		}
		return result;
	}

	// select All Cart
	public static List<CartBean> selectAllCart(int id) {
		List<CartBean> lst = new ArrayList<CartBean>();

		String sql = "select p.name, p.unit_price,p.image, ca.qty, ca.amount, ca.id from cart ca "
				+ "inner join product p on p.id= ca.product_id where ca.customer_id= ? and after_purchase = ?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setInt(2, 0);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CartBean bean = new CartBean();
				bean.setId(rs.getInt("id"));
				bean.setName(rs.getString("name"));
				bean.setUnit_price(rs.getDouble("unit_price"));
				bean.setQty(rs.getInt("qty"));
				bean.setAmount(rs.getDouble("amount"));
				bean.setImage(rs.getString("image"));
				lst.add(bean);
			}
		} catch (SQLException e) {
			System.out.println("select cart :" + e.getMessage());
		}
		return lst;
	}

	// TotalAmount
	public static double totalAmount(int id) {
		double total = 0;
		String sql = "select sum(amount) as total from cart where customer_id = ? and after_purchase =" + 0;
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				total = rs.getDouble("total");
			}
		} catch (SQLException e) {
			System.out.println("total cart :" + e.getMessage());
		}
		return total;
	}

	// updateCart
	public boolean updateCart(int id, int qty, double amount) {
		boolean success = true;
		String sql = "update cart set qty =? , amount = ? where id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, qty);
			ps.setDouble(2, amount);
			ps.setInt(3, id);
			success = ps.execute();
		} catch (SQLException e) {
			System.out.println("update cart :" + e.getMessage());
		}
		return success;
	}

	// deleteProductFromCart
	public static boolean deleteProFromCart(int id) {
		boolean success = true;
		String sql = "delete from cart where id = ? and after_purchase =" + 0;
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			success = ps.execute();
		} catch (SQLException e) {
			System.out.println("delete cart :" + e.getMessage());
		}
		return success;
	}

	// select Payment
	public static List<PaymentBean> selectPayment() {
		List<PaymentBean> lst = new ArrayList<PaymentBean>();

		String sql = "select * from payment";
		try {
			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				PaymentBean pbean = new PaymentBean();
				pbean.setId(rs.getInt("id"));
				pbean.setName(rs.getString("payment_method"));
				/* pbean.setPhone(rs.getString("phone_number")); */
				lst.add(pbean);
			}
		} catch (SQLException e) {
			System.out.println("select payment : " + e.getMessage());
		}
		return lst;
	}

	// insert voucher ID
	public static boolean insertVoucherId(int voucherId, int cusId) {
		boolean result = true;
		String sql = "update cart set voucher_id =? , after_purchase = "+1+" where customer_id = ? and after_purchase = " + 0;
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, voucherId);
			ps.setInt(2, cusId);
			result = ps.execute();
		} catch (SQLException e) {
			System.out.println("insert voucher Id : " + e.getMessage());
		}
		return result;
	}
	
	//select product by voucher ID
	public static List<CartBean> productByVoucherId(int voucherId){
		List<CartBean> lst = new ArrayList<>();
		String sql ="select p.name, p.unit_price,p.image, ca.qty, ca.amount from cart ca inner join product p on p.id= ca.product_id where ca.voucher_id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, voucherId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CartBean bean = new CartBean();
				bean.setName(rs.getString("name"));
				bean.setUnit_price(rs.getDouble("unit_price"));
				bean.setQty(rs.getInt("qty"));
				bean.setAmount(rs.getDouble("amount"));
				bean.setImage(rs.getString("image"));
				lst.add(bean) ;
			}
			
		} catch (SQLException e) {
			System.out.println("select product by voucher ID : " + e.getMessage());
		}
		
		return lst;
	}
	
	//select pro_id by vou_id
	public static List<CartBean> selectProIdByVouId(int vouID) {
		List<CartBean> lst= new ArrayList<>();
		String sql = "select product_id , qty from cart where voucher_id="+vouID;
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CartBean bean = new CartBean();
				bean.setPro_id(rs.getInt("product_id"));
				bean.setQty(rs.getInt("qty"));
				lst.add(bean);
			}
		} catch (SQLException e) {
			System.out.println("select pro_id by vou_id : "+ e.getMessage());
		}
		return lst;
	}
	
	//delete cart by cusId
	public static boolean deleteCartByCusId(int cusId) {
		boolean success = true;
		String sql = "delete from cart where customer_id = ? and after_purchase =" + 0;
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, cusId);
			success = ps.execute();
		} catch (SQLException e) {
			System.out.println("delete cart :" + e.getMessage());
		}
		return success;
	}
}
