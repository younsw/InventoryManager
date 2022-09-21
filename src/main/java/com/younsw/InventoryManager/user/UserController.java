package com.younsw.InventoryManager.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	
	@GetMapping("/user/signup/view")
	public String signup() {
		return "user/signup";
	}
	
	@GetMapping("/user/signin/view")
	public String signin() {
		return "user/signin";
	}
	
	@GetMapping("/user/signout")
	public String singOut(HttpServletRequest request) {
		// 로그아웃
		// 로그인시에 저장한 세션의 값들을 모두 재거한다
		
		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		session.removeAttribute("userLoginId");
		
		// 리다이렉트
		return "redirect:/user/signin/view";
		
	}

}
