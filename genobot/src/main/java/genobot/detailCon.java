package genobot;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class detailCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String moveURL;
		HttpSession session = request.getSession();
		int boardnum = Integer.parseInt(request.getParameter("boardnum"));
		qnaDAO dao = new qnaDAO();
		qnaVO QnaOne = dao.OneSelect(boardnum);
		System.out.println(boardnum);
		
				
		if(QnaOne == null) {
			System.out.println("문의 가져오기 실패");
			moveURL = "board_list.jsp";
		}else {
			System.out.println("게시글 전송 성공");
			session.setAttribute("QnaOne", QnaOne);
			moveURL = "board_detail.jsp";
		}
		
		return moveURL;

	}

}
