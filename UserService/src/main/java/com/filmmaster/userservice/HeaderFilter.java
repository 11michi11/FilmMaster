package com.filmmaster.userservice;

import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import java.io.IOException;

public class HeaderFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        chain.doFilter(request, new HttpServletResponseWrapper((HttpServletResponse) response) {
            public void setHeader(String name, String value) {
                if (!name.equalsIgnoreCase("Access-Control-Allow-Origin")) {
                    super.setHeader(name, value);
                }
            }
        });
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void destroy() {

    }
}
