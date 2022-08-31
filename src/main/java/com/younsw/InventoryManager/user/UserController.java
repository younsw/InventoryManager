package com.younsw.InventoryManager.user;

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

}
