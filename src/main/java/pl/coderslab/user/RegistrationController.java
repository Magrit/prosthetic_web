package pl.coderslab.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pl.coderslab.specializations.Specialization;
import pl.coderslab.specializations.SpecializationService;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@Controller
public class RegistrationController {

    private final UserServiceImpl userService;
    private final SpecializationService specializationService;

    public RegistrationController(UserServiceImpl userService, SpecializationService specializationService) {
        this.userService = userService;
        this.specializationService = specializationService;
    }

    @ModelAttribute(name = "specList")
    public List<Specialization> allSpecialization(){
        return specializationService.findAllSpecializations();
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("user", new AppUser());
        return "/registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String performRegistration(@Valid @ModelAttribute("user") AppUser user, BindingResult result,
                                      RedirectAttributes attributes, HttpServletRequest request) {
        String confirmPassword = request.getParameter("confirmPassword");

        if (result.hasErrors() || !user.getPassword().equals(confirmPassword)) {
            return "/registration";
        }else{
            userService.saveUser(user);
            attributes.addFlashAttribute("message", "Pomyślnie zarejestrowano nowego użytkownika");
            return "redirect:/";
        }

    }
}
