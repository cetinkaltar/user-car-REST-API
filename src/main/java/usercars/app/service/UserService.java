package usercars.app.service;

import org.springframework.stereotype.Service;
import usercars.app.entity.Car;
import usercars.app.entity.User;

import java.util.Collection;
import java.util.Set;

@Service
public interface UserService {
    Collection<User> getUsers(String name, String srt);

    User getUser(String name);

    Set<Car> getUserCars(String name);
}
