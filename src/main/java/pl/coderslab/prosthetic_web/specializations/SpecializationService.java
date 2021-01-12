package pl.coderslab.prosthetic_web.specializations;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SpecializationService {

    private SpecializationRepository specializationRepository;

    public SpecializationService(SpecializationRepository specializationRepository) {
        this.specializationRepository = specializationRepository;
    }

    public Optional<Specialization> getSpecialization(long id){
        return specializationRepository.findById(id);
    }

    public List<Specialization> findAllSpecializations(){
        return specializationRepository.findAll();
    }
}
