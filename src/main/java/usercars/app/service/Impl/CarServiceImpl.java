package usercars.app.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import usercars.app.entity.Car;
import usercars.app.repository.CarRepository;
import usercars.app.service.CarService;

import java.util.List;

@Service
public class CarServiceImpl implements CarService {

    @Autowired
    CarRepository carRepository;

    public List<Car> getCars(String make, String srt) {
        Sort sort;
        sort= new Sort(Sort.Direction.ASC, "make");
        if (srt.equalsIgnoreCase("make:desc"))
            sort = new Sort(Sort.Direction.DESC, "make");
        return carRepository.findAllBy(make, sort);
    }

    public Car getCar(long id) {
        return carRepository.findCarById(id, null);
    }

}
