package com.younsw.InventoryManager.object.model;

import com.younsw.InventoryManager.user.model.User;

public class ObjectDetail {
	
	private Object object;
	
	private int objectFavoriteregistration;
	
	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Object getObject() {
		return object;
	}

	public void setObject(Object object) {
		this.object = object;
	}

	public int getObjectFavoriteregistration() {
		return objectFavoriteregistration;
	}

	public void setObjectFavoriteregistration(int objectFavoriteregistration) {
		this.objectFavoriteregistration = objectFavoriteregistration;
	}

	
	

}
