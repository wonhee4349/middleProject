package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import service.IRestaurantService;
import service.RestaurantServiceImpl;
import vo.RestaurantVO;


@WebServlet("/restaurantGood.do")
public class RestaurantGood extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("왜안되냐고온올ㄴ올ㄴㄷ러ㅏㅈㄷ로ㅠㅕ");
		
		request.setCharacterEncoding("utf-8");
		
		String rsNo = request.getParameter("rsNo");
		String rsGb = request.getParameter("gb");
		
		IRestaurantService service = RestaurantServiceImpl.getInstance();
		
		if(rsGb.equals("good_ico")) {
			service.updateGood(rsNo);
		}else if(rsGb.equals("bad_ico")) {
			service.updateBad(rsNo);
		}
		
		RestaurantVO vo = service.selectById(rsNo);
		
		request.setAttribute("goodNum", vo.getRs_good());
		request.setAttribute("badNum", vo.getRs_bad());
		
		Gson gson = new Gson();
		String jsonDate = gson.toJson(vo);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(jsonDate);
	}



}
