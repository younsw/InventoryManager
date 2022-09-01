package com.younsw.InventoryManager.object.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.younsw.InventoryManager.common.FileManagerService;
import com.younsw.InventoryManager.object.dao.ObjectDAO;

@Service
public class ObjectBO {
	
	@Autowired
	private ObjectDAO objectDAO;
	
	public int objectInsert(int userId, String name, String classification, String serialNumber, int price, String etc, MultipartFile imagePath) {
		
		String image = FileManagerService.saveFile(userId, imagePath);
		
		return objectDAO.objectInsert(userId, name, classification, serialNumber, price, etc, image);
	}
	
	public List<Object> objectselect(int userId) {
		List<Object> Mylist = objectDAO.objectSelect(userId);
		return Mylist;
	}

}
