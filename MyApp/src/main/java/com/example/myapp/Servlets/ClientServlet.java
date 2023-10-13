package com.example.myapp.Servlets;

import com.example.myapp.Entities.Client;
import com.example.myapp.Implementations.ClientImpl;
import com.example.myapp.Interfaces.ClientInter;
import com.example.myapp.Services.ClientService;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@WebServlet(urlPatterns = {"/addclient", "/clientlist", "/updateclient", "/deleteclient"})
public class ClientServlet extends HttpServlet {
    ClientInter clientInter = new ClientImpl();
    ClientService clientService = new ClientService(clientInter);


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getRequestURI();
        switch (path) {
            case "/addclient":
                req.getRequestDispatcher("ClientPages/create.jsp").forward(req, resp);
                break;

            case "/clientlist":
                List<Client> optionalClient = new ArrayList<>();
                if (req.getParameter("atr") == null) {
                    optionalClient = this.clientService.findAll();
                } else {
                    optionalClient = clientService.findByAtr(req.getParameter("atr"));
                }
                req.setAttribute("clientList", optionalClient);
                req.getRequestDispatcher("ClientPages/clientlist.jsp").forward(req, resp);
                break;

            case "/updateclient":
                String code = req.getParameter("code");
                if (code == null) {
                    req.setAttribute("message", "Page not found");
                    req.getRequestDispatcher("slot.jsp").forward(req, resp);
                }
                Optional<Client> client = clientService.findOne(new Client(code));
                if (client.isPresent()) {
                    req.setAttribute("client", client.get());
                    req.getRequestDispatcher("ClientPages/update.jsp").forward(req, resp);
                } else {
                    req.setAttribute("message", "User not found");
                    req.getRequestDispatcher("slot.jsp").forward(req, resp);
                }
                break;
            case "/deleteclient":
                if (clientService.delete(req.getParameter("code")) == 1) {
                    resp.sendRedirect("/clientlist");
                } else {
                    req.setAttribute("message", "Clien2 did no2 2e2end the");
                    req.getRequestDispatcher("slot.jsp").forward(req, resp);
                }
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getRequestURI();
        switch (path) {
            case "/addclient":
                try {
                    if (this.clientService.save(req)) {
                        req.setAttribute("message", "Client Created");
                        req.getRequestDispatcher("slot.jsp").forward(req, resp);
                    }
                } catch (Exception e) {
                    req.setAttribute("message", e.getMessage());
                    req.getRequestDispatcher("slot.jsp").forward(req, resp);
                }
                break;
            case "/updateclient":
                Optional<Client> optionalClient = clientService.update(req);
                if (optionalClient.isPresent()) {
                    req.setAttribute("message", "Client Updated");
                    req.getRequestDispatcher("slot.jsp").forward(req, resp);
                } else {

                }
                break;

            /*case "/clientlist":
                req.getParameter("atr");
                List<Client> clientList = clientService.findByAtr(req.getParameter("atr"));
                req.setAttribute("clientList", clientList);
                req.getRequestDispatcher("ClientPages/clientlist.jsp").forward(req, resp);
                break;*/
        }
    }
}
