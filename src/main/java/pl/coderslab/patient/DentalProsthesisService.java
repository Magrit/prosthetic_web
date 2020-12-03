package pl.coderslab.patient;

import org.springframework.stereotype.Service;
import pl.coderslab.user.AppUser;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class DentalProsthesisService {

    private final DentalProsthesisRepository dentalProsthesisRepository;

    public DentalProsthesisService(DentalProsthesisRepository dentalProsthesisRepository) {
        this.dentalProsthesisRepository = dentalProsthesisRepository;
    }

    public void addProsthesis(DentalProsthesis prosthesis){
        dentalProsthesisRepository.save(prosthesis);
    }

    public Optional<DentalProsthesis> prosthesisInfo(long id){
        return dentalProsthesisRepository.findById(id);
    }

    public List<DentalProsthesis> prosthesesByUser(AppUser user){
        LocalDate date = LocalDate.now();
        return dentalProsthesisRepository.findAllByUserAndDeadline(user, date);
    }

    public List<DentalProsthesis> patientsProtheses(Patient patient){
        return dentalProsthesisRepository.findAllByPatient(patient);
    }

    public void deleteProsthesis(long id){
        dentalProsthesisRepository.deleteById(id);
    }
}
