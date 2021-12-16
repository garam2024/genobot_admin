package genobot;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class deleteCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
				
		String moveURL ="";				
		int boardnum = Integer.parseInt(request.getParameter("boardnum"));
		qnaDAO dao = new qnaDAO();
				
		int cnt = dao.Delete(boardnum);
		
			if(cnt>0) {
				moveURL = "index.jsp";
			}		return moveURL;

	}

}
