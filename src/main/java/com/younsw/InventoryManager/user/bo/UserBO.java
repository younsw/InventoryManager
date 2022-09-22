package com.younsw.InventoryManager.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.younsw.InventoryManager.common.EncryptUtils;
import com.younsw.InventoryManager.user.dao.UserDAO;
import com.younsw.InventoryManager.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public int signup(String loginId, String password, String name, String email) {
		
		String encryPassword = EncryptUtils.md5(password);
		
		return userDAO.signupInsert(loginId, encryPassword, name, email);
	}
	
	public boolean isDuplicate(String loginId) {
		// 일치하는 LoginID 개수 전달 받고,
		// 0일 경우 불일치
		// 그게 아닐경우 중복
		int count = userDAO.selectCountLoginId(loginId);
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	public User signin(String loginId, String password) {
		String encryPassword = EncryptUtils.md5(password);
		return userDAO.signin(loginId, encryPassword);
	}
	
	public User seleteUserById(int userId) {
		return userDAO.seleteUserById(userId);
	}

}
