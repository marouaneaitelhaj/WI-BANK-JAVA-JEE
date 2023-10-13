package com.example.myapp.Repository;

import java.util.List;
import java.util.Optional;

public interface CrudRepository<M> {
    Optional<M> save(M m) throws Exception;

    Optional<M> update(M m);

    int delete(M m);

    Optional<M> findOne(M m);

    List<M> findAll();
}