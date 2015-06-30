package com.theopentutorials.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
/**
 * Servlet implementation class HelloWorldServlet
 */
public class HelloWorldServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public HelloWorldServlet() {
        super();
    }
 
    public void doGet(HttpServletRequest request, 
            HttpServletResponse response) 
        throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        out.println("Hello World");
    }
}


