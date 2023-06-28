package com.example.scholl.repositories;

import com.example.scholl.models.Mark;
import org.springframework.data.jpa.repository.JpaRepository;


import java.util.List;


public interface MarkRepository extends JpaRepository<Mark,Long> {


    List<Mark> findByUser(String user);
}
