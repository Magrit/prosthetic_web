package pl.coderslab.prosthetic_web.user;

import org.hibernate.Hibernate;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.prosthetic_web.patient.DentalProsthesis;
import pl.coderslab.prosthetic_web.patient.DentalProsthesisService;
import pl.coderslab.prosthetic_web.patient.Patient;
import pl.coderslab.prosthetic_web.patient.PatientService;
import pl.coderslab.prosthetic_web.places.ProstheticLaboratory;
import pl.coderslab.prosthetic_web.places.ProstheticLaboratoryService;
import pl.coderslab.prosthetic_web.places.StomatologyClinic;
import pl.coderslab.prosthetic_web.places.StomatologyClinicService;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    private final UserServiceImpl userService;
    private final DentalProsthesisService dentalProsthesisService;
    private final PatientService patientService;

    public UserController(UserServiceImpl userService, DentalProsthesisService dentalProsthesisService,
                          PatientService patientService) {
        this.userService = userService;
        this.dentalProsthesisService = dentalProsthesisService;
        this.patientService = patientService;
    }

    @GetMapping("")
    public String dashboard(Model model) {
        AppUser user = userService.getCurrentUser();
        if (user.isStomatologist()) {
            StomatologyClinic clinic = user.getStomatologyClinic();
            model.addAttribute("clinic", clinic);
            List<Patient> clinicPatients = new ArrayList<>();
            if (clinic != null) {
                List<Patient> patientsSameClinic = patientService.patientsSameClinic(clinic.getId());
                clinicPatients.addAll(patientsSameClinic);
            }
            model.addAttribute("patients", clinicPatients);
        }
        if (user.isTechnician()) {
            ProstheticLaboratory laboratory = user.getProstheticLaboratory();
            model.addAttribute("laboratory", laboratory);

            List<DentalProsthesis> prostheses = dentalProsthesisService.prosthesesByUser(user);
            model.addAttribute("prostheses", prostheses);
        } else {
            System.out.println(user.getEmail());
        }
        model.addAttribute("user", user);
        return "/user/dashboard";
    }

    @GetMapping("/data")
    public String changeUserData(Model model) {
        AppUser user = userService.getCurrentUser();
        model.addAttribute("user", user);
        Hibernate.initialize(user.getSpecializations());
        model.addAttribute("specializationsList", user.getSpecializations());
        return "/user/change-data";
    }

    @PostMapping("/data")
    public String performUserData(AppUser user) {
        AppUser currentUser = userService.getCurrentUser();
        userService.updateUser(currentUser.getId(), user.getEmail(), user.getFirstName(), user.getLastName(),
                user.getCertificateNumber());
        return "redirect:/user";
    }

}
