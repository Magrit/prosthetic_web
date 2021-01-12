package pl.coderslab.prosthetic_web.places;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import pl.coderslab.prosthetic_web.patient.DentalProsthesis;

import javax.persistence.*;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class ProstheticLaboratory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String city;
    private String address;
    private String nip;

    @OneToMany(mappedBy = "prostheticLaboratory")
    private List<DentalProsthesis> dentalProsthesis;

}
