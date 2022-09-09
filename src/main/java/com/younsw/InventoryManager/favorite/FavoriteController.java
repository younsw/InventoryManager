package com.younsw.InventoryManager.favorite;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.younsw.InventoryManager.favorite.bo.FavoriteBO;



@Controller
public class FavoriteController {
	
	@Autowired
	private FavoriteBO favoriteBO;
	
	@GetMapping("/object/favorite/view")
	public String seletfavorites(
			HttpServletRequest request
			, Model model) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<Object> favoriteList = favoriteBO.seleteFavorite(userId);
		model.addAttribute("favorite", favoriteList);
		
		return "object/favorite";
	}
	
	

}
