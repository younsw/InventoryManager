package com.younsw.InventoryManager.object.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.younsw.InventoryManager.object.model.Object;

@Repository
public interface ObjectDAO {
	
	public int objectInsert(
			@Param("userId") int userId
			, @Param("name") String name
			, @Param("classification") String classification
			, @Param("serialNumber") String serialNumber
			, @Param("price") int price
			, @Param("sharing") String sharing
			, @Param("etc") String etc
			, @Param("imagePath") String imagePath);
	
	public List<Object> objectSelect(@Param("userId") int userId);
	
	public Object objectDetail(
			@Param("sharing") String sharing
			, @Param("objectId") int objectId
			, @Param("userId") int userId);
	
	public int deleteObject(
			@Param("objectId") int objectId
			, @Param("userId") int userId);
	
	public Object favoriteObject(
			@Param("objectId") int objectId);
	
	public List<Object> otherObject(
			@Param("sharing") String sharing);
	
	public Object objectSeleteById(
			@Param("objectId") int objectId);
	

}
