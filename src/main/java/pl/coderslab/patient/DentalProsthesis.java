package pl.coderslab.patient;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import pl.coderslab.places.ProstheticLaboratory;
import pl.coderslab.specializations.Specialization;
import pl.coderslab.user.AppUser;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class DentalProsthesis {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private LocalDate dateOfOrder;
    private LocalDate deadline;
    private String type;
    private String variety;
    private String description;
    private String materials;
    private BigDecimal price;
    private boolean isPaid;

    @ManyToOne
    private Patient patient;

    @ManyToOne
    private ChartLabels chartLabel;

    @ManyToMany
    private List<Specialization> specializations;

    @ManyToOne
    private ProstheticLaboratory prostheticLaboratory;

    @ManyToOne
    private AppUser appUser;
}
