package controller;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;

import java.io.IOException;

@WebServlet("/deleteProduct")
public class DeleteProductServlet extends HttpServlet {
	 private static final long serialVersionUID = 1L;

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        int productId = Integer.parseInt(request.getParameter("id"));
	        ProductDAO productDAO = new ProductDAO();
	        
	        try {
	            productDAO.deleteProduct(productId);
	            response.sendRedirect("indexAdmin.jsp");
	        } catch (Exception e) {
	            e.printStackTrace();
	            request.setAttribute("errorMessage", "Failed to delete product.");
	            request.getRequestDispatcher("indexAdmin.jsp").forward(request, response);
	        }
	    }
	}
