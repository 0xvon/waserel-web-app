package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/controller/CartController")
public class CartController extends HttpServlet {
  private static final long serialVersionUID = 1L;

    protected void doGet (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

            //リダイレクト
            response.sendRedirect("/waserel/index.jsp");
        }
    }

    protected void doPost (HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String productCode = (String)request.getParameter("itemId");
        Integer productCode = (Integer)request.getParameter("count");

        RequestDispatcher dispatcher =
            request.getRequestDispatcher
                ("/waserel/index.jsp");
        dispatcher.forward(request, response);
    }
}