package com.mart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mart.model.AdminBean;
import com.mart.model.CouponBean;

public class AdminDAO {

	public static Connection con = null;
	static {
		con = MyConnection.getConnection();
	}

	// insert
	public static int insertAdmin(AdminBean admin) {
		int result = 0;
		String sql = "INSERT INTO admin (name,email,password,phone,super) VALUES (?,?,?,?,?)";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, admin.getName());
			ps.setString(2, admin.getEmail());
			ps.setString(3, admin.getPassword());
			ps.setString(4, admin.getPhone());
			ps.setInt(5, admin.getRole());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insert admin : " + e.getMessage());
		}
		return result;
	}

	// selectByEmail
	public static AdminBean selectAdmin(String email, String pass) {
		AdminBean bean = new AdminBean();
		String sql = "select * from admin where email = ? and password = ?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				bean.setId(rs.getInt("id"));
				bean.setName(rs.getString("name"));
				bean.setEmail(rs.getString("email"));
				bean.setPassword(rs.getString("password"));
				bean.setPhone(rs.getString("phone"));
				bean.setRole(rs.getInt("super"));
			}

		} catch (SQLException e) {
			System.out.println("select admin : " + e.getMessage());
		}
		return bean;
	}

	// selectById
	public static AdminBean selectAdminById(int id) {
		AdminBean bean = new AdminBean();
		String sql = "select * from admin where id = ?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				bean.setId(rs.getInt("id"));
				bean.setName(rs.getString("name"));
				bean.setEmail(rs.getString("email"));
				bean.setPassword(rs.getString("password"));
				bean.setPhone(rs.getString("phone"));
				bean.setRole(rs.getInt("super"));
			}

		} catch (SQLException e) {
			System.out.println("select admin : " + e.getMessage());
		}
		return bean;
	}

	// selectAll
	public static List<AdminBean> selectAllAdmin() {
		List<AdminBean> lst = new ArrayList<AdminBean>();

		String sql = "select * from admin";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			/* ps.setInt(1, 1); */
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				AdminBean bean = new AdminBean();
				bean.setId(rs.getInt("id"));
				bean.setName(rs.getString("name"));
				bean.setEmail(rs.getString("email"));
				bean.setPassword(rs.getString("password"));
				bean.setPhone(rs.getString("phone"));
				bean.setRole(rs.getInt("super"));
				lst.add(bean);
			}

		} catch (SQLException e) {
			System.out.println("select admin : " + e.getMessage());
		}
		return lst;
	}

	// create Coupon
	public static int createCoupon(CouponBean bean) {
		int success = 0;
		String sql = "insert into coupon(code,discount_percent,end_date,admin_id) values (?,?,?,?) ";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, bean.getCode());
			ps.setDouble(2, bean.getDis_percent());
			ps.setString(3, bean.getEndDate());
			ps.setInt(4, bean.getAdminId());
			success = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("create coupon : " + e.getMessage());
		}
		return success;
	}

	// select all coupon
	public static List<CouponBean> selectAllCoupon() {
		List<CouponBean> lst = new ArrayList<>();
		String sql = "select * from coupon";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CouponBean bean = new CouponBean();
				bean.setCode(rs.getString("code"));
				bean.setDis_percent(rs.getInt("discount_percent"));
				bean.setEndDate(rs.getString("end_date"));
				lst.add(bean);
			}
		} catch (SQLException e) {
			System.out.println("select all coupon : " + e.getMessage());
		}
		return lst;
	}

	// select coupon
	public static CouponBean selectCoupon(String code) {
		CouponBean bean = new CouponBean();
		String sql = "select * from coupon where code = ? ";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, code);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				bean.setId(rs.getInt("id"));
				bean.setCode(rs.getString("code"));
				bean.setDis_percent(rs.getInt("discount_percent"));
				bean.setEndDate(rs.getString("end_date"));
			}
		} catch (SQLException e) {
			System.out.println("Database error update: " + e);
		}
		return bean;
	}

	// ADMIN Update
	public static int updateAdmin(AdminBean bean) {
		int result = 0;
		String sql = "UPDATE admin SET name=?, email=?,  phone=?  WHERE id=?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, bean.getName());
			ps.setString(2, bean.getEmail());
			ps.setString(3, bean.getPhone());
			ps.setInt(4, bean.getId());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Database error update: " + e);
		}
		return result;
	}

	// change password
	public static int changePassword(int adminId, String newPassword) {
		int result = 0;
		String sql = "UPDATE admin SET password=? WHERE id=?";

		try (PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, newPassword);
			ps.setInt(2, adminId);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// Log the exception or handle it appropriately
			System.out.println("Database error update password: " + e);
		}
		return result;
	}

}
