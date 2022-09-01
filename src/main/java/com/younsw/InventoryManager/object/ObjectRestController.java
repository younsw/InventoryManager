package com.younsw.InventoryManager.object;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ObjectRestController {
	
	@PostMapping("/object/registration")
	public Map<String, String> objectInsert(
			@RequestParam("name") String name
			, @RequestParam("classification") String classification
			, @RequestParam("serialNumber") String serialNumber
			, @RequestParam("price") int price
			, @RequestParam("etc") String etc) {
		
		Map<String, String> result = new HashMap<>();
		
		return result;
		
	}

}
