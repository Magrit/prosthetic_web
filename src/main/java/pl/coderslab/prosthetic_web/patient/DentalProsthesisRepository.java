package pl.coderslab.prosthetic_web.patient;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.prosthetic_web.user.AppUser;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface DentalProsthesisRepository extends JpaRepository<DentalProsthesis, Long> {

    @Query("SELECT p FROM DentalProsthesis p WHERE p.appUser=?1 and p.deadline>= ?2")
    public List<DentalProsthesis> findAllByUserAndDeadline(AppUser appUser, LocalDate date);

    public List<DentalProsthesis> findAllByPatient(Patient patient);
}
