package com.younsw.InventoryManager.object;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ObjectController {
	
	@GetMapping("/object/mylist/view")
	public String myList() {
		return "object/mylist";
	}
	
	@GetMapping("/object/registration/view")
	public String registration() {
		return "object/registration";
	}

}
