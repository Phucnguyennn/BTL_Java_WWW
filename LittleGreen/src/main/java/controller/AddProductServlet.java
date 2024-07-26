package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import model.Product;

import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/addProduct")
public class AddProductServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Product product = new Product();
        product.setName(request.getParameter("name"));
        product.setDescription(request.getParameter("description"));
        product.setPrice(new BigDecimal(request.getParameter("price")));
        product.setBrand(request.getParameter("brand"));
        product.setFragranceType(request.getParameter("fragranceType"));
        product.setVolume(Integer.parseInt(request.getParameter("volume")));
        product.setGender(request.getParameter("gender"));
        product.setLaunchYear(Integer.parseInt(request.getParameter("launchYear")));
        product.setStockQuantity(Integer.parseInt(request.getParameter("stockQuantity")));
        product.setImageUrl(request.getParameter("imageUrl"));

        ProductDAO productDAO = new ProductDAO();
        try {
            productDAO.addProduct(product);
            response.sendRedirect("manageProducts.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Failed to add product.");
            request.getRequestDispatcher("addProduct.jsp").forward(request, response);
        }
    }
}
