package pl.coderslab.prosthetic_web.patient;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ChartLabelsRepository extends JpaRepository<ChartLabels, Long> {

    public List<ChartLabels> findAllByPatient(Patient patient);
    public List<ChartLabels> findAllByPatientAndDentalProsthesis(Patient patient, DentalProsthesis dentalProsthesis);
}
