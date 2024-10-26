package hexlet.code.controller;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
@RequestMapping(path = "")
public class WelcomeController {
    @GetMapping
    public String welcome() {
        return "Welcome to Spring";
    }

}
