package dao;

import java.io.Serializable;
import java.util.List;


import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import model.Customer;
import org.springframework.beans.factory.annotation.Autowired;

@Repository
public class CustomerDAO{
	
	/**
	* Inject từ <bean class="...JdbcTemplate>
	*/
	
	protected JdbcTemplate jdbc;
	
	/**
	* Thêm mới một thực thể
	* @param entity là thực thể mới
	*/
	public void insert(Customer entity) {
		String sql = "INSERT INTO Customers (Id, Fullname, Password, Age, Sex, Email, Phone, Address) VALUES (?,?,?,?,?,?,?,?)";
		jdbc.update(sql, entity.getId(), entity.getFullname(), entity.getPassword(), entity.getAge(),
				entity.getSex(), entity.getEmail(), entity.getPhone(), entity.getAddress());
	}
	
	/**
	* Cập nhật thực thể
	* @param entity là thực thể cần cập nhật
	*/
	public void update(Customer entity) {
		String sql = "UPDATE Customers SET Fullname=?, Password=?, Age=?, Sex=?, Email=?, Phone=?, Address=? WHERE Id=?";
		jdbc.update(sql, entity.getFullname(), entity.getAge(), entity.getSex(),
				entity.getPassword(), entity.getEmail(), entity.getPhone(), entity.getAddress(), entity.getId());
	}
	
	/**
	* Xóa thực thể theo mã
	* @param id mã thực thể cần xóa
	*/
	public void delete(Serializable id) {
		String sql = "DELETE FROM Customers WHERE Id=?";
		jdbc.update(sql, id);
	}
	
	/**
	* Truy vấn một thực thể theo mã
	* @param id mã thực thể cần truy vấn
	* @return thực thể truy vấn được
	*/
	
	public Customer getById(Serializable id) {
		String sql = "SELECT * FROM Customers WHERE Id='"+id+"'";
		return jdbc.queryForObject(sql, getRowMapper());
	}

	/**
	* Truy vấn tất cả thực thể
	* @return danh sách thực thể truy vấn được
	*/
	public List<Customer> getAll() {
		String sql = "SELECT * FROM Customers";
		return getBySql(sql);
	}
	
	/**
	* Truy vấn thực thể theo câu lệnh sql
	* @param sql câu lệnh truy vấn
	* @return danh sách thực thể truy vấn được
	*/
	protected List<Customer> getBySql(String sql) {
		return jdbc.query(sql, getRowMapper());
	}
	
	/**
	* �?nh xạ cấu trúc bản ghi theo thuộc tính của bean
	* @return ánh xạ bản ghi theo thuộc tính bean 
	*/
	private RowMapper<Customer> getRowMapper() {
		return new BeanPropertyRowMapper<Customer>(Customer.class);
	}

}