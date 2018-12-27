package usercars.app;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import usercars.app.entity.Car;
import usercars.app.entity.User;
import usercars.app.repository.CarRepository;
import usercars.app.repository.UserRepository;

import java.util.*;

@SpringBootApplication
public class AppApplication  {

    public static void main(String[] args) {
        SpringApplication.run(AppApplication.class, args);
    }


    @Autowired
    UserRepository userRepository;
    @Autowired
    CarRepository carRepository;

    @Bean
    InitializingBean sendDatabase() {
        return () -> {
            userRepository.deleteAll();
            carRepository.deleteAll();

            Set<Car> cars = new HashSet<>();
            cars.add(new Car("lada", "2111", "123ASD"));
            cars.add(new Car("kia", "sorento", "534TTT"));
            cars.add(new Car("nissan", "qasqai", "794BVZ"));
            User u1 = new User("tee", cars);
            carRepository.saveAll(cars);
            userRepository.save(u1);

            Set<Car> carss = new HashSet<>();
            carss.add(new Car("audi", "q7", "124BSD"));
            carss.add(new Car("maserati", "blacl", "534CET"));
            carss.add(new Car("volvo", "s60", "894BVH"));
            User u2 = new User("lee", carss);
            carRepository.saveAll(carss);
            userRepository.save(u2);
        };
    }
}

