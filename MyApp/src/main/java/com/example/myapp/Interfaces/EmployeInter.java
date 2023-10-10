package com.example.myapp.Interfaces;

import com.example.myapp.Entities.Employe;
import com.example.myapp.Repository.CrudRepository;

import java.util.List;

public interface EmployeInter extends CrudRepository<Employe> {
    List<Employe> findByAtr(String text);
}
