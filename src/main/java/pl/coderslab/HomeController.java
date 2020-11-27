package pl.coderslab;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.specializations.SpecializationService;
import pl.coderslab.user.AppUser;
import pl.coderslab.user.UserService;

@Controller
@RequestMapping("")
public class HomeController {

    private final UserService userService;

    public HomeController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("")
    public String home() {
        return "/home";
    }

    @GetMapping("/about")
    public String about(){
        return "/about";
    }

    @GetMapping("/contact")
    public String contact(){
        return "/contact";
    }

}
