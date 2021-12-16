package genobot;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.do" ) 
public class frontController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//æ»≥Á«œººø‰ dddd
		request.setCharacterEncoding("utf-8");
		
		System.out.println("Frontcontroller");
		
		String reqURI = request.getRequestURI();
		String path = request.getContextPath();			
		String result = reqURI.substring(path.length()+1);
	
		genobot.Command con = null;
		
		if(result.equals("updateCon.do")) {
			con = new updateCon();			
		} else if(result.equals("detailCon.do")) {
			con = new detailCon();
		} else if(result.equals("searchCon.do")) {
			con = new searchCon();
		}
		String moveURL = con.execute(request, response);
		response.sendRedirect(moveURL);
	}
		
}


