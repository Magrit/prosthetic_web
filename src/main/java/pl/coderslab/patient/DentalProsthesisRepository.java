package pl.coderslab.patient;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DentalProsthesisRepository extends JpaRepository<DentalProsthesis, Long> {
}
