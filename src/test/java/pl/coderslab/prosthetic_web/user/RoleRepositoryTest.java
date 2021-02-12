package pl.coderslab.prosthetic_web.user;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

@RunWith(SpringRunner.class)
@DataJpaTest
class RoleRepositoryTest {

    @Autowired
    private TestEntityManager entityManager;

    @Autowired
    private RoleRepository roleRepository;

    public void find_by_name_then_return_role() {
        Role admin = new Role();
        admin.setName("ROLE_ADMIN");
        entityManager.persist(admin);

        Role result = roleRepository.findByName("ROLE_ADMIN");
        assertEquals(result.getName(), admin.getName());
    }

    public void given_admin_find_user_should_not_be_null() {
        Role admin = new Role();
        admin.setName("ROLE_ADMIN");
        entityManager.persist(admin);

        Role result = roleRepository.findByName("ROLE_USER");
        assertNull(result);
    }

}