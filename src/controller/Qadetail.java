package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.QaServiceImpl;
import vo.QaVO;


@WebServlet("/qadetail.do")
public class Qadetail extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        
        String qaId = request.getParameter("qaId");
        
        QaServiceImpl service = QaServiceImpl.getService();
        QaVO qaDetail = service.qaDetail(qaId); // 이 메서드는 특정 id에 해당하는 질문을 가져오는 것으로 가정
        
        request.setAttribute("qaDetail", qaDetail);
        request.getRequestDispatcher("/Mproject/jsp/qadetail.jsp").forward(request, response);
    }
}


