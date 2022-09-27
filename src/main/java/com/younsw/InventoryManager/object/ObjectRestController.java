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

import com.younsw.InventoryManager.favorite.bo.FavoriteBO;
import com.younsw.InventoryManager.favorite.dao.FavoriteDAO;
import com.younsw.InventoryManager.object.bo.ObjectBO;

@RestController
public class ObjectRestController {
	
	@Autowired
	private ObjectBO objectBO;
	@Autowired
	private FavoriteBO favoriteBO;
	@Autowired
	private FavoriteDAO favoriteDAO;
	
	@PostMapping("/object/registration")
	public Map<String, String> objectInsert(
			@RequestParam("name") String name
			, @RequestParam("classification") String classification
			, @RequestParam(value = "serialNumber", required=false) String serialNumber
			, @RequestParam("price") int price
			, @RequestParam("sharing") String sharing
			, @RequestParam(value="etc", required=false) String etc
			, @RequestParam("imagePath")MultipartFile imagePath
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = objectBO.objectInsert(userId, name, classification, serialNumber, price, sharing, etc, imagePath);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "false");
		}
		
		return result;
	}
	
	@PostMapping("/object/delete")
	public Map<String, String> deleteObject(
			@RequestParam("objectId") int objectId
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int objectcCount = objectBO.deleteObject(objectId, userId);
		int favoriteboolean = favoriteDAO.isFavoriteObject(objectId, userId);
		int favoriteCount;
		
		Map<String, String> result = new HashMap<>();
		
		if(favoriteboolean == 1) {
			// 삭제할 물건이 즐겨찾기에 포함
			favoriteCount = favoriteBO.favoriteObjectDelete(objectId);
			if(objectcCount == 1 && favoriteCount == 1) {
				result.put("result", "success");
			} else {
				result.put("result", "false");
			}
		} else {
			if(objectcCount == 1) {
				result.put("result", "success");
			} else {
				result.put("result", "false");
			}
		}
		
		return result;
	}
	
	@PostMapping("/object/amend")
	public Map<String, String> objectInsert(
			@RequestParam("name") String name
			, @RequestParam("classification") String classification
			, @RequestParam(value = "serialNumber", required=false) String serialNumber
			, @RequestParam("price") int price
			, @RequestParam("sharing") String sharing
			, @RequestParam(value="etc", required=false) String etc
			, @RequestParam("objectId") int objectId 
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = objectBO.objectUpdate(userId, name, classification, serialNumber, price, sharing, etc, objectId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "false");
		}
		
		return result;
	}
	

}
