package com.example.myapp.Services;

import com.example.myapp.Entities.Client;
import com.example.myapp.Interfaces.ClientInter;

import java.util.List;
import java.util.Optional;

public class ClientService {
    private ClientInter clientInter;

    public ClientService(ClientInter clientInter) {
        this.clientInter = clientInter;
    }

    public boolean save(Client client) {
        if (client.getPrenom().isEmpty() || client.getNom().isEmpty() || client.getCode().isEmpty() || client.getAdresse().isEmpty()) {
            return false;
        } else {
            if (this.clientInter.save(client).isEmpty()) {
                return false;
            } else {
                return true;
            }
        }
    }

    public List<Client> findAll() {
        return clientInter.findAll();
    }
}
