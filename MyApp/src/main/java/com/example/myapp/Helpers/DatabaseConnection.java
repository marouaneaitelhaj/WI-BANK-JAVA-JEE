package com.example.myapp.Helpers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static DatabaseConnection instance;
    private final String url = "jdbc:postgresql://localhost/myBank";
    private final String user = "postgres";
    private final String password = "root";
    private Connection conn = null;

    private DatabaseConnection() {
        try {
            Class.forName("org.postgresql.Driver");
            this.conn = DriverManager.getConnection(url, user, password);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
    }

    public Connection getConnection() {
        return this.conn;
    }

    public static DatabaseConnection getInstance() {
        if (instance == null) {
            instance = new DatabaseConnection();
        }
        return instance;
    }
}
