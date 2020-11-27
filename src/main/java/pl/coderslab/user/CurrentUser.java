package pl.coderslab.user;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

public class CurrentUser extends User {

    private final AppUser appUser;

    public CurrentUser(String email, String password, Collection<? extends GrantedAuthority> grantedAuthorities, AppUser appUser) {
        super(email, password, grantedAuthorities);
        this.appUser = appUser;
    }

    public AppUser getAppUser() {
        return appUser;
    }
}
