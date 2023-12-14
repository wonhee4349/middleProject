package controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import service.IRestaurantService;
import service.RestaurantServiceImpl;
import vo.RestaurantVO;

@MultipartConfig
@WebServlet("/insertRestaurant.do")
public class InsertRestaurant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/admin/jsp/insertRestaurant.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		RestaurantVO vo = new RestaurantVO();
		
		vo.setRs_name(request.getParameter("rsName"));
		vo.setRs_addr(request.getParameter("rsAddr"));
		vo.setRs_tel(request.getParameter("rsTel"));		
		vo.setRs_lat(Double.parseDouble(request.getParameter("rsLat")));
		vo.setRs_long(Double.parseDouble(request.getParameter("rsLong")));
		vo.setOrigin_file_name(request.getParameter("rs_origin_file_name"));
		vo.setRs_con(request.getParameter("rsCon"));
		
		String uploadPath = "d:/d_other/MProjectFiles";
		
		
		File file = new File(uploadPath);
		
		if(!file.exists()) {
			file.mkdirs();
		}
		
		String fileName="";
		for(Part part : request.getParts()) {
			
			fileName = extractFileName(part);
			
			
			if(!"".equals(fileName)) {
				vo.setOrigin_file_name(fileName);
				String saveFileName = UUID.randomUUID().toString();
				vo.setSave_file_name(saveFileName);
				
				try {
					part.write(uploadPath + File.separator + saveFileName);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
		}
		
		IRestaurantService service = RestaurantServiceImpl.getInstance();
		int cnt = service.insertRestaurant(vo);
		
		response.sendRedirect(request.getContextPath()+"/admin/jsp/food_board.jsp");
		
	}
	
	//Part구조 안에서 파일명을 찾는 메서드
		private String extractFileName(Part part) {
			String fileName = "";
			
			String conDisposition = part.getHeader("content-disposition");			
			
			String[] items = conDisposition.split(";");
			for(String item : items) {
				if(item.trim().startsWith("filename")) {
					fileName = item.substring(item.indexOf("=")+2, item.length()-1);
				}
			}
			return fileName;
		}

}
