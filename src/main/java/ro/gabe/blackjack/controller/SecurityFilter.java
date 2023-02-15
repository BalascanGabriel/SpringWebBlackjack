package ro.gabe.blackjack.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

@Component
//@Order(Ordered.HIGHEST_PRECEDENCE)
@WebFilter(value = "/secured/**", urlPatterns = { "/secured/**" })
public class SecurityFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		System.out.println("HELLO FROM FILTER: " + req.getRequestURL());
		if (req.getRequestURL().toString().contains("/secured/") && false) {
			if (req.getSession(true).getAttribute("user") == null) {
				System.out.println("SENDING REDIRECT");
			res.sendRedirect("/login");
			return;
			}
		}
		chain.doFilter(request, response);
	}

}
