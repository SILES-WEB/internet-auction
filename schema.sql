DROP DATABASE IF EXISTS cousework;
CREATE DATABASE cousework CHARACTER SET = utf8;
USE cousework;


CREATE TABLE categories (
  id INT AUTO_INCREMENT PRIMARY KEY,
  character_code VARCHAR(128) UNIQUE,
  name_category VARCHAR(128)
);
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  date_registration DATETIME DEFAULT CURRENT_TIMESTAMP,
  email VARCHAR(128) NOT NULL UNIQUE,
  user_name VARCHAR(128),
  user_password CHAR(255),
  contacts TEXT
);
CREATE TABLE lots (
  id INT AUTO_INCREMENT PRIMARY KEY,
  date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
  title VARCHAR(255),
  lot_description TEXT,
  img VARCHAR(255),
  start_price INT,
  date_finish DATE,
  step INT,
  user_id INT,
  winner_id INT,
  category_id INT,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (winner_id) REFERENCES users(id),
  FOREIGN KEY (category_id) REFERENCES categories(id),
  FULLTEXT (title, lot_description)
);
CREATE TABLE bets (
  id INT AUTO_INCREMENT PRIMARY KEY,
  date_bet DATETIME DEFAULT CURRENT_TIMESTAMP,
  price_bet INT,
  user_id INT,
  lot_id INT,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (lot_id) REFERENCES lots(id)
);



