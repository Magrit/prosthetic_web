package pl.coderslab.prosthetic_web.patient;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.prosthetic_web.places.StomatologyClinic;
import pl.coderslab.prosthetic_web.places.StomatologyClinicService;
import pl.coderslab.prosthetic_web.user.AppUser;
import pl.coderslab.prosthetic_web.user.CurrentUser;
import pl.coderslab.prosthetic_web.user.UserServiceImpl;

import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/user")
public class PatientController {

    private final PatientService patientService;
    private final ChartLabelsService chartLabelsService;
    private final UserServiceImpl userService;
    private final DentalProsthesisService prosthesisService;
    private final StomatologyClinicService clinicService;

    public PatientController(PatientService patientService, ChartLabelsService chartLabelsService,
                             UserServiceImpl userService, DentalProsthesisService prosthesisService,
                             StomatologyClinicService clinicService) {
        this.patientService = patientService;
        this.chartLabelsService = chartLabelsService;
        this.userService = userService;
        this.prosthesisService = prosthesisService;
        this.clinicService = clinicService;
    }

    private AppUser getCurrentUser() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        CurrentUser currentUser = (CurrentUser) principal;
        return userService.findByEmail(currentUser.getAppUser().getEmail());
    }

    @GetMapping("/patient")
    public String addPatient(Model model){
        model.addAttribute("patient", new Patient());
        return "/user/patient-new";
    }

    @PostMapping("/patient")
    public String preformPatient(Patient patient){
        patientService.addPatient(patient);
        StomatologyClinic clinic = getCurrentUser().getStomatologyClinic();
        clinic.setPatients(Arrays.asList(patient));
        clinicService.createClinic(clinic);
        return "redirect:/";
    }

    @GetMapping("/patient/{id}")
    public String patientInfo(@PathVariable long id, Model model){
        Patient patient = patientService.getPatient(id);
        model.addAttribute("patient", patient);
        List<DentalProsthesis> prostheses = prosthesisService.patientsProtheses(patient);
        model.addAttribute("prosthetisCounter", prostheses.size());
        List<ChartLabels> chartLabels = chartLabelsService.patientChart(id);
        model.addAttribute("labelCounter", chartLabels.size());
        model.addAttribute("chartLabels", chartLabels);
        return "/user/patient-info";
    }

    @GetMapping("/patient/new/{patientId}")
    public String addLabel(@PathVariable long patientId, Model model){
        Patient patient = patientService.getPatient(patientId);
        model.addAttribute("patient", patient);
        ChartLabels chartLabels = new ChartLabels();
        model.addAttribute("label", chartLabels);
        return "/user/patient-label";
    }

    @PostMapping("/patient/new/{patientId}")
    public String performLabel(@PathVariable long patientId, ChartLabels label){
        Patient patient = patientService.getPatient(patientId);
        List<ChartLabels> patientLabelsList = patient.getLabelsList();
        patientLabelsList.add(label);
        patient.setLabelsList(patientLabelsList);
        patientService.addPatient(patient);
        return "redirect:/";
    }

    @GetMapping("/patients")
    public String getPatients(Model model) {
        AppUser user = getCurrentUser();
        List<Patient> patientsSameClinic = patientService.patientsSameClinic(user.getStomatologyClinic().getId());
        model.addAttribute("patients", patientsSameClinic);
        return "/user/patients";
    }

}
