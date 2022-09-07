package com.younsw.InventoryManager.favorite;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.younsw.InventoryManager.favorite.bo.FavoriteBO;

@RestController
public class FavoriteRestController {
	
	@Autowired
	private FavoriteBO favortieBO;
	
	@PostMapping("/object/favorite")
	public Map<String, String> favoriteObject(
			@RequestParam("objectId") int objectId
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = favortieBO.favoriteObject(userId, objectId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "false");
		}
		
		return result;
	}

}
