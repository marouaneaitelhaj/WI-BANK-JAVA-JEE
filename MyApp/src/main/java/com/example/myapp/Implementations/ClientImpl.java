package com.example.myapp.Implementations;


import com.example.myapp.Entities.Client;
import com.example.myapp.Helpers.DatabaseConnection;
import com.example.myapp.Interfaces.ClientInter;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class ClientImpl implements ClientInter {
    Connection connection = DatabaseConnection.getInstance().getConnection();

    @Override
    public Optional<Client> save(Client client) {
        try {
            String query = "INSERT INTO client(nom, prenom, datedenaissance, telephone, code, adresse) VALUES (?, ?, ?, ?, ?, ?) " +
                    "RETURNING *";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, client.getNom());
            statement.setString(2, client.getPrenom());
            statement.setDate(3, Date.valueOf(client.getDateDeNaissance()));
            statement.setString(4, client.getTelephone());
            statement.setString(5, client.getCode());
            statement.setString(6, client.getAdresse());
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                Client client1 = new Client();
                client1.setNom(resultSet.getString("nom"));
                client1.setPrenom(resultSet.getString("prenom"));
                client1.setTelephone(resultSet.getString("telephone"));
                client1.setCode(resultSet.getString("code"));
                client1.setAdresse(resultSet.getString("adresse"));
                client1.setDateDeNaissance(LocalDate.parse(resultSet.getString("datedenaissance")));
                return Optional.of(client1);
            } else {
                return Optional.empty();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return Optional.empty();
    }

    @Override
    public Optional<Client> update(Client client) {
        try {
            String query = "UPDATE client SET nom=?, prenom=?, telephone=?, adresse=?, datedenaissance=? WHERE code=?;";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, client.getNom());
            statement.setString(2, client.getPrenom());
            statement.setString(3, client.getTelephone());
            statement.setString(4, client.getAdresse());
            statement.setDate(5, Date.valueOf(client.getDateDeNaissance().toString()));
            statement.setString(6, client.getCode());
            if (statement.executeUpdate() == 0) {
                return Optional.empty();
            }
            return Optional.of(client);
        } catch (Exception e) {
            System.out.println(e);
        }
        return Optional.empty();
    }

    @Override
    public int delete(Client client) {
        try {
            String query = "DELETE FROM client WHERE code=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, client.getCode());
            if (preparedStatement.executeUpdate() == 0) {
                return 0;
            }
            return 1;
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    @Override
    public Optional<Client> findOne(Client client) {
        try {
            String query = "SELECT nom, prenom, telephone, code, adresse, datedenaissance FROM client WHERE code=?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, client.getCode());
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                client.setNom(resultSet.getString("nom"));
                client.setPrenom(resultSet.getString("prenom"));
                client.setTelephone(resultSet.getString("telephone"));
                client.setCode(resultSet.getString("code"));
                client.setAdresse(resultSet.getString("adresse"));
                client.setDateDeNaissance(LocalDate.parse(resultSet.getString("datedenaissance")));
            }
            return Optional.of(client);
        } catch (Exception e) {
            System.out.println(e);
        }

        return Optional.empty();
    }

    @Override
    public List<Client> findAll() {
        List<Client> clientList = new ArrayList<Client>();
        try {
            String query = "SELECT nom, prenom, telephone, code, adresse, datedenaissance FROM client;";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                Client client = new Client();
                client.setNom(resultSet.getString("nom"));
                client.setPrenom(resultSet.getString("prenom"));
                client.setTelephone(resultSet.getString("telephone"));
                client.setCode(resultSet.getString("code"));
                client.setAdresse(resultSet.getString("adresse"));
                client.setDateDeNaissance(LocalDate.parse(resultSet.getString("datedenaissance")));
                clientList.add(client);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return clientList;
    }

    @Override
    public List<Client> findByAtr(String text) {
        List<Client> clientList = new ArrayList<Client>();
        try {
            String query = "SELECT nom, prenom, telephone, code, adresse, datedenaissance FROM client WHERE nom LIKE ? OR prenom LIKE ? OR telephone LIKE ? OR code LIKE ? OR adresse LIKE ? ;";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, "%" + text + "%");
            preparedStatement.setString(2, "%" + text + "%");
            preparedStatement.setString(3, "%" + text + "%");
            preparedStatement.setString(4, "%" + text + "%");
            preparedStatement.setString(5, "%" + text + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Client client = new Client();
                client.setNom(resultSet.getString("nom"));
                client.setPrenom(resultSet.getString("prenom"));
                client.setTelephone(resultSet.getString("telephone"));
                client.setCode(resultSet.getString("code"));
                client.setAdresse(resultSet.getString("adresse"));
                client.setDateDeNaissance(LocalDate.parse(resultSet.getString("datedenaissance")));
                clientList.add(client);
            }
        } catch (Exception e) {
        }
        return clientList;
    }
}
