package usercars.app.entity;

import org.springframework.lang.NonNull;

import javax.persistence.*;

@Entity
@Table(name = "book")
public class Car {
    @Id
    @GeneratedValue
    private long id;
    private String make;
    private String model;
    @NonNull
    @Column(unique = true)
    private String numberplate;

    @ManyToOne
    @JoinColumn(name="user_id")
    private User user;

    public Car( String make, String model, String numberplate) {
        this.make=make;
        this.model=model;
        this.numberplate=numberplate;
    }

    public Car() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getMake() {
        return make;
    }

    public void setMake(String make) {
        this.make = make;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getNumberplate() {
        return numberplate;
    }

    public void setNumberplate(String numberplate) {
        this.numberplate = numberplate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Car{" +
                "id=" + id +
                ", make='" + make + '\'' +
                ", model='" + model + '\'' +
                ", numberplate='" + numberplate + '\'' +
                '}';
    }
}
