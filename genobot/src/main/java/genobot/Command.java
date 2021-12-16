package genobot;
//안녕하세요
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface Command {

	public abstract String execute(HttpServletRequest request, HttpServletResponse response);
}
