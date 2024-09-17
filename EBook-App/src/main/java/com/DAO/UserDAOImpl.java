package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAOImpl implements UserDAO {

	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean userRegister(User u1) {
		boolean f = false;
		try {
			String sql = "INSERT INTO user (name, email, phonenumber, password) VALUES (?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u1.getName());
			ps.setString(2, u1.getEmail()); // Corrected method name
			ps.setString(3, u1.getPhonenumber());
			ps.setString(4, u1.getPassword());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public User login(String email, String password) {
		User us = null;

		try {
			String sql = "SELECT * FROM user WHERE email=? AND password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				us = new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhonenumber(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setLandmark(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setState(rs.getString(9));
				us.setPincode(rs.getString(10));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return us;
	}

	public boolean checkPassword(int id, String ps) {

		boolean f = false;
		try {
			String sql = "SELECT * FROM user WHERE id=? AND password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, ps);

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				f = true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean updateProfile(User u1) {

		boolean f = false;
		try {
			String sql = "Update  user set name=?, email=?, phonenumber=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u1.getName());
			ps.setString(2, u1.getEmail());
			ps.setString(3, u1.getPhonenumber());
			ps.setInt(4, u1.getId());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	public boolean checkUser(String em) {
		boolean f = true;

		try {
			String sql = "Select * from user WHERE email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, em);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

}
