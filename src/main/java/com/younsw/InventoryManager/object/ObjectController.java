package com.younsw.InventoryManager.object;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.younsw.InventoryManager.object.bo.ObjectBO;


@Controller
public class ObjectController {
	
	@Autowired
	private ObjectBO objectBO;
	
	@GetMapping("/object/registration/view")
	public String registration() {
		return "object/registration";
	}
	
	@GetMapping("/object/mylist/view")
	public String postView(Model model
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<Object> Mylist = objectBO.objectselect(userId);
		model.addAttribute("objectList", Mylist);
		
 		
		return "object/mylist";
	}
	
	@GetMapping("/object/detail/view")
	public String detailObject(
			@RequestParam("objectid") int objectid
			, HttpServletRequest request
			, Model model) {
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		Object object = objectBO.objectDetail(userId, objectid);
		model.addAttribute("object", object);
		
		return "object/detail";
	}
	
	@GetMapping("/object/otherobject/view")
	public String ohterObject(
			) {
		return "object/otherObject";
	}
	

}
