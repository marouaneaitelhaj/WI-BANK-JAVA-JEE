package com.example.myapp.Interfaces;



import com.example.myapp.Entities.Client;
import com.example.myapp.Repository.CrudRepository;

import java.util.List;

public interface ClientInter extends CrudRepository<Client> {
    List<Client> findByAtr(String text);
}
