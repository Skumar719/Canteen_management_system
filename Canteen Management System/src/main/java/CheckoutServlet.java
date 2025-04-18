import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        // Get form data
        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        String paymentMethod = request.getParameter("payment");
        
        // Get cart items from session
        List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
        
        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("menu.jsp");
            return;
        }
        
        // Calculate total
        double total = 0;
        for (Map<String, Object> item : cart) {
            double price = (Double) item.get("price");
            int quantity = item.get("quantity") != null ? (Integer) item.get("quantity") : 1;
            total += price * quantity;
        }
        
        // Create order object
        Map<String, Object> order = new HashMap<>();
        order.put("orderId", UUID.randomUUID().toString().substring(0, 8).toUpperCase());
        order.put("customerName", name);
        order.put("customerMobile", mobile);
        order.put("deliveryAddress", address);
        order.put("paymentMethod", paymentMethod);
        order.put("total", total);
        order.put("items", new ArrayList<>(cart)); // Create a copy of the cart
        order.put("orderDate", new java.util.Date());
        
        // Store order in session
        session.setAttribute("currentOrder", order);
        
        // Clear the cart
        session.removeAttribute("cart");
        
        // Redirect to confirmation page
        response.sendRedirect("orderConfirmation.jsp");
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // If someone accesses checkout.jsp directly without items, redirect to menu
        HttpSession session = request.getSession();
        List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
        
        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("menu.jsp");
        } else {
            // If cart has items, just forward to checkout.jsp
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        }
    }
}