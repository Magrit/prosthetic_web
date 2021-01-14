package pl.coderslab.prosthetic_web.places;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.prosthetic_web.user.AppUser;
import pl.coderslab.prosthetic_web.user.UserService;

@Controller
@RequestMapping("/user")
public class StomatologyClinicController {

    private final UserService userService;
    private final StomatologyClinicService clinicService;

    public StomatologyClinicController(@Qualifier("userServiceImpl")UserService userService, StomatologyClinicService clinicService) {
        this.userService = userService;
        this.clinicService = clinicService;
    }

    @GetMapping("/clinic")
    public String addClinicForm(Model model) {
        StomatologyClinic chosenClinic = new StomatologyClinic();
        model.addAttribute("chosenClinic", chosenClinic);
        model.addAttribute("clinics", clinicService.clinicList());
        return "/clinic-form";
    }

    @PostMapping("/clinic")
    public String performClinicForm(StomatologyClinic clinic) {
        AppUser user = userService.getCurrentUser();
        StomatologyClinic chosenClinic = clinicService.getClinic(clinic.getId());
        user.setStomatologyClinic(chosenClinic);
        userService.saveUser(user);
        return "redirect:/user";
    }
}
