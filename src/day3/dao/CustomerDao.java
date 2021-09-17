package day3.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import day3.dto.Customer;
import util.MySQLConnectionUtil;

public class CustomerDao {
	private static CustomerDao dao = new CustomerDao();
	private CustomerDao() {}
	public static CustomerDao getInstance() {
		return dao;
	}
	
	public List<Customer> selectAll(){
		List<Customer> list = new ArrayList<Customer>();
		String sql = "select * from customer";
		Connection conn =MySQLConnectionUtil.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new Customer(rs.getInt(1), 
						 rs.getString(2), 
						 rs.getString(3), 
						 rs.getString(4),
						 rs.getString(5),
						 rs.getString(6), 
						 rs.getInt(7), rs.getString(8)));
			}
			
		}catch (SQLException e) {
			System.out.println("selectAll 오류 : " + e.getMessage());
		}finally {
			try {
				pstmt.close();
			} catch (SQLException e) {	}
			MySQLConnectionUtil.close(conn);
		}
		return list;
	}
	
	
	public void insert(Customer cus) {
		
		String sql="insert into customer(name,password,email,addr,gender,age,hobby)" + 
				" values (?,?,?,?,?,?,?)";
		Connection conn = MySQLConnectionUtil.connect();
		PreparedStatement pstmt =null;
		try {
			pstmt = conn.prepareStatement(sql);
			//? 기호에 들어갈 값의 바인딩  -> mybatis 라이브러를 사용해서  dto 클래스와 자동매핑(mapping)
			pstmt.setString(1, cus.getName());
			pstmt.setString(2, cus.getPassword());
			pstmt.setString(3, cus.getEmail());
			pstmt.setString(4, cus.getAddr());
			pstmt.setString(5, cus.getGender());
			pstmt.setInt(6, cus.getAge());
			pstmt.setString(7, cus.getHobby());
			
			pstmt.execute();
			conn.commit();
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("insert 오류 : " + e.getMessage());
		}finally {
			try {
				pstmt.close();
			} catch (SQLException e1) {
			}
			MySQLConnectionUtil.close(conn);
		}
		
	}
}