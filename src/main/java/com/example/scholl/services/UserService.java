package com.example.scholl.services;

import com.example.scholl.models.User;
import com.example.scholl.models.enums.Role;
import com.example.scholl.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
    @Autowired
    private final UserRepository userRepository;

    private final PasswordEncoder passwordEncoder;
    public  boolean createUser(User user){
        String userEmail = user.getEmail();
        if (userRepository.findByEmail(userEmail)!=null) return false;
        user.setActive(true);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.getRoles().add(Role.ROLE_TEACHER);
        log.info("saving new teacher");
        userRepository.save(user);
        return true;
    }


    public List<User> list(){

        return userRepository.findAll();
    }

    public void banUser(Long id) {
        User user = userRepository.findById(id).orElse(null);
        if (user != null){
            if (user.isActive()){
                user.setActive(false);
                log.info("Ban user witch id {}, email:  {}", user.getId(), user.getEmail());
            }
            else {
                user.setActive(true);
                log.info("UnBan user witch id {}, email:  {}", user.getId(), user.getEmail());
            }

        }
        userRepository.save(user);
    }

    // преобразование ролей в set из строк,
    public void changeUserRoles(User user, Map<String, String> form) {
        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)// каждую роль этой колекции преобразовываем в строковый вид
                .collect(Collectors.toSet()); // преобразовываем в set
        user.getRoles().clear(); // очистка роли
        for (String key : form.keySet()){
            if (roles.contains(key)){ //проходим по ролям, сравниваем, если сожержи, то назначаем
                user.getRoles().add(Role.valueOf(key));
            }
        }
        userRepository.save(user);
    }
}
