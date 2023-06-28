package com.example.scholl.controllers;

import com.example.scholl.models.Mark;
import com.example.scholl.services.MarkService;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.zip.Inflater;

@Controller
@RequiredArgsConstructor
public class MarkController {
    private final MarkService markService;

    @GetMapping("/")
    public String marks(@RequestParam(name = "teacher", required = false) String teacher,Principal principal,Model model){
        model.addAttribute("marks", markService.listMarks(teacher));
        model.addAttribute("user",markService.getUserByPrincipal(principal));
        return "mark";
    }

    @GetMapping("mark/{id}")
    public String markInfo(@PathVariable Long id, Model model){
        model.addAttribute("mark", markService.getMarkById(id));
        return "mark-info";

    }


    @PostMapping("mark/create")
    public String createMark(Mark mark, Principal principal){
        markService.saveMarks(principal,mark);
        return "redirect:/";

    }

    @PostMapping("mark/delete/{id}")
    public String deleteMark(@PathVariable Long id){
        markService.deleteMark(id);
        return "redirect:/";
    }
}
