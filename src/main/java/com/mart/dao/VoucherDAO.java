package com.mart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mart.model.VoucherBean;

public class VoucherDAO {

	public static Connection con = null;
	static {
		con = MyConnection.getConnection();
	}

	// insert voucher
	public static int insertVoucher(VoucherBean bean) {
		int result = 0;
		String sql = "insert into voucher(total_amount, date ,payment_payment_id,image,"
				+ "ordered_address,ordered_name,ordered_phone,customer_id, confirm,coupon_id,percent) "
				+ "values (?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setDouble(1, bean.getTotal_amount());
			ps.setString(2, bean.getDate());
			ps.setInt(3, bean.getPaymentId());
			ps.setString(4, bean.getImage());
			ps.setString(5, bean.getAddress());
			ps.setString(6, bean.getName());
			ps.setString(7, bean.getPhone());
			ps.setInt(8, bean.getCustomerId());
			ps.setString(9, "Order Pending");
			ps.setInt(10, bean.getCouponId());
			ps.setInt(11, bean.getDis_percent());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insert voucher : " + e.getMessage());
		}
		return result;
	}

	public static int insertVoucherwithoutCoupon(VoucherBean bean) {
		int result = 0;
		String sql = "insert into voucher(total_amount, date ,payment_payment_id,image,"
				+ "ordered_address,ordered_name,ordered_phone,customer_id, confirm) "
				+ "values (?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setDouble(1, bean.getTotal_amount());
			ps.setString(2, bean.getDate());
			ps.setInt(3, bean.getPaymentId());
			ps.setString(4, bean.getImage());
			ps.setString(5, bean.getAddress());
			ps.setString(6, bean.getName());
			ps.setString(7, bean.getPhone());
			ps.setInt(8, bean.getCustomerId());
			ps.setString(9, "Order Pending");
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insert voucher : " + e.getMessage());
		}
		return result;
	}
	
	// select Voucher ADMIN not confirm
	public static List<VoucherBean> selectVoucher() {
		List<VoucherBean> lst = new ArrayList<>();
		String sql = "select v.id,v.date,v.total_amount , v.ordered_name , pay.payment_method as method ,v.percent, count(*) as pro_qty  from  cart c "
				+ "inner join voucher v on v.id = c.voucher_id inner join payment pay  on v.payment_payment_id = pay.id  where v.admin_id is null group by v.id";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				VoucherBean bean = new VoucherBean();
				bean.setId(rs.getInt("id"));
				bean.setDate(rs.getString("date"));
				bean.setTotal_amount(rs.getDouble("total_amount"));
				bean.setName(rs.getString("ordered_name"));
				bean.setMethod(rs.getString("method"));
				bean.setPro_qty(rs.getInt("pro_qty"));
				bean.setDis_percent(rs.getInt("percent"));
				lst.add(bean);
			}
		} catch (SQLException e) {
			System.out.println("select voucher : " + e.getMessage());
		}
		return lst;
	}

	// select Voucher by id
	public static VoucherBean selectVoucherById(int id) {
		VoucherBean bean = new VoucherBean();
		String sql = "select v.total_amount , v.ordered_name,v.ordered_phone, v.ordered_address ,v.image, pay.payment_method as method , count(*) as pro_qty  from  cart c\r\n"
				+ "inner join voucher v on v.id = c.voucher_id inner join payment pay  on v.payment_payment_id = pay.id  where v.id=? group by v.id";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				bean.setId(id);
				bean.setTotal_amount(rs.getDouble("total_amount"));
				bean.setName(rs.getString("ordered_name"));
				bean.setMethod(rs.getString("method"));
				bean.setPro_qty(rs.getInt("pro_qty"));
				bean.setImage(rs.getString("image"));
				bean.setAddress(rs.getString("ordered_address"));
				bean.setPhone(rs.getString("ordered_phone"));
				
			}
		} catch (SQLException e) {
			System.out.println("select voucher : " + e.getMessage());
		}
		return bean;
	}

	// select voucher Id
	public static int selectVoucherId(int cusId, String date) {
	    int voucherId = 0;
	    String sql = "select id from voucher where customer_id = ? and date = ?";
	    try {
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setInt(1, cusId);
	        ps.setString(2, date);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            voucherId = rs.getInt("id");
	        }
	    } catch (SQLException e) {
	        System.out.println("select voucher Id : " + e.getMessage());
	    }
	    return voucherId;
	}

	
	//update Voucher by adding ADMIN_ID
	public static void addAdminIdToVoucher(int adminId , int vouId , String confirm) {
		String sql = "update voucher set admin_id = ?, confirm=? where id = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, adminId);
			ps.setString(2, confirm);
			ps.setInt(3, vouId);
			ps.execute();
		} catch (SQLException e) {
			System.out.println("add admin Id : "+e.getMessage());
		}
	}
	
	//total sale
	public static double totalSale() {
		double totalSale = 0.0;
		String sql ="select sum(total_amount) as total_sale from voucher where confirm = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Order Confirmed");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				totalSale = rs.getDouble("total_sale");
			}
		} catch (SQLException e) {
			System.out.println("total sale : "+e.getMessage());
		}
		return totalSale;
	}
	
	//select all voucher
	public static List<VoucherBean> selectAllVoucher() {
		List<VoucherBean> lst = new ArrayList<>();
		String sql = "select v.id,v.date,v.total_amount , v.ordered_name ,v.confirm, pay.payment_method as method ,v.percent, count(*) as pro_qty  from  cart c \r\n"
				+ "inner join voucher v on v.id = c.voucher_id inner join payment pay  on v.payment_payment_id = pay.id  where v.confirm <> ? group by v.id";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Order Pending");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				VoucherBean bean = new VoucherBean();
				bean.setId(rs.getInt("id"));
				bean.setDate(rs.getString("date"));
				bean.setTotal_amount(rs.getDouble("total_amount"));
				bean.setName(rs.getString("ordered_name"));
				bean.setMethod(rs.getString("method"));
				bean.setPro_qty(rs.getInt("pro_qty"));
				bean.setConfirm(rs.getString("confirm"));
				bean.setDis_percent(rs.getInt("percent"));
				lst.add(bean);
			}
		} catch (SQLException e) {
			System.out.println("select voucher : " + e.getMessage());
		}
		return lst;
	}
	
	//new order
	public static int newOrder() {
		int newOrder = 0 ;
		String sql = "select count(*) as new_order from voucher where confirm = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "Order Pending");
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				newOrder = rs.getInt("new_order");
			}
		} catch (SQLException e) {
			
		}
		return newOrder;
	}

}
