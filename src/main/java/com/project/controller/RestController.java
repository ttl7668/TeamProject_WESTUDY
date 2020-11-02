package com.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.project.product.vo.EnrollVO;
import com.project.user.service.UserService;
import com.project.user.vo.UserVO;
import com.project.util.SessionKeyCode;

@org.springframework.web.bind.annotation.RestController
public class RestController {

	@Autowired
	private UserService userService;

	@GetMapping("/Review/user/enrollment/{pno}")
	public ResponseEntity<?> patchEnrollment(HttpSession session, @PathVariable(value="pno") String pno){
		UserVO sessionUser = (UserVO) session.getAttribute(SessionKeyCode.userKey);
		System.out.println(sessionUser);
		System.out.println(pno);
		if(sessionUser == null) {
			return new ResponseEntity<>("로그인이 필요한 서비스입니다.", HttpStatus.UNAUTHORIZED);
		}
		int uno = sessionUser.getUno();
		EnrollVO enrollVO = new EnrollVO(Integer.parseInt(pno), uno);
		int result = userService.getEnrollment(enrollVO);
		System.out.println(result);
		if(result == 0) {
			return new ResponseEntity<>("권한이 없습니다. 강좌 등록을 해주세요.", HttpStatus.UNAUTHORIZED);
		}
		
		return new ResponseEntity<>(HttpStatus.OK);
		
	}

}
