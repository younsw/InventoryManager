package com.younsw.InventoryManager.object.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ObjectDAO {
	
	public int objectInsert(
			@Param("userId") int userId
			, @Param("name") String name
			, @Param("classification") String classification
			, @Param("serialNumber") String serialNumber
			, @Param("price") int price
			, @Param("etc") String etc
			, @Param("imagePath") String imagePath);
	
	public List<Object> objectSelect(@Param("userId") int userId);

}
