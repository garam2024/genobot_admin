package genobot;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class searchCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		String moveURL;
		String call_state = request.getParameter("state");
		System.out.print("화면 상태?"+call_state);
		qnaDAO dao = new qnaDAO();
				
		moveURL = "board_list.jsp";
		
		
		return moveURL;
	}

}
