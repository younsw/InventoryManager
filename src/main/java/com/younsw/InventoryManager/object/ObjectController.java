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
import com.younsw.InventoryManager.object.model.ObjectDetail;
import com.younsw.InventoryManager.user.dao.UserDAO;
import com.younsw.InventoryManager.user.model.User;


@Controller
public class ObjectController {
	
	@Autowired
	private ObjectBO objectBO;
	@Autowired
	private UserDAO userDAO;
	
	@GetMapping("/object/registration/view")
	public String registration() {
		return "object/registration";
	}
	
	@GetMapping("/object/amend/view") 
	public String amendObject(
			@RequestParam("objectid") int objectId
			, Model model
			, HttpServletRequest request) {
		String sharing = "공개";
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		ObjectDetail object = objectBO.objectDetail(sharing, objectId, userId);
		model.addAttribute("object", object);
		
		return "object/amend";
	}
	
	@GetMapping("/object/search/view") 
	public String searchObject(
			@RequestParam(value = "search" , required = false) String search
			, HttpServletRequest request
			, Model model) {
		String sharing = "공개";
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		List<ObjectDetail> searchObject = null;
		if(search != "") {
			searchObject = objectBO.searchObject(search, sharing, userId);
		}
		
		model.addAttribute("searchObject", searchObject);
	
		return "object/search";
	}
	
	@GetMapping("/object/specificPersonObject/view")
	public String spscificPersonObjectList(
			@RequestParam("userId") int userId
			, Model model) {
		String sharing = "공개";
		
		List<ObjectDetail> otherList = objectBO.specificPersonObjectList(userId, sharing);
		model.addAttribute("specificPersonObjctList", otherList);
		User user = userDAO.seleteUserById(userId);
		model.addAttribute("user", user);
		return "object/specificPersonObject";
	}
	
	@GetMapping("/object/mylist/view")
	public String postView(Model model
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<ObjectDetail> mylist = objectBO.objectselect(userId);
		model.addAttribute("objectList", mylist);
		
 		
		return "object/mylist";
	}
	
	@GetMapping("/object/detail/view")
	public String detailObject(
			@RequestParam("objectid") int objectId
			, Model model
			, HttpServletRequest request) {
		String sharing = "공개";
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		ObjectDetail object = objectBO.objectDetail(sharing, objectId, userId);
		model.addAttribute("object", object);
		
		return "object/detail";
	}
	
	@GetMapping("/object/otherobject/view")
	public String ohterObject(
			Model model
			, HttpServletRequest request) {
		String sharing = "공개";
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<ObjectDetail> otherObject = objectBO.sharingObject(sharing, userId);
		model.addAttribute("otherObject", otherObject);
		return "object/otherObject";
	}
	
	
	

}
