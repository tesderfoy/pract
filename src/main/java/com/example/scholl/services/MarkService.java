package com.example.scholl.services;

import com.example.scholl.models.Mark;
import com.example.scholl.models.User;
import com.example.scholl.repositories.MarkRepository;
import com.example.scholl.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class MarkService {
    @Autowired
    private final  MarkRepository markRepository;
    @Autowired
    private final UserRepository userRepository;

public  List<Mark> listMarks(String student){
    List<Mark> marks = markRepository.findAll();
    if (student != null) return markRepository.findByStudent(student);
    else {
        return marks;
    }
}

    public  void saveMarks(Principal principal, Mark mark){
    mark.setUser(getUserByPrincipal(principal));
        markRepository.save(mark);
    }

    public User getUserByPrincipal(Principal principal) {
    if (principal == null) return new User();
    return userRepository.findByEmail(principal.getName());
    }

    public void deleteMark(Long id){
    markRepository.deleteById(id);
    }

    public Mark getMarkById(Long id) {
       return  markRepository.findById(id).orElse(null);
    }
}
