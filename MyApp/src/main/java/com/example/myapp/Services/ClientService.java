package com.example.myapp.Services;

import com.example.myapp.Entities.Client;
import com.example.myapp.Interfaces.ClientInter;
import jakarta.servlet.http.HttpServletRequest;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public class ClientService {
    private ClientInter clientInter;

    public ClientService(ClientInter clientInter) {
        this.clientInter = clientInter;
    }

    public boolean save(HttpServletRequest req) throws Exception {
        Client client = new Client();
        client.setNom(req.getParameter("nom"));
        client.setPrenom(req.getParameter("prenom"));
        client.setDateDeNaissance(LocalDate.parse(req.getParameter("dateDeNaissance")));
        client.setTelephone(req.getParameter("telephone"));
        client.setCode(req.getParameter("code"));
        client.setAdresse(req.getParameter("adresse"));
        if (client.getPrenom().isEmpty() || client.getNom().isEmpty() || client.getCode().isEmpty() || client.getAdresse().isEmpty()) {
            throw new Exception("Please fill all inputs");
        } else {
            return this.clientInter.save(client).isPresent();
        }
    }

    public List<Client> findAll() {
        return clientInter.findAll();
    }

    public Optional<Client> update(HttpServletRequest req) {
        Client client1 = new Client();
        client1.setNom(req.getParameter("nom"));
        client1.setPrenom(req.getParameter("prenom"));
        client1.setDateDeNaissance(LocalDate.parse(req.getParameter("dateDeNaissance")));
        client1.setTelephone(req.getParameter("telephone"));
        client1.setCode(req.getParameter("code"));
        client1.setAdresse(req.getParameter("adresse"));
        return clientInter.update(client1);
    }

    public List<Client> findByAtr(String atr) {
        return clientInter.findByAtr(atr);
    }

    public Optional<Client> findOne(Client client) {
        return clientInter.findOne(client);
    }

    public int delete(String code) {
        Client client = new Client(code);
        return clientInter.delete(client);
    }
}
