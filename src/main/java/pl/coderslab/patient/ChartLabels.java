package pl.coderslab.patient;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
public class ChartLabels implements Comparable<ChartLabels> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private LocalDate date;
    private String description;
    private boolean isDentalProsthesisOrdered;

    @ManyToOne
    private Patient patient;

    @OneToMany(mappedBy = "chartLabel")
    private List<DentalProsthesis> dentalProsthesis;

    @Override
    public int compareTo(ChartLabels c) {
        return this.date.compareTo(c.getDate());
    }
}
