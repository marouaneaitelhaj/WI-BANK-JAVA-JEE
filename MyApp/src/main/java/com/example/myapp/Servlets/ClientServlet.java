package com.example.myapp.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(urlPatterns = {"/addclient", "updateclient"})
public class ClientServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getRequestURI();
        switch (path) {
            case "addclient":
                req.getRequestDispatcher("ClientPages/create.jsp").forward(req, resp);
                break;
            case "updateclient":
                req.getRequestDispatcher("ClientPages/update.jsp").forward(req, resp);
                break;
        }
    }

}
