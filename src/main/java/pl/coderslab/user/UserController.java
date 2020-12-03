package pl.coderslab.user;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
        }

        return "/dashboard";
    }


    @GetMapping("/clinic")
    public String addClinicForm(Model model) {
        StomatologyClinic chosenClinic = new StomatologyClinic();
        model.addAttribute("chosenClinic", chosenClinic);
        model.addAttribute("clinics", stomatologyClinicService.clinicList());
        return "/clinic-form";
    }

    @PostMapping("/clinic")
    public String performClinicForm(StomatologyClinic clinic) {
        AppUser user = getCurrentUser();
        StomatologyClinic chosenClinic = stomatologyClinicService.getClinic(clinic.getId());
        user.setStomatologyClinic(chosenClinic);
        userService.saveUser(user);
        return "redirect:/user";
    }

    @GetMapping("/laboratory")
    public String addLaoboratoryForm(Model model) {
        ProstheticLaboratory chosenLaboratory = new ProstheticLaboratory();
        model.addAttribute("choosenLabolatory", chosenLaboratory);
        model.addAttribute("laboratories", prostheticLaboratoryService.laboratoryList());
        return "/laboratory-form";
    }

    @PostMapping("/laboratory")
    public String performLaboratoryForm(ProstheticLaboratory laboratory) {
        AppUser currentUser = getCurrentUser();
        ProstheticLaboratory chosenLabolatory = prostheticLaboratoryService.getLaboratory(laboratory.getId());
        currentUser.setProstheticLaboratory(chosenLabolatory);
        userService.changeUser(currentUser);
        return "redirect:/user";
    }

    @GetMapping("/prosthesis")
    public String getProstheses(Model model) {
        AppUser currentUser = getCurrentUser();
        List<DentalProsthesis> prostheses = dentalProsthesisService.prosthesesByUser(currentUser);
        model.addAttribute("prostheses", prostheses);
        return "/prosthesis";
    }

    @GetMapping("/patients")
    public String getPatients(Model model) {
        AppUser currentUser = getCurrentUser();
        List<Patient> patientsSameClinic = patientService.patientsSameClinic(currentUser.getStomatologyClinic().getId());
        model.addAttribute("patients", patientsSameClinic);
        return "/patients";
    }

}
