import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@WebServlet("/DeleteOrderHistoryServlet")
public class DeleteOrderHistoryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        
        HttpSession session = request.getSession();
        List<Map<String, Object>> orderHistory = (List<Map<String, Object>>) session.getAttribute("orderHistory");
        
        if (orderHistory != null) {
            // Remove the order with the matching orderId
            orderHistory.removeIf(order -> order.get("orderId").toString().equals(orderId));
            session.setAttribute("orderHistory", orderHistory);
        }
        
        response.setContentType("text/plain");
        response.getWriter().write("success");
    }
}