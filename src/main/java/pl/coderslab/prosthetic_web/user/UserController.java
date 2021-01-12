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
            System.out.println(laboratory.getAddress());
            model.addAttribute("laboratory", laboratory);

            List<DentalProsthesis> prostheses = dentalProsthesisService.prosthesesByUser(user);
            model.addAttribute("prostheses", prostheses);
        }
        else {
            System.out.println(user.getEmail());
        }
        model.addAttribute("user", user);
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
        model.addAttribute("chosenLaboratory", chosenLaboratory);
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

    @GetMapping("/data")
    public String changeUserData(Model model){
        AppUser user = getCurrentUser();
        model.addAttribute("user", user);
        Hibernate.initialize(user.getSpecializations());
        model.addAttribute("specializationsList",user.getSpecializations());
        return "/change-data";
    }

    @PostMapping("/data")
    public String performUserData(AppUser user){
        AppUser currentUser = getCurrentUser();
        userService.updateUser(currentUser.getId(),user.getEmail(), user.getFirstName(), user.getLastName(),
                user.getCertificateNumber());
        return "/user";
    }

}
