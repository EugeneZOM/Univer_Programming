
# 1. University
DROP TABLE IF EXISTS worker_roles;
DROP TABLE IF EXISTS workers;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS groups;
DROP TABLE IF EXISTS faculty;

CREATE TABLE groups (
  id INT(7) UNSIGNED AUTO_INCREMENT UNIQUE,
  name VARCHAR(255) NOT NULL,

  PRIMARY KEY(id)
);

CREATE TABLE faculty (
  id INT(7) UNSIGNED AUTO_INCREMENT UNIQUE,
  name VARCHAR(255) NOT NULL,

  PRIMARY KEY(id)
);

CREATE TABLE people (
  id INT(7) UNSIGNED AUTO_INCREMENT UNIQUE,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,

  PRIMARY KEY(id)
);

CREATE TABLE workers (
  id INT(7) UNSIGNED AUTO_INCREMENT UNIQUE,
  pid INT(7) UNSIGNED NOT NULL,
  fid INT(7) UNSIGNED NOT NULL,

  PRIMARY KEY(id),
  FOREIGN KEY(pid) REFERENCES `people`(id),
  FOREIGN KEY(fid) REFERENCES `faculty`(id)
);

CREATE TABLE students (
  id INT(7) UNSIGNED AUTO_INCREMENT UNIQUE,
  pid INT(7) UNSIGNED,
  course INT(1) UNSIGNED DEFAULT 1,
  gid INT(7) UNSIGNED NOT NULL,
  fid INT(7) UNSIGNED NOT NULL,
  scholarship INT(1) UNSIGNED DEFAULT 0,

  PRIMARY KEY(id),
  FOREIGN KEY(pid) REFERENCES `people`(id),
  FOREIGN KEY(gid) REFERENCES `groups`(id),
  FOREIGN KEY(fid) REFERENCES `faculty`(id)
);

CREATE TABLE worker_roles (
  id INT(7) UNSIGNED AUTO_INCREMENT UNIQUE,
  wid INT(7) UNSIGNED NOT NULL,
  name VARCHAR(255) NOT NULL,

  PRIMARY KEY(id),
  FOREIGN KEY(wid) REFERENCES `workers`(id)
);