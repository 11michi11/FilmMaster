package com.filmmaster.userservice;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @GetMapping
    String hello() {
        System.out.println("Hello");
        return "Hello";
    }

}
