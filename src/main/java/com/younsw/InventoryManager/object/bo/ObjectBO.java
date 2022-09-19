package com.younsw.InventoryManager.object.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.younsw.InventoryManager.common.FileManagerService;
import com.younsw.InventoryManager.favorite.dao.FavoriteDAO;
import com.younsw.InventoryManager.object.dao.ObjectDAO;
import com.younsw.InventoryManager.object.model.Object;
import com.younsw.InventoryManager.object.model.ObjectDetail;

@Service
public class ObjectBO {
	
	@Autowired
	private ObjectDAO objectDAO;
	@Autowired
	private FavoriteDAO favoriteDAO;
	
	public int objectInsert(int userId, String name, String classification, String serialNumber, int price, String sharing, String etc, MultipartFile imagePath) {
		
		String image = FileManagerService.saveFile(userId, imagePath);
		
		return objectDAO.objectInsert(userId, name, classification, serialNumber, price, sharing, etc, image);
	}
	
	public List<ObjectDetail> objectselect(int userId) {
		List<Object> mylist = objectDAO.objectSelect(userId);
		List<ObjectDetail> objectDetailList = new ArrayList<>();
		// 오프젝트디테일리스트에 물건 정보 추가하기 
		// 오프젝트 리스트에 즐겨찾기 추가 여부 추가하기
		for(Object objectDetail : mylist) {
			
			int objectId = objectDetail.getId();
			
			int objectFavoriteregistration = favoriteDAO.isFavoriteObject(objectId);
			
			ObjectDetail detail = new ObjectDetail(); 
			detail.setObject(objectDetail);
			detail.setObjectFavoriteregistration(objectFavoriteregistration);
			
			objectDetailList.add(detail);
			
		}
		return objectDetailList;
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
	
	public List<Object> sharingObject(String sharing) {
		return objectDAO.otherObject(sharing);
	}

}
