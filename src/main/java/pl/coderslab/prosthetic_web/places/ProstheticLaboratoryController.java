package pl.coderslab.prosthetic_web.places;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.prosthetic_web.user.AppUser;
import pl.coderslab.prosthetic_web.user.UserServiceImpl;

@Controller
@RequestMapping("/user")
public class ProstheticLaboratoryController {

    private final UserServiceImpl userService;
    private final ProstheticLaboratoryService laboratoryService;

    public ProstheticLaboratoryController(UserServiceImpl userService, ProstheticLaboratoryService prostheticLaboratoryService) {
        this.userService = userService;
        this.laboratoryService = prostheticLaboratoryService;
    }

    @GetMapping("/laboratory")
    public String addLaoboratoryForm(Model model) {
        ProstheticLaboratory chosenLaboratory = new ProstheticLaboratory();
        model.addAttribute("chosenLaboratory", chosenLaboratory);
        model.addAttribute("laboratories", laboratoryService.laboratoryList());
        return "/user/laboratory-form";
    }

    @PostMapping("/laboratory")
    public String performLaboratoryForm(ProstheticLaboratory laboratory) {
        AppUser currentUser = userService.getCurrentUser();
        ProstheticLaboratory chosenLabolatory = laboratoryService.getLaboratory(laboratory.getId());
        currentUser.setProstheticLaboratory(chosenLabolatory);
        userService.changeUser(currentUser);
        return "redirect:/user";
    }
}
