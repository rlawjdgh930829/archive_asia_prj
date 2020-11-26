package com.spring.archive.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.archive.DAO.MemberDAO;
import com.spring.archive.DTO.MemberDTO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO dao;
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String singupView(Model model) {
		model.addAttribute(new MemberDTO());
		return "index.jsp?page=body/signup";
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String singup(@Valid MemberDTO member, BindingResult bindingResult) {
		Integer memberMaxNo = dao.getMemeberMaxNo();
		String returnValue = "";
		if(bindingResult.hasErrors()) {
			returnValue = "index.jsp?page=body/signup";
		} else {
			if(memberMaxNo == null) {
				memberMaxNo = 0;
			}
			member.setMember_no(memberMaxNo + 1);
			dao.insertMemeber(member);
			returnValue = "redirect:/";
		}
		return returnValue;
	}
}
