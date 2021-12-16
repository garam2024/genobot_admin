package genobot;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.do" ) 
public class frontController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//�ȳ��ϼ��� dddd
		request.setCharacterEncoding("utf-8");
		
		System.out.println("Frontcontroller");
		
		String reqURI = request.getRequestURI();
		String path = request.getContextPath();			
		String result = reqURI.substring(path.length()+1);
	
		genobot.Command con = null;
		System.out.println("프론트 컨트롤러야 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		System.out.println(result);
		if(result.equals("updateCon.do")) {
			con = new updateCon();			
		} else if(result.equals("detailCon.do")) {
			con = new detailCon();
		} else if(result.equals("searchCon.do")) {
			con = new searchCon();
		}else if (result.equals("waitingCon.do")) {
			con = new waitingCon();
		}
		
		String moveURL = con.execute(request, response);
		String call_state = (String)request.getParameter("state");
		request.setAttribute("state",call_state);
		if (call_state==null) {
			System.out.println("hello");
			response.sendRedirect(moveURL); 
			
		}else {
			System.out.println(call_state);
			
			
			System.out.println("froncontoller에서 보기"+call_state);
			RequestDispatcher dis = request.getRequestDispatcher(moveURL);
			dis.forward(request, response);
			
		}
		
		
		
		
	}
	
	
		
}


