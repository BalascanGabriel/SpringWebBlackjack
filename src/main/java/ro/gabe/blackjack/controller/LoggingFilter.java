package ro.gabe.blackjack.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

@Component
//@Order(Ordered.HIGHEST_PRECEDENCE)
@WebFilter(value="/secured/*", urlPatterns = {"/secured/*"})
public class LoggingFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		System.out.println("[Debug] Request from: " + request.getRemoteAddr());
		chain.doFilter(request, response);
	}

}
