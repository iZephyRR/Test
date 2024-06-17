package com.mart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mart.model.CustomerBean;
import com.mart.model.VoucherBean;

public class CustomerDAO {

	public static Connection con = null;
	static {
		con = MyConnection.getConnection();
	}

	public static int insertData(CustomerBean bean) {

		int result = 0;
		String sql = "INSERT INTO customer (name,email,password,phone_number,address) VALUES (?,?,?,?,?)";

		try {
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, bean.getName());
			ps.setString(2, bean.getEmail());
			ps.setString(3, bean.getPassword());
			ps.setString(4, bean.getPhone());
			ps.setString(5, bean.getAddress());

			result = ps.executeUpdate();

		} catch (SQLException e) {
			System.out.println("insert customer : " + e);
		}
		return result;
	}

	// selectByEmail
	public CustomerBean selectCustomer(String email, String pass) {
		CustomerBean bean = new CustomerBean();

		String sql = "select * from customer where email = ? and password=?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				bean.setId(rs.getInt("id"));
				bean.setName(rs.getString("name"));
				bean.setEmail(rs.getString("email"));
				bean.setPhone(rs.getString("phone_number"));
				bean.setPassword(rs.getString("password"));
				bean.setAddress(rs.getString("address"));
			}

		} catch (SQLException e) {
			System.out.println("select Customer By Email : " + e.getMessage());
		}
		return bean;
	}

	// selectAll
	public static List<CustomerBean> selectAllCustomer() {
		List<CustomerBean> lst = new ArrayList<CustomerBean>();

		String sql = "select * from customer";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CustomerBean bean = new CustomerBean();
				bean.setId(rs.getInt("id"));
				bean.setName(rs.getString("name"));
				bean.setEmail(rs.getString("email"));
				bean.setPhone(rs.getString("phone_number"));
				bean.setPassword(rs.getString("password"));
				bean.setAddress(rs.getString("address"));
				lst.add(bean);
			}

		} catch (SQLException e) {
			System.out.println("select Customer By Email : " + e.getMessage());
		}
		return lst;
	}

	// totalCustomer
	public static int countCustomer() {
		int count = 0;

		String sql = "select count(*) from customer";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("count customer : " + e.getMessage());
		}

		return count;
	}

	// select customer by Id
	public static CustomerBean selectCustomerById(int id) {
		CustomerBean bean = new CustomerBean();
		String sql = "select * from customer where id = ?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				bean.setId(rs.getInt("id"));
				bean.setName(rs.getString("name"));
				bean.setEmail(rs.getString("email"));
				bean.setPhone(rs.getString("phone_number"));
				bean.setPassword(rs.getString("password"));
				bean.setAddress(rs.getString("address"));
			}

		} catch (SQLException e) {
			System.out.println("select Customer By Email : " + e.getMessage());
		}
		return bean;
	}

	// Data Update
	public static int updateCustomer(CustomerBean customer) {
		int result = 0;
		String sql = "UPDATE customer SET name=?, address=?, phone_number=?,  email=?  WHERE id=?";

		try (PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, customer.getName());
			ps.setString(2, customer.getAddress());
			ps.setString(3, customer.getPhone());
			ps.setString(4, customer.getEmail());
			ps.setInt(5, customer.getId());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// Log the exception or handle it appropriately
			System.out.println("Database error update: " + e);
		}

		return result;
	}

	// delete Account
	public static int deleteData(CustomerBean customer) {
		int result = 0;
		String sql = "DELETE FROM customer where id=?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, customer.getId());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Database error delete" + e);
		}
		return result;
	}

	// change password
	public static int changePassword(int customerId, String newPassword) {
		int result = 0;
		String sql = "UPDATE customer SET password=? WHERE id=?";

		try (PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, newPassword);
			ps.setInt(2, customerId);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// Log the exception or handle it appropriately
			System.out.println("Database error update password: " + e);
		}
		return result;
	}
	
	//select Voucher for customer
	public static List<VoucherBean> getVoucher(int cusId){
		List<VoucherBean> lst = new ArrayList<>();
		String sql = "select v.id, v.date,v.total_amount , v.ordered_name, v.ordered_address,v.confirm ,v.percent, pay.payment_method as method , count(*) as pro_qty  from  cart c\r\n"
				+ "inner join voucher v on v.id = c.voucher_id inner join payment pay  on v.payment_payment_id = pay.id  where v.customer_id="+cusId+" group by v.id";
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
				bean.setConfirm(rs.getString("confirm"));
				bean.setDis_percent(rs.getInt("percent"));
				lst.add(bean);
			}
		} catch (SQLException e) {
			System.out.println("get Voucher : "+ e.getMessage());
		}
		return lst;
	}
	
	//select total_amount from  voucher
	public static double getTotalAmount(int vouId) {
		double total = 0.0;
		String sql = "select total_amount from voucher where id="+vouId;
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				total = rs.getDouble("total_amount");
			}
		} catch (SQLException e) {
			System.out.println("get total amount : "+ e.getMessage());
		}
		return total;
	}
}
