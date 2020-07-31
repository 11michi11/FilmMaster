package com.filmmaster.searchservice.repository;


import com.filmmaster.searchservice.model.User;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.Optional;
import java.util.UUID;

public interface UserRepository extends MongoRepository<User, UUID> {

    Optional<User> findByEmail(String email);

}
