package controller;

import dao.ProductDAO;
import model.Cart;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ProductDAO productDAO;

	@Override
	public void init() throws ServletException {
		productDAO = new ProductDAO();
	}

//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		int productId = Integer.parseInt(request.getParameter("productId"));
//		int quantity = Integer.parseInt(request.getParameter("quantity"));
//
//		Product product;
//		try {
//			product = productDAO.getProductById(productId);
//			HttpSession session = request.getSession();
//			Cart cart = (Cart) session.getAttribute("cart");
//			if (cart == null) {
//				cart = new Cart();
//				session.setAttribute("cart", cart);
//			}
//
//			cart.addItem(product, quantity);
//
//			response.sendRedirect("cart.jsp");
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String productIdParam = request.getParameter("productId");
	    String quantityParam = request.getParameter("quantity");

	    if (productIdParam == null || quantityParam == null) {
	        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing parameters");
	        return;
	    }

	    try {
	        int productId = Integer.parseInt(productIdParam);
	        int quantity = Integer.parseInt(quantityParam);

	        Product product = productDAO.getProductById(productId);
	        HttpSession session = request.getSession();
	        Cart cart = (Cart) session.getAttribute("cart");
	        if (cart == null) {
	            cart = new Cart();
	            session.setAttribute("cart", cart);
	        }

	        cart.addItem(product, quantity);

	        response.sendRedirect("index.jsp");
	    } catch (NumberFormatException e) {
	        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid parameters");
	    } catch (SQLException e) {
	        throw new ServletException("Database access error", e);
	    }
	}

}
