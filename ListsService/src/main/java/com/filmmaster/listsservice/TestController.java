package com.filmmaster.listsservice;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

@RestController
public class TestController {

    @GetMapping
    String hello(Principal principal) {
        return "Hello " + principal.getName();
    }

}
