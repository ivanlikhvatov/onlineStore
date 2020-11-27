package org.example.onlineStore.service;

import org.example.onlineStore.domain.Role;
import org.example.onlineStore.domain.User;
import org.example.onlineStore.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {
    @Autowired
    UserRepo userRepo;

    @Autowired
    MailSender mailSender;

    private String newEmail;

    public boolean addUser(User user){
        User userFromDb = userRepo.findByEmail(user.getEmail());

        if (userFromDb != null){
            return false;
        }


        user.setActive(false);
        user.setRoles(Collections.singleton(Role.USER));
        user.setActivationCode(UUID.randomUUID().toString());

        userRepo.save(user);

        if (!StringUtils.isEmpty(user.getEmail())){
            String message = String.format(
                    "Здравствуйте, %s \n" + "Приветствуем Вас в нашем интернет магазине TechPort. Пожалуйста посетите следующую ссылку: http://localhost:8080/activate/%s",
                    user.getUsername(),
                    user.getActivationCode()
            );

            mailSender.send(user.getEmail(), "Activation Code", message);
        }

        return true;
    }

    public boolean activateUser(String code) {
        User user = userRepo.findByActivationCode(code);

        if (user == null) {
            return false;
        }

        user.setActivationCode(null);
        user.setActive(true);

        if (newEmail != null){
            user.setEmail(newEmail);
        }

        userRepo.save(user);

        return true;
    }

    public void saveUser(User user, Map<String, String> form) {

        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());

        user.getRoles().clear();

        for (String key : form.keySet()){
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }

        userRepo.save(user);
    }

    public void saveUser(User user){
        userRepo.save(user);
    }

    public boolean updateProfile(User user, String password, String email, String username) {

        if (!StringUtils.isEmpty(password)){
            user.setPassword(password);
        }

        if (!StringUtils.isEmpty(username)){
            user.setUsername(username);
        }

        userRepo.save(user);

        String userEmail = user.getEmail();

        boolean isEmailChanged = (email != null && !email.equals(userEmail)) ||
                (userEmail != null && !userEmail.equals(email));

        User userFromBd = userRepo.findByEmail(email);

        if (isEmailChanged){

            if (userFromBd != null){
                return false;
            }

            if (!StringUtils.isEmpty(email)){
                user.setActivationCode(UUID.randomUUID().toString());
            }

            userRepo.save(user);
            newEmail = email;
        }

        if (isEmailChanged){
            if (!StringUtils.isEmpty(email)){
                String message = String.format(
                        "Здравствуйте, %s \n" + "Приветствуем Вас в нашем интернет-магазине TechPort. Для подтверждения аккаунта пожалуйста посетите следующую ссылку: http://localhost:8080/activate/%s",
                        user.getUsername(),
                        user.getActivationCode()
                );

                mailSender.send(email, "Подтвердите аккаунт", message);
            }
        }

        return true;

    }

    public void deleteUsersFavoriteProduct(String productId) {
        List<User> users = userRepo.findAll();

        for (User user : users) {
            if (user.getFavoritesProducts().get(productId) != null){
                user.getFavoritesProducts().remove(productId);
                userRepo.save(user);
            }
        }

    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        return userRepo.findByEmail(email);
    }

    public List<User> findAllMatchesByPartUsername(String filter) {
        return userRepo.findByUsernameContaining(filter);
    }

    public List<User> findAll() {
        return userRepo.findAll();
    }

    public User findByEmail(String email) {
        return userRepo.findByEmail(email);
    }

    public List<User> findAllByEmailContaining(String email){
        return userRepo.findAllByEmailContaining(email);
    }

    public Optional<User> findById(Long id) {
        return userRepo.findById(id);
    }
}
