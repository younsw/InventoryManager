package com.younsw.InventoryManager.favorite.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.younsw.InventoryManager.favorite.dao.FavoriteDAO;
import com.younsw.InventoryManager.favorite.model.Favorite;
import com.younsw.InventoryManager.object.bo.ObjectBO;

@Service
public class FavoriteBO {
	
	@Autowired
	private FavoriteDAO favoriteDAO;
	@Autowired
	private ObjectBO objectBO;
	
	public int favoriteObject(int userId, int objectId) {
		return favoriteDAO.favoritObject(objectId, userId);
	}
	
	public List<Object> seleteFavorite(int userId) {
		List<Favorite> favoriteList = favoriteDAO.seletFavorite(userId);
		List<Object> favoriteObjectList = new ArrayList<>();
		
		for(Favorite object : favoriteList) {
			int objectId = object.getObjectId();
			
			Object favoriteObject = objectBO.favoriteSelet(objectId);
			
			favoriteObjectList.add(favoriteObject);
		}
		
		return favoriteObjectList;
	}
	
	public int favoriteObjectDelete(int objectId) {
		return favoriteDAO.deleteFavoriteObject(objectId);
	}
	
	public boolean isFavoriteObject(int objectId) {
		int count = favoriteDAO.isFavoriteObject(objectId);
		
		if(count == 1) {
			return true;
		} else {
			return false;
		}
		
	}

}
