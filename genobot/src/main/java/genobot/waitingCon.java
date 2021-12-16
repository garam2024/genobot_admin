package genobot;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class waitingCon implements Command {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {		
		String moveURL;
		String call_state = request.getParameter("state");
		System.out.print("화면 상태?"+call_state);
		qnaDAO dao = new qnaDAO();
		qnaVO state = dao.stateSelect(call_state);				
		moveURL = "callState.jsp";		
		return moveURL;
	}
}



