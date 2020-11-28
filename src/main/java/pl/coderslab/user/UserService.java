package pl.coderslab.user;

public interface UserService {

    AppUser findByEmail(String email);

    void saveUser(AppUser appUser);
}
