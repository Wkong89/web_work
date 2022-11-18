package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebServlet("/test/save")  
	//어노테이션 설정 -> 대신에 web.xml 문서에 작성할수도있음
public class SaveServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 폼 전송 되는 닉네임을 읽어와서
		req.setCharacterEncoding("utf-8");
		String nick=req.getParameter("nick");
		// session scope 에 "nick" 이라는 키값으로 저장하기
		HttpSession session=req.getSession(); 
		// HttpServletRequest 객체의 메소드를 이용하여 HttpSession 얻어내기
		session.setAttribute("nick", nick);
		session.setMaxInactiveInterval(60);
		
		//응답
		RequestDispatcher rd=req.getRequestDispatcher("/WEB-INF/views/test/save.jsp");
		rd.forward(req, resp);
	}
}
