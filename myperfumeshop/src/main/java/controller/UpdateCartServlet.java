package controller;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CartItem;

import java.io.IOException;
import java.util.List;

@WebServlet("/updateCart")
public class UpdateCartServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        @SuppressWarnings("unchecked")
        List<CartItem> cart = (List<CartItem>) request.getSession().getAttribute("cart");

        if (cart != null) {
            String[] quantities = request.getParameterValues("quantity");
            String[] productIds = request.getParameterValues("productId");

            for (int i = 0; i < productIds.length; i++) {
                int productId = Integer.parseInt(productIds[i]);
                int quantity = Integer.parseInt(quantities[i]);

                for (CartItem item : cart) {
                    if (item.getProduct().getId() == productId) {
                        if (quantity <= 0) {
                            cart.remove(item);
                        } else {
                            item.setQuantity(quantity);
                        }
                        break;
                    }
                }
            }

            if (cart.isEmpty()) {
                request.getSession().removeAttribute("cart");
            } else {
                request.getSession().setAttribute("cart", cart);
            }
        }

        response.sendRedirect("viewCart.jsp");
    }
}

