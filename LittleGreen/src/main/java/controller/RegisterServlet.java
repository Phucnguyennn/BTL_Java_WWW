package controller;

import dao.UserDAO;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        String role = "customer"; // Mặc định là khách hàng

        // Tạo đối tượng User
        User user = new User(email, password, name, address, phoneNumber, role);
        
        // Lưu vào cơ sở dữ liệu
        UserDAO userDAO = new UserDAO();
        userDAO.addUser(user);
        
        // Chuyển hướng đến trang đăng nhập
        response.sendRedirect("login.jsp");
    }
}
