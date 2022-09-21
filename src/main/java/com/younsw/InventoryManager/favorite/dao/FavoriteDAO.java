package com.younsw.InventoryManager.favorite.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.younsw.InventoryManager.favorite.model.Favorite;

@Repository
public interface FavoriteDAO {
	
	public int favoritObject(
			@Param("objectId") int objectId
			, @Param("userId") int userId);
	
	public List<Favorite> seletFavorite(
			@Param("userId") int userId);
	
	public int deleteFavoriteObject(
			@Param("objectId") int objectId); 
	
	public int isFavoriteObject(
			@Param("objectId") int objectId
			, @Param("userId") int userId);

}
