package org.example.onlineStore.repos;

import org.example.onlineStore.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String name);
    List<User> findByUsernameContaining(String name);
    User findByActivationCode(String code);
    User findByEmail(String email);
    List<User> findAllByEmailContaining(String email);
    User findByEmailAndPassword(String email, String password);
}
