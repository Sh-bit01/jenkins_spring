package com.example.demo.controller;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class mycontroller {

    // Handle GET request to /api/hello
    @GetMapping("/hello")
    public String sayHello() {
        return "Hello, World!";
    }

    // Handle POST request to /api/greet
    @PostMapping("/greet")
    public String greetUser(@RequestBody String name) {
        return "Hello, " + name + "!";
    }
}

