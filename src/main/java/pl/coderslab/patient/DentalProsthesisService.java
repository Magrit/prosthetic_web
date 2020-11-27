package pl.coderslab.patient;

import java.util.Optional;

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

    public void deleteProsthesis(long id){
        dentalProsthesisRepository.deleteById(id);
    }
}
