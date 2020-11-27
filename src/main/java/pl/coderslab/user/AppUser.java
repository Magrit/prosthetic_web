package pl.coderslab.user;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import pl.coderslab.places.ProstheticLaboratory;
import pl.coderslab.places.StomatologyClinic;
import pl.coderslab.specializations.Specialization;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "appuser")
@Setter
@Getter
@NoArgsConstructor
public class AppUser {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotBlank(message = "{email.notBlank}")
    @Email(message = "{email.valid}")
    @Column(unique = true)
    private String email;

    @Pattern(regexp = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+=])(?=\\S+$).{8,}$", message = "{pattern.password}")
    private String password;

    @NotBlank(message = "{firstName.notBlank}")
    private String firstName;

    @NotBlank(message = "{lastName.notBlank}")
    private String lastName;
    private boolean technician;
    private boolean stomatologist;
    private boolean isOwner;

    @NotBlank(message = "{certificateNumber.notBlank}")
    @Column(unique = true)
    private String certificateNumber;

    @ManyToOne
    private StomatologyClinic stomatologyClinic;

    @ManyToOne
    private ProstheticLaboratory prostheticLaboratory;

    @ManyToMany
    private List<Specialization> specializations;

    @ManyToMany
    private Set<Role> roles;

}
