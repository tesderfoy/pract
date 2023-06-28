package com.example.scholl.services;

import com.example.scholl.models.User;
import com.example.scholl.models.enums.Role;
import com.example.scholl.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

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
}
