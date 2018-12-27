package usercars.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import usercars.app.service.CarService;

import java.util.Optional;

@Controller
@RequestMapping(value = "/cars")
public class CarController {

    @Autowired
    CarService carService;

    @GetMapping(value = "")
    public String getAll(Model model, @RequestParam Optional<String> make, @RequestParam Optional<String> sort) {

        model.addAttribute("cars", carService.getCars(make.orElse("_"), sort.orElse("make:asc")));
        return "cars";
    }

    @GetMapping(value = "/{id}")
    public String getCar(Model model, @PathVariable("id") long id) {
        model.addAttribute("car", carService.getCar(id));
        return "cars";
    }

}
