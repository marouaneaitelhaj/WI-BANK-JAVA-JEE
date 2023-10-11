package com.example.myapp.Servlets;

import com.example.myapp.Entities.Client;
import com.example.myapp.Implementations.ClientImpl;
import com.example.myapp.Interfaces.ClientInter;
import com.example.myapp.Services.ClientService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@WebServlet(urlPatterns = {"/addclient", "/clientlist", "/updateclient"})
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
                List<Client> optionalClient = this.clientService.findAll();
                req.setAttribute("clientList", optionalClient);
                req.getRequestDispatcher("ClientPages/clientlist.jsp").forward(req, resp);
                break;
            case "/updateclient":
                String code = req.getParameter("code");
                Optional<Client> client = clientInter.findOne(new Client(code));
                if (client.isPresent()) {
                    req.setAttribute("client", client.get());
                    req.getRequestDispatcher("ClientPages/update.jsp").forward(req, resp);
                }

                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getRequestURI();
        switch (path) {
            case "/addclient":
                Client client = new Client();
                client.setNom(req.getParameter("nom"));
                client.setPrenom(req.getParameter("prenom"));
                client.setDateDeNaissance(LocalDate.parse(req.getParameter("dateDeNaissance")));
                client.setTelephone(req.getParameter("telephone"));
                client.setCode(req.getParameter("code"));
                client.setAdresse(req.getParameter("adresse"));
                try {
                    if (this.clientService.save(client)) {
                        req.setAttribute("created", true);
                        req.getRequestDispatcher("ClientPages/create.jsp").forward(req, resp);
                    }
                } catch (Exception e) {
                    req.setAttribute("alert", true);
                    req.getRequestDispatcher("ClientPages/create.jsp").forward(req, resp);
                }
                break;
            case "/updateclient":
                Optional<Client> optionalClient = clientService.update(req);
                if (optionalClient.isPresent()) {
                    req.setAttribute("client", optionalClient.get());
                    req.setAttribute("updated", true);
                    req.getRequestDispatcher("ClientPages/update.jsp").forward(req, resp);
                }
                break;
            case "/clientlist":
                req.getParameter("atr");
                List<Client> clientList = clientInter.findByAtr(req.getParameter("atr"));
                req.setAttribute("clientList", clientList);
                req.getRequestDispatcher("ClientPages/clientlist.jsp").forward(req, resp);
                break;
        }
    }
}
