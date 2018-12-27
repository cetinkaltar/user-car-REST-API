package usercars.app.repository;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import usercars.app.entity.Car;

import java.util.List;

public interface CarRepository extends CrudRepository<Car, Long> {
    Car findCarById(long id ,Sort sort);
    @Query("select c from Car c where make like %?1% ")
    List<Car> findAllBy(String make, Sort sort);
}
