package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MyfoodDAO;
import model.UserDTO;


@WebServlet("/updateRefCon")
public class updateRefCon extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 request.setCharacterEncoding("EUC-KR");
         HttpSession session = request.getSession();
         UserDTO User = (UserDTO)session.getAttribute("login_User");
         
         String id = User.getU_id();
         String nofood = request.getParameter("nofood");
         int size = Integer.parseInt(request.getParameter("size"));
         
         
         System.out.println(size);
         System.out.println(nofood);
         System.out.println(id);
         
         MyfoodDAO dao = new MyfoodDAO();
         
         int cnt = dao.update_no(nofood, id, size);
         
         if(cnt > 0) {
            String[] no;
            int size1 = 0;
            no = dao.select_no(User.getU_id());
            for(int i =0; i < no.length; i++){
               if(no[i] != null)
                  size++;
            }
            
            System.out.println("냉장고 음식 저장 성공");
            response.sendRedirect("ref_food.jsp");
         }
         else {
            System.out.println("냉장고 음식 저장 실패");
            response.sendRedirect("ref_food.jsp");
         }

   }

	

}
