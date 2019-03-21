package com.event;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

//서블릿의 라이프 사이클과 속성 이벤트
//HTTPSessionListenr: 세션이 생성, 종료될 때
//ServletContextListener : 서버가 시작, 중지될 때

public class ContextListenerTest implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent evt) {
		System.out.println("서버 죽는다..");
	}

	@Override
	public void contextInitialized(ServletContextEvent evt) {
		System.out.println("서버 살아난다..");
		
		ServletContext sc = evt.getServletContext();
		//어떤 소스에서도 접근 가능한 데이터 
		sc.setAttribute("name", "한예슬");
	}

}
