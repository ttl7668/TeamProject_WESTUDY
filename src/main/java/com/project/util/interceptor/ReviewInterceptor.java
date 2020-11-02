package com.project.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.product.vo.EnrollVO;
import com.project.user.service.UserService;
import com.project.user.vo.UserVO;
import com.project.util.SessionKeyCode;

public class ReviewInterceptor extends HandlerInterceptorAdapter{

	@Autowired
	private UserService userService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		
		
		try {
			HttpSession session = request.getSession();
			UserVO sessionUser = (UserVO) session.getAttribute(SessionKeyCode.userKey);
			Integer pno = Integer.parseInt((String) request.getAttribute("pno"));
			Integer uno = sessionUser.getUno();
			
			EnrollVO enrollVO = new EnrollVO(pno, uno);
			int result = userService.getEnrollment(enrollVO);
			if(result == 0) {
				Exception e = new Exception();
			}
			userService.getEnrollment(enrollVO);
		} catch (Exception e) {
			request.setAttribute("msg", "권한이 없습니다.");
			response.sendRedirect(request.getContextPath() + "/Review/Reviewoard");
			return super.preHandle(request, response, handler);
		}
		return true;
	}
	
}
