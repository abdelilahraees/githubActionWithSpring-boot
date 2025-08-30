package com.kida.ga;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {
    @GetMapping("/")
    public  String index() {
        return "<h1>Welcome to Kida's Genetic Algorithm Service</h1>";
    }
}
