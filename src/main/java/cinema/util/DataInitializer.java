package cinema.util;

import cinema.model.Role;
import cinema.model.User;
import cinema.service.RoleService;
import cinema.service.UserService;
import java.util.Optional;
import java.util.Set;
import javax.annotation.PostConstruct;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

@Component
public class DataInitializer {
    private final RoleService roleService;
    private final UserService userService;
    private final Environment environment;

    public DataInitializer(RoleService roleService,
                           UserService userService, Environment environment) {
        this.roleService = roleService;
        this.userService = userService;
        this.environment = environment;
    }

    @PostConstruct
    public void inject() {
        Optional<User> userOptional = userService
                .findByEmail(environment.getProperty("user.email"));
        if (userOptional.isEmpty()) {
            Role admin = roleService.getByName("ADMIN");
            User user = new User();
            user.setEmail(environment.getProperty("user.email"));
            user.setPassword(environment.getProperty("user.password"));
            user.setRoles(Set.of(admin));
            userService.add(user);
        }
    }
}
