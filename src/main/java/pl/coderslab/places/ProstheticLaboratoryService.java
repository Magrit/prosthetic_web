package pl.coderslab.places;

import org.springframework.stereotype.Service;
import pl.coderslab.user.AppUser;
import pl.coderslab.user.Role;
import pl.coderslab.user.RoleRepository;
import pl.coderslab.user.UserRepository;

import java.util.Optional;
import java.util.Set;

@Service
public class ProstheticLaboratoryService {

    private final ProstheticLaboratoryRepository prostheticLaboratoryRepository;
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public ProstheticLaboratoryService(ProstheticLaboratoryRepository prostheticLaboratoryRepository, UserRepository userRepository, RoleRepository roleRepository) {
        this.prostheticLaboratoryRepository = prostheticLaboratoryRepository;
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public void createLaboratory(long id, ProstheticLaboratory prostheticLaboratory){
        AppUser byId = userRepository.getOne(id);
        byId.setOwner(true);
        Set<Role> byIdRoles = byId.getRoles();
        byIdRoles.add(roleRepository.findByName("ROLE_OWNER"));
        byId.setRoles(byIdRoles);
        byId.setProstheticLaboratory(prostheticLaboratory);
        prostheticLaboratoryRepository.save(prostheticLaboratory);
    }

    public Optional<ProstheticLaboratory> laboratoryInfo(long id){
        return prostheticLaboratoryRepository.findById(id);
    }

    public void updateLaboratoryInfo(long id, String city, String address, String nip){
        ProstheticLaboratory laboratory = prostheticLaboratoryRepository.getOne(id);
        laboratory.setCity(city);
        laboratory.setAddress(address);
        laboratory.setNip(nip);
        prostheticLaboratoryRepository.save(laboratory);
    }

    private void deleteLaboratory(long id){
        prostheticLaboratoryRepository.deleteById(id);
    }
}
