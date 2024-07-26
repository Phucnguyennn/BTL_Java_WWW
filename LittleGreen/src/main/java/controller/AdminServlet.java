package controller;

import dao.ProductDAO;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
			request.setAttribute("products", productDAO.getAllProducts());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("add".equals(action)) {
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

            try {
				productDAO.addProduct(product);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        } else if ("update".equals(action)) {
            Product product = new Product();
            product.setId(Integer.parseInt(request.getParameter("id")));
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

            try {
				productDAO.updateProduct(product);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        } else if ("delete".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("id"));
            try {
				productDAO.deleteProduct(productId);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
        response.sendRedirect("admin");
    }
}
