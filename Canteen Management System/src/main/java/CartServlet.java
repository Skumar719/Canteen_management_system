import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
        
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }
        
        String action = request.getParameter("action");
        String itemName = request.getParameter("item");
        String priceStr = request.getParameter("price");
        String indexStr = request.getParameter("index");
        
        if ("add".equals(action)) {  // Fixed: Added missing closing parenthesis
            if (itemName != null && priceStr != null) {
                try {
                    double price = Double.parseDouble(priceStr);
                    Map<String, Object> item = new HashMap<>();
                    item.put("name", itemName);
                    item.put("price", price);
                    cart.add(item);
                } catch (NumberFormatException e) {
                    // Handle error
                    e.printStackTrace();
                }
            }
        } 
        else if ("remove".equals(action)) {
            if (indexStr != null) {
                try {
                    int index = Integer.parseInt(indexStr);
                    if (index >= 0 && index < cart.size()) {
                        cart.remove(index);
                    }
                } catch (NumberFormatException e) {
                    // Handle error
                    e.printStackTrace();
                }
            }
        }
        
        session.setAttribute("cart", cart);
        response.sendRedirect("cart.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendRedirect("cart.jsp");
    }
}