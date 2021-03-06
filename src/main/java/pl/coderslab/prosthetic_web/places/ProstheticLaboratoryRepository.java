package pl.coderslab.prosthetic_web.places;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProstheticLaboratoryRepository extends JpaRepository<ProstheticLaboratory, Long> {
}
