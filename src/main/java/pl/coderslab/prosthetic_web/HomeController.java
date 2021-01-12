package pl.coderslab.prosthetic_web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.prosthetic_web.places.ProstheticLaboratoryService;
import pl.coderslab.prosthetic_web.places.StomatologyClinicService;
import pl.coderslab.prosthetic_web.user.UserServiceImpl;

@Controller
@RequestMapping("")
public class HomeController {

    private final UserServiceImpl userService;
    private final StomatologyClinicService clinicService;
    private final ProstheticLaboratoryService laboratoryService;

    public HomeController(UserServiceImpl userService, StomatologyClinicService clinicService,
                          ProstheticLaboratoryService laboratoryService) {
        this.userService = userService;
        this.clinicService = clinicService;
        this.laboratoryService = laboratoryService;
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

    @GetMapping("/laboratories")
    public String laboratories(Model model){
        model.addAttribute("laboratories", laboratoryService.laboratoryList());
        return "/laboratories";
    }

    @GetMapping("/clinics")
    public String clinics(Model model){
        model.addAttribute("clinics", clinicService.clinicList());
        return "/clinics";
    }

}