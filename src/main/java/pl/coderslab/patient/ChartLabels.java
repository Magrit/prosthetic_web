package pl.coderslab.patient;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class ChartLabels {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private Date date;
    private String description;
    private boolean isDentalProsthesisOrdered;

    @ManyToOne
    private Patient patient;

    @OneToMany(mappedBy = "chartLabel")
    private List<DentalProsthesis> dentalProsthesis;
}
