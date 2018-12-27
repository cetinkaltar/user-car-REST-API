package usercars.app.service;

import org.springframework.stereotype.Service;
import usercars.app.entity.Car;

import java.util.Collection;

@Service
public interface CarService {
    Collection<Car> getCars(String make, String srt);
    Car getCar(long name);
}
