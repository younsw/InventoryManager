package com.younsw.InventoryManager.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.younsw.InventoryManager.user.model.User;

@Repository
public interface UserDAO {
	
	public int signupInsert(
			@Param("loginId") String loginId
			, @Param("password") String pasword
			, @Param("name") String name
			, @Param("email") String email);
	
	public int selectCountLoginId(@Param("loginId") String loginId);
	
	public User signin(
			@Param("loginId") String loginId
			, @Param("password") String password); 
	
	public User seleteUserById(
			@Param("userId") int userId);
	

}
