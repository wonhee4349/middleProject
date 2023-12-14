package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommentServiceImpl;
import service.ICommentService;
import service.ITourismService;
import service.QaServiceImpl;
import service.TourismServiceImpl;
import vo.QaVO;
import vo.TourismVO;


@WebServlet("/deleteCommentQA.do")
public class DeleteCommentQA extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String cmNo = request.getParameter("cmNo");
		String qaId = request.getParameter("ntNo");
        
	    QaServiceImpl serviceQa = QaServiceImpl.getService();
	    QaVO qaDetail = serviceQa.qaDetail(qaId); // 이 메서드는 특정 id에 해당하는 질문을 가져오는 것으로 가정
		
		ICommentService service = CommentServiceImpl.getInstance();
		
		service.deleteComment(cmNo);
		
		request.setAttribute("qaDetail", qaDetail);
		
		request.getRequestDispatcher("/Mproject/jsp/qadetail.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
