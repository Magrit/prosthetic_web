package pl.coderslab.prosthetic_web.patient;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pl.coderslab.prosthetic_web.user.AppUser;
import pl.coderslab.prosthetic_web.user.CurrentUser;
import pl.coderslab.prosthetic_web.user.UserServiceImpl;

import java.util.List;

@Controller
public class DetailsController {

    private final UserServiceImpl userService;
    private final DentalProsthesisService prosthesisService;
    private final PatientService patientService;

    public DetailsController(UserServiceImpl userService, DentalProsthesisService prosthesisService, PatientService patientService) {
        this.userService = userService;
        this.prosthesisService = prosthesisService;
        this.patientService = patientService;
    }

    private AppUser getCurrentUser() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        CurrentUser currentUser = (CurrentUser) principal;
        return userService.findByEmail(currentUser.getAppUser().getEmail());
    }

        @GetMapping("/user/prosthesis")
    public String getProstheses(Model model) {
        AppUser currentUser = getCurrentUser();
        List<DentalProsthesis> prostheses = prosthesisService.prosthesesByUser(currentUser);
        model.addAttribute("prostheses", prostheses);
        return "/prosthesis";
    }

    @GetMapping("/user/patients")
    public String getPatients(Model model) {
        AppUser user = getCurrentUser();
        List<Patient> patientsSameClinic = patientService.patientsSameClinic(user.getStomatologyClinic().getId());
        model.addAttribute("patients", patientsSameClinic);
        return "/patients";
    }

}
