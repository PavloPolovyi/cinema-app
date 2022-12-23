--liquibase formatted sql

--changeset mark:1
CREATE TABLE IF NOT EXISTS `cinema_halls` (
                                `id` bigint NOT NULL AUTO_INCREMENT,
                                `capacity` int NOT NULL,
                                `description` varchar(255) DEFAULT NULL,
                                PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
--rollback DROP TABLE cinema-halls;

--changeset mark:2
CREATE TABLE IF NOT EXISTS `movies` (
                          `id` bigint NOT NULL AUTO_INCREMENT,
                          `description` varchar(255) DEFAULT NULL,
                          `title` varchar(255) DEFAULT NULL,
                          PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
--rollback DROP TABLE movies;

--changeset mark:3
CREATE TABLE IF NOT EXISTS roles (
                        `id` bigint NOT NULL AUTO_INCREMENT,
                        `role_name` varchar(255) DEFAULT NULL,
                        PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
--rollback DROP TABLE roles;

--changeset mark:4
CREATE TABLE IF NOT EXISTS `movie_sessions` (
                                  `id` bigint NOT NULL AUTO_INCREMENT,
                                  `show_time` datetime(6) DEFAULT NULL,
                                  `cinema_hall_id` bigint DEFAULT NULL,
                                  `movie_id` bigint DEFAULT NULL,
                                  PRIMARY KEY (`id`),
                                  KEY `FKfqu527x0e0675k7vkm21ghv08` (`cinema_hall_id`),
                                  KEY `FKatpmn0h31nwhwdgd0ogr8q6kj` (`movie_id`),
                                  CONSTRAINT `FKatpmn0h31nwhwdgd0ogr8q6kj` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
                                  CONSTRAINT `FKfqu527x0e0675k7vkm21ghv08` FOREIGN KEY (`cinema_hall_id`) REFERENCES `cinema_halls` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
--rollback DROP TABLE movie_sessions;

--changeset mark:5
CREATE TABLE IF NOT EXISTS `users` (
                         `id` bigint NOT NULL AUTO_INCREMENT,
                         `email` varchar(255) DEFAULT NULL,
                         `password` varchar(255) DEFAULT NULL,
                         PRIMARY KEY (`id`),
                         UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
--rollback DROP TABLE users;

--changeset mark:6
CREATE TABLE IF NOT EXISTS users_roles (
                              `user_id` bigint NOT NULL,
                              `role_id` bigint NOT NULL,
                              PRIMARY KEY (`user_id`,`role_id`),
                              KEY `FK5tugnay00gvne82lrogxvisf` (`role_id`),
                              CONSTRAINT `FK5tugnay00gvne82lrogxvisf` FOREIGN KEY (`role_id`) REFERENCES roles (`id`),
                              CONSTRAINT `FKm55l5804g5w1cnxdqoki1v5le` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
--rollback DROP TABLE users_roles;

--changeset mark:7
CREATE TABLE IF NOT EXISTS `tickets` (
                           `id` bigint NOT NULL AUTO_INCREMENT,
                           `movie_session_id` bigint DEFAULT NULL,
                           `user_id` bigint DEFAULT NULL,
                           PRIMARY KEY (`id`),
                           KEY `FKidxabarcn97kf9acrcqokf1r9` (`movie_session_id`),
                           KEY `FK4eqsebpimnjen0q46ja6fl2hl` (`user_id`),
                           CONSTRAINT `FK4eqsebpimnjen0q46ja6fl2hl` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
                           CONSTRAINT `FKidxabarcn97kf9acrcqokf1r9` FOREIGN KEY (`movie_session_id`) REFERENCES `movie_sessions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
--rollback DROP TABLE tickets;

--changeset mark:8
CREATE TABLE IF NOT EXISTS `orders` (
                          `id` bigint NOT NULL AUTO_INCREMENT,
                          `order_time` datetime(6) DEFAULT NULL,
                          `user_id` bigint DEFAULT NULL,
                          PRIMARY KEY (`id`),
                          KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`),
                          CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
--rollback DROP TABLE orders;

--changeset mark:9
CREATE TABLE IF NOT EXISTS `orders_tickets` (
                                  `order_id` bigint NOT NULL,
                                  `ticket_id` bigint NOT NULL,
                                  UNIQUE KEY `UK_4l081u6j1tuvch26evaekjihi` (`ticket_id`),
                                  KEY `FKjoggp5iyq5fqbtxi5r1m2wlty` (`order_id`),
                                  CONSTRAINT `FKhpx6qk3psnomt9t2aig2nunfq` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`),
                                  CONSTRAINT `FKjoggp5iyq5fqbtxi5r1m2wlty` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
--rollback DROP TABLE orders_tickets;

--changeset mark:10
CREATE TABLE IF NOT EXISTS `shopping_carts` (
                                  `id` bigint NOT NULL,
                                  PRIMARY KEY (`id`),
                                  CONSTRAINT `FKc1fbrvff059ke4p8ce3hu38oa` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
--rollback DROP TABLE shopping_carts;

--changeset mark:11
CREATE TABLE IF NOT EXISTS `shopping_carts_tickets` (
                                          `shopping_cart_id` bigint NOT NULL,
                                          `ticket_id` bigint NOT NULL,
                                          UNIQUE KEY `UK_eusu1u2g6d73fcjvox629ct9y` (`ticket_id`),
                                          KEY `FKm5n3i4h3nk1p1yqywkn1kpej6` (`shopping_cart_id`),
                                          CONSTRAINT `FKaw8rn6oivawiyro857w06we16` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`),
                                          CONSTRAINT `FKm5n3i4h3nk1p1yqywkn1kpej6` FOREIGN KEY (`shopping_cart_id`) REFERENCES `shopping_carts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
--rollback DROP TABLE shopping_carts_tickets;

--changeset mark:12
INSERT INTO roles VALUES (1, 'USER');
--rollback DELETE FROM roles;

--changeset mark:13
INSERT INTO roles VALUES (2, 'ADMIN');
--rollback DELETE FROM roles;

