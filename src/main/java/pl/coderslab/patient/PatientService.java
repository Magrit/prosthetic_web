package pl.coderslab.patient;

import org.springframework.stereotype.Service;
import pl.coderslab.places.StomatologyClinic;
import pl.coderslab.places.StomatologyClinicRepository;

import java.util.Comparator;
import java.util.List;
import java.util.Optional;

@Service
public class PatientService {

    private final PatientRepository patientRepository;
    private final StomatologyClinicRepository stomatologyClinicRepository;

    public PatientService(PatientRepository patientRepository, StomatologyClinicRepository stomatologyClinicRepository) {
        this.patientRepository = patientRepository;
        this.stomatologyClinicRepository = stomatologyClinicRepository;
    }

    public void newPatient(Patient patient){
        patientRepository.save(patient);
    }

    public Optional<Patient> patientInfo(long id){
        return patientRepository.findById(id);
    }

    public List<Patient> patientsSameClinic(long clinicId){
        StomatologyClinic clinic = stomatologyClinicRepository.getOne(clinicId);
        List<Patient> clinicPatients = clinic.getPatients();
        for (Patient patient : clinicPatients) {
            patient.getLabelsList().sort(ChartLabels::compareTo);
        }
        return clinicPatients;
    }

    public void updatePatientInfo(long id, String firstName, String lastName, String city, String address){
        Patient patient = patientRepository.getOne(id);
        patient.setFirstName(firstName);
        patient.setLastName(lastName);
        patient.setCity(city);
        patient.setAddress(address);
        patientRepository.save(patient);
    }

    public void deletePatient(long id){
        patientRepository.deleteById(id);
    }
}
