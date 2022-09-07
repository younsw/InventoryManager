package com.younsw.InventoryManager.object.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.younsw.InventoryManager.common.FileManagerService;
import com.younsw.InventoryManager.favorite.dao.FavoriteDAO;
import com.younsw.InventoryManager.favorite.model.Favorite;
import com.younsw.InventoryManager.object.dao.ObjectDAO;

@Service
public class ObjectBO {
	
	@Autowired
	private ObjectDAO objectDAO;
	
	private FavoriteDAO favoriteDAO;
	
	public int objectInsert(int userId, String name, String classification, String serialNumber, int price, String etc, MultipartFile imagePath) {
		
		String image = FileManagerService.saveFile(userId, imagePath);
		
		return objectDAO.objectInsert(userId, name, classification, serialNumber, price, etc, image);
	}
	
	public List<Object> objectselect(int userId) {
		List<Object> Mylist = objectDAO.objectSelect(userId);
		return Mylist;
	}
	
	public Object objectDetail(int userId, int objectid) {
		
		return objectDAO.objectDetail(userId, objectid);
	}
	
	public int deleteObject(int objectId, int userId) {
		return objectDAO.deleteObject(objectId, userId);
	}
	
	public Object favoriteSelet(int objectId) {
		return objectDAO.favoriteObject(objectId);
	}

}
