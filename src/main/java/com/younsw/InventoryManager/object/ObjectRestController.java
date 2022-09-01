package com.younsw.InventoryManager.object;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.younsw.InventoryManager.object.bo.ObjectBO;

@RestController
public class ObjectRestController {
	
	@Autowired
	private ObjectBO objectBO;
	
	@PostMapping("/object/registration")
	public Map<String, String> objectInsert(
			@RequestParam("name") String name
			, @RequestParam("classification") String classification
			, @RequestParam(value = "serialNumber", required=false) String serialNumber
			, @RequestParam("price") int price
			, @RequestParam(value="etc", required=false) String etc
			, @RequestParam("imagePath")MultipartFile imagePath
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = objectBO.objectInsert(userId, name, classification, serialNumber, price, etc, imagePath);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "false");
		}
		
		return result;
	}

}
