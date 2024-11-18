CREATE DATABASE IF NOT EXISTS Tourism;
USE Tourism;

CREATE TABLE Countries (
  country_id INT PRIMARY KEY AUTO_INCREMENT,
  country_name VARCHAR(255) NOT NULL UNIQUE
);


CREATE TABLE Cities (
  city_id INT PRIMARY KEY AUTO_INCREMENT,
  city_name VARCHAR(255) NOT NULL,
  country_id INT,
  FOREIGN KEY (country_id) REFERENCES Countries(country_id)
);


CREATE TABLE TourTypes (
  tour_type_id INT PRIMARY KEY AUTO_INCREMENT,
  tour_type_name VARCHAR(255) NOT NULL UNIQUE
);


CREATE TABLE Services (
  service_id INT PRIMARY KEY AUTO_INCREMENT,
  service_name VARCHAR(255) NOT NULL UNIQUE,
  price DECIMAL(10, 2) NOT NULL
);


CREATE TABLE Tours (
  tour_id INT PRIMARY KEY AUTO_INCREMENT,
  tour_type_id INT NOT NULL,
  city_id INT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  customer_name VARCHAR(255) NOT NULL,
  customer_phone VARCHAR(20),
  customer_email VARCHAR(255),
  FOREIGN KEY (tour_type_id) REFERENCES TourTypes(tour_type_id),
  FOREIGN KEY (city_id) REFERENCES Cities(city_id)
);


CREATE TABLE TourServices (
  tour_service_id INT PRIMARY KEY AUTO_INCREMENT,
  tour_id INT NOT NULL,
  service_id INT NOT NULL,
  FOREIGN KEY (tour_id) REFERENCES Tours(tour_id),
  FOREIGN KEY (service_id) REFERENCES Services(service_id)
);


INSERT INTO Countries (country_name) VALUES ('Россия'), ('Турция'), ('Египет');
INSERT INTO Cities (city_name, country_id) VALUES ('Москва', 1), ('Стамбул', 2), ('Хургада', 3);
INSERT INTO TourTypes (tour_type_name) VALUES ('Экскурсионный'), ('Пляжный'), ('Горнолыжный');
INSERT INTO Services (service_name, price) VALUES ('Трансфер', 50.00), ('Медстраховка', 20.00), ('Экскурсия', 100.00);

INSERT INTO Tours (tour_type_id, city_id, start_date, end_date, price, customer_name, customer_phone, customer_email) 
VALUES (1, 1, '2024-05-01', '2024-05-05', 500.00, 'Иван Иванов', '+79001234567', 'ivan@example.com');


INSERT INTO TourServices (tour_id, service_id) VALUES (1,1), (1,2);
