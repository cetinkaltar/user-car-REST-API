package usercars.app.repository;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import usercars.app.entity.User;

import java.util.List;

public interface UserRepository extends CrudRepository<User, Long> {
    User findUserByName(String name);

    @Query("select u from User u where name like %?1%")
    List<User> findAllBy(String name, Sort sort);
}
