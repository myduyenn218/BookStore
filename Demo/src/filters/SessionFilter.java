package filters;

        import Model.Cart;

        import javax.servlet.*;
        import javax.servlet.annotation.WebFilter;
        import javax.servlet.http.*;
        import java.io.IOException;
        import java.util.ArrayList;
        import java.util.StringTokenizer;

@WebFilter(filterName = "SessionFilter", urlPatterns = "/*")
public class SessionFilter implements Filter {

    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpSession session =  ((HttpServletRequest) request).getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        chain.doFilter(request, response);
    }

    public void init(FilterConfig config) throws ServletException {
    }
}
