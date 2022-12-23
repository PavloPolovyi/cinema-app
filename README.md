# <center>:film_projector: Cinema app :film_projector:</center>
<img src="./img/banner.jpg" width="100%" height="10%" alt="cinema-app">

## <center>📣 Project description 📣</center>
This is a Cinema REST API for tickets reservation, that exposes several resources end-points: movies, cinema-halls, movie sessions, 
users, orders etc. It supports CRUD operations, has embedded authentication and authorization. Also, it follows
SOLID principles and is built up using N-tier architectural principle.

## <center>Features</center>
* Registration and login/logout options
* Authorization with two roles: user and admin
* CRUD operations
* Saving data to the database
* Full compatibilities with REST principles
* 3-layer architecture: Controllers, Services and Repositories

## <center>Project structure</center>
* Controllers - take main part in request/response cycle, receive data from users and invoke business logic of services 
to procces it and store in database. Send back data to users, when they request it.
* Services - these layers coordinates work of all application, procces commands and performs calculations.
* Data access objects - here information is stored and retrieved.

## <center>:gear:Technologies:gear:</center>
* Java 11
* Spring Core
* Spring Security
* Hibernate
* Tomcat
* Liquibase
* MySQL
* Lombok
* Maven

## <center>:bomb:Instructions for launching the project:bomb:</center>
<h4>To run this project locally, follow these steps:</h4>

1️⃣ You should install <a href="https://tomcat.apache.org/download-90.cgi">TomCat</a> version 9, <a href="https://dev.mysql.com/downloads/installer/">MySQL</a>
and <a href="https://maven.apache.org/install.html">Maven</a>

2️⃣  Clone this project from GitHub
```bash
git clone https://github.com/PavloPolovyi/taxi-service
```
4️⃣  Configure app.properties in resources folder: set db.user and db.password 
2️⃣  Run command
```bash
mvn build
```
5️⃣  Configure TomCat for this project and run it



