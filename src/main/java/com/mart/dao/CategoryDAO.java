package com.mart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mart.model.CategoryBean;

public class CategoryDAO {
	
	public static Connection con = null;
	static {
		con = MyConnection.getConnection();
	}
	
	public  int insertCategory(CategoryBean bean) {
		int result = 0;
		
		String sql = "insert into product_category(name,image,is_delete,admin_id) values(?,?,?,?)";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, bean.getName());
			ps.setString(2, bean.getImage());
			ps.setInt(3, 0);
			ps.setInt(4, bean.getAdmin_id());
			result = ps.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("insert category : " +e.getMessage());
		}
		return result;
	}
	
	//selectAll
	public static List<CategoryBean> selectCategory(){
		
		List<CategoryBean> lst = new ArrayList<CategoryBean>();
		String sql = "select * from product_category where is_delete = ?";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, 0);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				CategoryBean bean = new CategoryBean();
				bean.setId(rs.getInt("id"));
				bean.setName(rs.getString("name"));
				bean.setImage(rs.getString("image"));
				
				lst.add(bean);
			}
			
		} catch (SQLException e) {
			System.out.println("select category : " +e.getMessage());
		}
		
		return lst;
	}
	
}
