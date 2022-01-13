package micro.apple.groupware.common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LogInterceptor extends HandlerInterceptorAdapter {

   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
	   String uri = request.getRequestURI();
	   
	   if(uri.equals("/registerForm") || uri.equals("/registerPost")) {
		   System.out.println(request.getRequestURI() + "를 요청합니다.");
	   }else {
		   System.out.println(request.getRequestURI() + "를 요청합니다.");
	      if(request.getSession().getAttribute("MEMBERVO") == null) {
	         response.sendRedirect(request.getContextPath() + "/logout");
	         return false;
	      }
	   }
      return super.preHandle(request, response, handler);
   }

}