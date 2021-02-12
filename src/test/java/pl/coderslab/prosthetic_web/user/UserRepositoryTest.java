package pl.coderslab.prosthetic_web.user;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.jupiter.api.Assertions.*;

@RunWith(SpringRunner.class)
@DataJpaTest
class UserRepositoryTest {

    @Autowired
    private TestEntityManager entityManager;

    @Autowired
    private UserRepository userRepository;

    @Test
    public void find_by_email_then_return_appUser() {
        AppUser userMark = new AppUser();
        userMark.setEmail("mark@gmail.com");
        entityManager.persist(userMark);

        AppUser result = userRepository.findByEmail("mark@gmail.com");
        assertEquals(result.getEmail(), userMark.getEmail());
    }

    @Test
    public void given_mark_find_email_should_not_be_null() {
        AppUser userMark = new AppUser();
        userMark.setEmail("mark@gmail.com");
        entityManager.persist(userMark);

        AppUser result = userRepository.findByEmail("email");
        assertNull(result);
    }
}