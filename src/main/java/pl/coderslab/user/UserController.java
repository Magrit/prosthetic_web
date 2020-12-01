package pl.coderslab.user;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.patient.DentalProsthesis;
import pl.coderslab.patient.DentalProsthesisService;
import pl.coderslab.patient.Patient;
import pl.coderslab.patient.PatientService;
import pl.coderslab.places.ProstheticLaboratory;
import pl.coderslab.places.ProstheticLaboratoryService;
import pl.coderslab.places.StomatologyClinic;
import pl.coderslab.places.StomatologyClinicService;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/user")
public class UserController {

    private final UserServiceImpl userService;
    private final DentalProsthesisService dentalProsthesisService;
    private final PatientService patientService;
    private final StomatologyClinicService stomatologyClinicService;
    private final ProstheticLaboratoryService prostheticLaboratoryService;


    public UserController(UserServiceImpl userService, DentalProsthesisService dentalProsthesisService,
                          PatientService patientService, StomatologyClinicService stomatologyClinicService,
                          ProstheticLaboratoryService prostheticLaboratoryService) {
        this.userService = userService;
        this.dentalProsthesisService = dentalProsthesisService;
        this.patientService = patientService;
        this.stomatologyClinicService = stomatologyClinicService;
        this.prostheticLaboratoryService = prostheticLaboratoryService;
    }

    private AppUser getCurrentUser() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        CurrentUser currentUser = (CurrentUser) principal;
        return userService.findByEmail(currentUser.getAppUser().getEmail());
    }

    @GetMapping("")
    public String dashboard(Model model) {
        AppUser user = getCurrentUser();
        if (user.isStomatologist()) {
            Optional<StomatologyClinic> clinic = Optional.ofNullable(user.getStomatologyClinic());
            model.addAttribute("clinic", clinic);
            long clinicId = clinic
                    .map(stomatologyClinic -> stomatologyClinic.getId())
                    .orElse(Long.parseLong("0"));
            List<Patient> clinicPatients = new ArrayList<>();
            clinicPatients.addAll(patientService.patientsSameClinic(clinicId));
            model.addAttribute("patients", clinicPatients);
        }
        if (user.isTechnician()) {
            ProstheticLaboratory laboratory = user.getProstheticLaboratory();
            model.addAttribute("laboratory", laboratory);

            List<DentalProsthesis> prostheses = dentalProsthesisService.prosthesesByUser(user);
            model.addAttribute("prostheses", prostheses);
        }

        return "/dashboard";
    }


    @GetMapping("/clinic")
    public String addClinicForm(Model model) {
        model.addAttribute("clinicies", stomatologyClinicService.clinicList());
        return "/clinic-form";
    }

    @PostMapping("/clinic")
    public String performClinicForm(@RequestParam long clinicId) {
        AppUser user = getCurrentUser();
        user.setStomatologyClinic(stomatologyClinicService.getClinic(clinicId));
        return "redirect:/user";
    }

    @GetMapping("/laboratory")
    public String addLaoboratoryForm(Model model) {
        List<ProstheticLaboratory> laboratories = prostheticLaboratoryService.laboratoryList();
        model.addAttribute("laboratories", laboratories);
        return "/laboratory-form";
    }

    @PostMapping("/laboratory")
    public String performLaboratoryForm(@RequestParam long laboratoryId) {
        AppUser user = getCurrentUser();
        user.setProstheticLaboratory(prostheticLaboratoryService.getLaboratory(laboratoryId));
        return "redirect:/user";
    }

}
