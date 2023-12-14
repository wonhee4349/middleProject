

package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IQaService;
import service.QaServiceImpl;
import vo.QaVO;



@WebServlet("/qaList.do")
public class QaList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		request.setCharacterEncoding("utf-8");
		
		QaServiceImpl service = QaServiceImpl.getService();
		
		List<QaVO> list = service.getAllQa();
			
		List <QaVO> qaList = new ArrayList<>();
		
		for(QaVO vo : list ) {
			
			QaVO filteredQa = new QaVO();
			filteredQa.setQa_no(vo.getQa_no());
			filteredQa.setQa_title(vo.getQa_title());
			filteredQa.setQa_con(vo.getQa_con());
			filteredQa.setQa_date(vo.getQa_date());	
			filteredQa.setUsers_name(vo.getUsers_name());
			qaList.add(filteredQa);
				
		}
		
		
		
		request.setAttribute("qaList", qaList);
		
		request.getRequestDispatcher("/Mproject/jsp/qa.jsp").forward(request, response);
		
	}

	
	

	
}


