package pl.coderslab.prosthetic_web.places;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class StomatologyClinicService {

    private final StomatologyClinicRepository stomatologyClinicRepository;

    public StomatologyClinicService(StomatologyClinicRepository stomatologyClinicRepository) {
        this.stomatologyClinicRepository = stomatologyClinicRepository;
    }

    public void createClinic(StomatologyClinic stomatologyClinic){
        stomatologyClinicRepository.save(stomatologyClinic);
    }

    public Optional<StomatologyClinic> clinicInfo(long id){
        return stomatologyClinicRepository.findById(id);
    }

    public StomatologyClinic getClinic(long id){
        return stomatologyClinicRepository.getOne(id);
    }

    public List<StomatologyClinic> clinicList(){
        return stomatologyClinicRepository.findAll();
    }

    public void UpdateClinicInfo(long id, String city, String address, String nip){
        StomatologyClinic clinic = stomatologyClinicRepository.getOne(id);
        clinic.setCity(city);
        clinic.setAddress(address);
        clinic.setNip(nip);
        stomatologyClinicRepository.save(clinic);
    }

    public void deleteClinic(long id){
        stomatologyClinicRepository.deleteById(id);
    }
}
