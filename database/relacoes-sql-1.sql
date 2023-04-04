-- Active: 1680558853551@@127.0.0.1@3306
-- Práticas
-- Prática 2 --
CREATE TABLE users(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);

SELECT * FROM users;

CREATE TABLE phones (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    phone_number TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id)
);

SELECT * FROM phones;

INSERT INTO users VALUES
("U001", "Fulano", "fulano@email.com", "1234"), ("U002", "Ciclano", "ciclano@email.com", "4321");

INSERT INTO phones VALUES
("P001", "99991234", "U002"),
("P002", "43219999", "U001"),
("P003", "98761111", "U002");

SELECT * FROM users 
INNER JOIN phones 
ON phones.user_id = users.id;

SELECT users.name, phones.phone_number FROM users 
INNER JOIN phones 
ON phones.user_id = users.id;

-- Prática 3 --
CREATE TABLE licenses(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    register_number TEXT UNIQUE NOT NULL,
    category TEXT NOT NULL
);

SELECT * FROM licenses;

CREATE TABLE drivers(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    license_id TEXT UNIQUE NOT NULL,
    FOREIGN KEY(license_id) REFERENCES licenses(id)
);

SELECT * FROM drivers;

INSERT INTO licenses VALUES 
("L001", "123456789", "B"),
("L002", "987654321", "A"),
("L003", "987612345", "AB");

INSERT INTO drivers VALUES
("D001", "Fulano", "fulano@email.com", "1234", "L001"),
("D002", "Ciclano", "ciclano@email.com", "4321", "L002"),
("D003", "Beltrano", "beltrano@email.com", "9876", "L003");

SELECT * FROM licenses 
INNER JOIN drivers ON 
drivers.license_id = licenses.id;

SELECT * FROM drivers
INNER JOIN licenses
ON licenses.id = license_id;

SELECT drivers.name, licenses.register_number, licenses.category FROM drivers
INNER JOIN licenses
ON license_id = licenses.id;

-- Fixação --
-- 1:m - mãe para filhos --
CREATE TABLE mothers(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    number_childrens TEXT NOT NULL
);

SELECT * FROM mothers;

CREATE TABLE childrens(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    age TEXT NOT NULL,
    mother_id TEXT NOT NULL,
    FOREIGN KEY(mother_id) REFERENCES mothers(id)
);

SELECT * FROM childrens;

INSERT INTO mothers VALUES 
("M001", "Fulana", "1"),
("M002", "Ciclana", "2"),
("M003", "Beltrana", "1");

INSERT INTO childrens VALUES 
("C001", "Fulaninha", "10", "M001"),
("C002", "Ciclaninha", "2", "M002"),
("C003", "Ciclaninho", "6", "M002"),
("C004", "Beltraninha", "17", "M003");

SELECT * FROM mothers
INNER JOIN childrens
ON mother_id = mothers.id;

