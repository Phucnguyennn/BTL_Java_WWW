package controller;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CartItem;
import model.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutServlet {
	  protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        HttpSession session = request.getSession();
	        User user = (User) session.getAttribute("user");
	        if (user == null) {
	            response.sendRedirect("login.jsp");
	            return;
	        }

	        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
	        if (cart == null || cart.isEmpty()) {
	            response.sendRedirect("cart.jsp");
	            return;
	        }

	        // Xử lý thanh toán (cập nhật CSDL, gửi email, thông báo thành công)
	        // Cập nhật thông tin đơn hàng vào CSDL
	        // ...

	        // Xóa giỏ hàng
	        session.removeAttribute("cart");

	        response.sendRedirect("confirmation.jsp");
	    }
}
