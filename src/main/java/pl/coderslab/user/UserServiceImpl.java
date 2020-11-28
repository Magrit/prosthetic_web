package pl.coderslab.user;

import org.hibernate.Hibernate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.coderslab.places.ProstheticLaboratory;

import java.util.*;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    public UserServiceImpl(UserRepository userRepository, RoleRepository roleRepository, BCryptPasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public AppUser findByEmail(String email) {
        AppUser byEmail = userRepository.findByEmail(email);
        Hibernate.initialize(byEmail.getRoles());
        return byEmail;
    }

    public void saveUser(AppUser appUser) {
        String password = passwordEncoder.encode(appUser.getPassword());
        appUser.setPassword(password);
        appUser.setEnabled(1);
        Set<Role> roles = new HashSet<>();
        roles.add(roleRepository.findByName("ROLE_USER"));
        if (appUser.isTechnician()) {
            roles.add(roleRepository.findByName("ROLE_TECHNICIAN"));
        }
        if (appUser.isStomatologist()) {
            roles.add(roleRepository.findByName("ROLE_STOMATOLOGIST"));
        }
        if (appUser.isOwner()) {
            roles.add(roleRepository.findByName("ROLE_OWNER"));
        }

        appUser.setRoles(roles);
        userRepository.save(appUser);
    }

    public void addDetails(long id, ProstheticLaboratory prostheticLaboratory){
        AppUser user = userRepository.getOne(id);
        user.setProstheticLaboratory(prostheticLaboratory);
    }

    Optional<AppUser> findById(long id) {
        return userRepository.findById(id);
    }

    void updateUser(long id, String email, String firstName, String lastName, String certificateNumber) {
        AppUser appUser = userRepository.getOne(id);
        appUser.setEmail(email);
        appUser.setFirstName(firstName);
        appUser.setLastName(lastName);
        appUser.setCertificateNumber(certificateNumber);
        userRepository.save(appUser);
    }

    void deleteUser(long id) {
        userRepository.delete(userRepository.getOne(id));

    }

    List<AppUser> findAll() {
        return userRepository.findAll();
    }
}
