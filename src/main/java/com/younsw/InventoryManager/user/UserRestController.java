package com.younsw.InventoryManager.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.younsw.InventoryManager.user.bo.UserBO;
import com.younsw.InventoryManager.user.model.User;

@RestController
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	@PostMapping("/user/signup")
	public Map<String, String> signup(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("email") String email
			) {
		
		int count = userBO.signup(loginId, password, name, email);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "false");
		}
		
		return result;
	}
	
	@GetMapping("/user/duplicate_id")
	public Map<String, Boolean> isDuplicate(String loginId) {
//		{"is_duplicate":true}
//		{"is_duplicate":false}
		Map<String, Boolean> result = new HashMap<>();
		
		if(userBO.isDuplicate(loginId)) { // 중복된경우
			result.put("is_duplicate", true);
		} else { // 중복되지 않은 경우 
			result.put("is_duplicate", false);			
		}
		
		return result;
	}
	
	@PostMapping("/user/signin")
	public Map<String, String> signin(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpServletRequest request
			) {
		
		User user = userBO.signin(loginId, password);
		
		Map<String, String> result = new HashMap<>();
		
		if(user != null) {
			result.put("result", "success");
			HttpSession session = request.getSession();
			session.setAttribute("userId", user.getId());
			session.setAttribute("userName", user.getName());
			session.setAttribute("userLoginId", user.getLoginId());
		} else {
			result.put("result", "false");
		}
		
		return result;
		
	}
}
