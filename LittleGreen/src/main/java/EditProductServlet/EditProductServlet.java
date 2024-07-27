package EditProductServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import model.Product;

import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/editProduct")
public class EditProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        ProductDAO productDAO = new ProductDAO();
        
        try {
            Product product = productDAO.getProductById(productId);
            request.setAttribute("product", product);
            request.getRequestDispatcher("editProduct.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Failed to retrieve product details.");
            request.getRequestDispatcher("indexAdmin.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        ProductDAO productDAO = new ProductDAO();
        try {
            productDAO.updateProduct(product);
            response.sendRedirect("indexAdmin.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Failed to update product.");
            request.getRequestDispatcher("editProduct.jsp").forward(request, response);
        }
    }
}
