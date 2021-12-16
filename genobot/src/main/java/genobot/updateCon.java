package genobot;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class updateCon implements Command {
	

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String moveURL ="";		
		
		int boardnum = Integer.parseInt(request.getParameter("boardnum"));
		String call_result = request.getParameter("call_result");
		
			
		qnaDAO dao = new qnaDAO();
		
		int cnt = dao.Update(call_result, boardnum);
							
		if(cnt>0) {
			moveURL = "board_list.jsp";
		}	
		
		return moveURL;
	}
	

}

