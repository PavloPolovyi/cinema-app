<h1>
<p align="center">
  <img src="./img/banner.jpg" alt="Logo" width="140" height="110">
  <br>:film_projector: Cinema app :film_projector:
</h1>
  <p align="center">
    Cinema REST API for tickets reservation
    <br />
    </p>
</p>

<h2 align="center">📣 Project description 📣</h2>
This is a Cinema REST API for tickets reservation, that exposes several resources end-points: movies, cinema-halls, movie sessions, 
users, orders etc. It supports CRUD operations, has embedded authentication and authorization. Also, it follows
SOLID principles and is built up using N-tier architectural principle.

<h2 align="center">Features</h2>
- Registration and login/logout options<br>
- Authorization with two roles: user and admin<br>
- CRUD operations<br>
- Saving data to the database<br>
- 3-layer architecture: Controllers, Services and Repositories<br>

<h2 align="center">:bricks:Project structure:bricks:</h2>
- Controllers - take main part in request/response cycle, receive data from users and invoke business logic of services 
to process it and store in database. Send back data to users, when they request it.<br>
- Services - this layer coordinates work of all application, process commands and performs calculations.<br>
- Data access objects - here information is stored and retrieved.

<h2 align="center">:gear:Technologies:gear:</h2>
<p>
<img align="left" width="60px" alt="Java" src="https://user-images.githubusercontent.com/25181517/117201156-9a724800-adec-11eb-9a9d-3cd0f67da4bc.png" style="padding-right:10px;"/>
<img align="left" width="60px" alt="Spring" src="https://user-images.githubusercontent.com/25181517/117201470-f6d56780-adec-11eb-8f7c-e70e376cfd07.png" style="padding-right:10px;"/>
  <img align="left" width="50px" alt="Spring-Security" src="./img/spring-security.svg" style="padding-right:10px;"/>

<img align="left" width="60px" alt="Maven" src="https://user-images.githubusercontent.com/25181517/117207242-07d5a700-adf4-11eb-975e-be04e62b984b.png" style="padding-right:10px;"/>
<img align="left" width="60px" alt="Hibernate" src="https://user-images.githubusercontent.com/25181517/117207493-49665200-adf4-11eb-808e-a9c0fcc2a0a0.png" style="padding-right:10px;"/>
<img align="left" width="60px" alt="Liquibase" src="https://user-images.githubusercontent.com/25181517/183891673-32824908-bc5d-44f8-8f72-f0415822404a.png" style="padding-right:10px;"/>
<img align="left" width="60px" alt="Lombok" src="https://user-images.githubusercontent.com/25181517/190229463-87fa862f-ccf0-48da-8023-940d287df610.png" style="padding-right:10px;"/>
<img align="left" width="60px" alt="TomCat" src="https://user-images.githubusercontent.com/25181517/183894676-137319b5-1364-4b6a-ba4f-e9fc94ddc4aa.png" style="padding-right:10px;"/>
<img align="left" width="60px" alt="MySQL" src="https://user-images.githubusercontent.com/25181517/183896128-ec99105a-ec1a-4d85-b08b-1aa1620b2046.png" style="padding-right:10px;"/>
</p><br><br><br><br><br>


<h2 align="center">:bomb:Instructions for launching the project:bomb:</h2>
<h4>To run this project locally, follow these steps:</h4>

1️⃣ You should install <a href="https://tomcat.apache.org/download-90.cgi">TomCat</a>, <a href="https://dev.mysql.com/downloads/installer/">MySQL</a>
and <a href="https://maven.apache.org/install.html">Maven</a>

2️⃣  Clone this project from GitHub
```bash
git clone https://github.com/PavloPolovyi/taxi-service
```
:three:  Configure app.properties in resources folder: set db.user and db.password <br>
:four:  Run command
```bash
mvn build
```
5️⃣  Configure TomCat for this project and run it

:six: You need tool like <a href="https://curl.se/">Curl</a> or other utility that can send http requests to see how Cinema app works. You can use default user (email: admin@i.ua, password: admin123) or create your own by calling POST http method on "/register" endpoint and providing json object in format '{email:your email or whatever, password:your password}'.
