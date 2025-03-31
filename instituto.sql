DROP DATABASE instituto; 
CREATE DATABASE instituto; 

USE instituto; 

CREATE TABLE Profesores (
	id INT AUTO_INCREMENT,
    dni CHAR(9) UNIQUE NOT NULL, 
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
	PRIMARY KEY(id)
);
INSERT INTO Profesores VALUES(NULL, '11111111A', 'Pedro Pérez Galdos', 'Gran Via 9 Madrid', '910000000');
INSERT INTO Profesores VALUES(NULL, '11111111B', 'Juan Ramiro Ruiz', 'Preciados 3 Madrid', '910000001');

SELECT * FROM Profesores;

CREATE TABLE Alumnos (
	id INT AUTO_INCREMENT,
    numexp INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(200) NOT NULL,
    fechanac DATE NOT NULL,
    curso INT NOT NULL,
    delegado VARCHAR(200),
	PRIMARY KEY(id)
);

INSERT INTO Alumnos VALUES(NULL, 1, 'Juan', 'Silvestre Campos', '2000-04-15', 1, 'Carlos Ramos Martín');
#SELECT * FROM Alumnos;

CREATE TABLE Modulos (
	id INT AUTO_INCREMENT,
    codigo INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    PRIMARY KEY(id)
);

INSERT INTO Modulos VALUES(NULL, 1, 'Big Data');
INSERT INTO Modulos VALUES(NULL, 2, 'Electricidad');
#SELECT * FROM Modulos;

CREATE TABLE Profesores_Modulos (
	id INT AUTO_INCREMENT,
	fk_id_profesor INT,
    fk_id_modulo INT NOT NULL,
	PRIMARY KEY(id),
    FOREIGN KEY(fk_id_profesor) REFERENCES Profesores(id),
    FOREIGN KEY(fk_id_modulo) REFERENCES Modulos(id) ON DELETE SET NULL
);

INSERT INTO Profesores_Modulos VALUES(NULL, 1, 1);
INSERT INTO Profesores_Modulos VALUES(NULL, 2, 2);
#SELECT * FROM Profesores_Modulos;

CREATE TABLE Alumnos_Modulos (
	id INT AUTO_INCREMENT,
	fk_id_alumno INT,
    fk_id_modulo INT NOT NULL,
	PRIMARY KEY(id),
    FOREIGN KEY(fk_id_alumno) REFERENCES Alumnos(id) ON DELETE CASCADE,
    FOREIGN KEY(fk_id_modulo) REFERENCES Modulos(id) ON DELETE SET NULL
);

INSERT INTO Alumnos_Modulos VALUES(NULL, 1, 1);
#SELECT * FROM Alumnos_Modulos;

#UPDATE Profesores SET direccion = 'Quintana 8 Madrid', telefono = NULL  WHERE id = 2;

#DELETE FROM Productos WHERE id = 3;

