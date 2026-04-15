package com.rahul.tourism.tourismapp;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "🌍 Welcome to Rahul Spring Boot Tourism App 🚀";
    }
}