package usercars.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import usercars.app.service.UserService;

import java.util.Optional;

@Controller
@RequestMapping(value = "/users")
public class UserController {

    @Autowired
    UserService userService;

    @GetMapping(value = "")
    public String getAll(Model model, @RequestParam Optional<String> find
            , @RequestParam Optional<String> sort) {
        model.addAttribute("users", userService.getUsers(find.orElse("_"), sort.orElse("name:asc")));
        return "users";
    }

    @GetMapping(value = "/{name}")
    public String getUser(Model model,@PathVariable("name") String name) {
        userService.getUser(name);
        model.addAttribute("user",userService.getUser(name));
        return "users";
    }

    @GetMapping(value = "/{name}/cars")
    public String getUserCars(Model model,@PathVariable("name") String name) {
        model.addAttribute("username",name);
        model.addAttribute("cars",userService.getUserCars(name));
        return "user-cars";
    }

}
