package usercars.app.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import usercars.app.entity.Car;
import usercars.app.entity.User;
import usercars.app.repository.UserRepository;
import usercars.app.service.UserService;

import java.util.List;
import java.util.Set;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserRepository userRepository;

    public List<User> getUsers(String name, String srt) {
        Sort sort = new Sort(Sort.Direction.ASC, "name");
        if (srt.equalsIgnoreCase("name:desc"))
            new Sort(Sort.Direction.DESC, "name");
        return userRepository.findAllBy(name, sort);
    }

    public User getUser(String name) {
        return userRepository.findUserByName(name);
    }

    public Set<Car> getUserCars(String name) {
        User user = new User();
        user = userRepository.findUserByName(name);
        if (user != null) {
            return user.getCars();
        }
        return null;
    }
}
