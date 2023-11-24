DROP DATABASE if exists projekt_m141;

CREATE DATABASE projekt_m141;

USE projekt_m141;

CREATE TABLE Data (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  type VARCHAR(60) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE Meta (
  id INT NOT NULL AUTO_INCREMENT,
  data_id INT NOT NULL,
  path VARCHAR(60) NOT NULL,
  permission INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (data_id) REFERENCES Data (id)
);

CREATE TABLE Tag (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(80) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE Data_Tag (
  id INT NOT NULL AUTO_INCREMENT,
  data_id INT NOT NULL,
  tag_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (data_id) REFERENCES Data (id),
  FOREIGN KEY (tag_id) REFERENCES Tag (id)
);

CREATE TABLE Usergroup (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE Systemuser (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  password VARCHAR(255) NOT NULL,
  usergroup_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (usergroup_id) REFERENCES Usergroup (id)
);

CREATE TABLE Groupname (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE Meta
ADD CONSTRAINT fk_meta_usergroup FOREIGN KEY (permission) REFERENCES Usergroup (id);