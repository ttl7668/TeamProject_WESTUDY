package com.project.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.project.product.service.ProductService;
import com.project.user.vo.UserVO;
import com.project.util.SessionKeyCode;

public class UserInterceptor extends HandlerInterceptorAdapter{

   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
      
      HttpSession session = request.getSession();
      String name = null;
      
      
      
      try {
         UserVO userVO = (UserVO)session.getAttribute(SessionKeyCode.userKey);
           name = userVO.getName();
           
           
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      if(name == null) {
         response.sendRedirect( request.getContextPath() + "/User/UserLogin"  );
         return false;
      }
      else {
         return true;
      }
      
      
   }
   
   

}