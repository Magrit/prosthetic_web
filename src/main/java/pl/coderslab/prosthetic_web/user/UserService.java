package pl.coderslab.prosthetic_web.user;

public interface UserService {

    AppUser findByEmail(String email);

    void saveUser(AppUser appUser);
}
