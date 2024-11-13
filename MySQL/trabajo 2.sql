create DATABASE Colegio;
use Colegio;
Create Schema ColegioS;
use ColegioS;
Create TABLE Ciclo_Basico (
idCB INT AUTO_INCREMENT PRIMARY KEY not null,
BAlumno Varchar(32) not null,
BCurso INT not null,
BNivel INT not null,
CPigmentos INT not null
); 
Create TABLE Ciclo_Superior (
idCS INT auto_increment primary key not null,
SAlumno Varchar(32) not null,
SCurso INT not null,
SNivel INT not null
);
Create TABLE Taller (
idTaller INT AUTO_INCREMENT PRIMARY KEY not null,
TAlumno Varchar(32) not null,
TGrupo INT not null,
TNivel INT not null
);

Create TABLE Profesores (
idProfesores int not null primary key,
Temas Varchar(45) not null,
Horario Varchar(45) not null,
PNombre Varchar(45) not null
);
Create TABLE Materias (
idMaterias int auto_increment primary key not null,
MNormales Varchar(45) not null,
MEspeciales Varchar(45) not null,
MTaller Varchar(45) not null,
ProfePracticas Varchar(45) not null,|i9
MProfesor Varchar(32) not null,
Taller int not null,
foreign key (profe) references Profesores(IdProfesores),
foreign key (ciclob) references Ciclo_Basico(idCB),
foreign key (ciclos) references Ciclo_Superior(idCS),
foreign key (taller) references Taller(idTaller)
);

##2º
#Insertar
Insert into Taller (TAlumno, TGrupo, TNivel)
Values ("3","franco gonzalez","1","2");
Insert into Profesores (Temas, Horario, PNombres)
Values ("4","Base de datos","17:30-20:40","el maldito gian franco");
Insert into Materias (MNormales, MEspeciales, MTaller, ProfePracticas, MProfesor, Taller)
Values ("5","Gimnasia","Base de Datos","Modelos de sistemas","luque","el maldito gian franco","luque");

#Trigger
DELIMITER //
Create TRIGGER AlumnoCicloBasico
After insert on Ciclo_Basico
FOR EACH ROW
BEGIN
Insert into Ciclo_Basico (BAlumno, BCurso, BNivel, CPigmentos)
Values ("1","lisandro martinez","1","2","0");
END //
DELIMITER ;

#Procesamientos
DELIMITER //
Create Procedure Insertar_alumno (IN Alumno varchar(32), IN Ciclo_Superior INT, IN Nivel INT)
Begin
Insert into Ciclo_Superior (SAlumno, SCurso, SNivel)
Values ("2","franco gonzalez","5","2");
END //
DELIMITER ;
DELIMITER //
Create Procedure Actuliazar_Basico (IN IdCB INT, IN BCurso INT)
Begin
Update Ciclo_Basico set Bcurso="2";
END //
DELIMITER ;
DELIMITER //
Create Procedure EliminarPigmentos (In IdCB INT)
Begin
Delete from Ciclo_Basico where CPigmentos;
END //
DELIMITER ;
DELIMITER //
Create Procedure Obtener_Alumnos_Taller (IN IdTaller INT)
Begin
Select * from Taller WHERE IdTaller=IdTaller;
END //
DELIMITER ;
DELIMITER //
Create Procedure Contar_Profesores (IdProfesores INT)
BEGIN
SELECT COUNT(*) AS Total_Profesores
FROM Profesores
WHERE IdProfesores = IdProfesor;
END //
DELIMITER ;

#Counsultas join
Select C.IdCS, C.SAlumno, C.SCurso, C.Snivel, T.TAlumno, T.TGrupo, T.TNivel
From Ciclo_Superior C
INNER JOIN Taller T
ON C.IdCS=T.IdTaller ;
Select C.IdCS, C.SAlumno, C.SCurso, C.Snivel, T.TAlumno, T.TGrupo, T.TNivel
From Ciclo_Superior C
LEFT JOIN Taller T
ON C.IdCS=T.IdTaller ;
Select C.IdCS, C.SAlumno, C.SCurso, C.Snivel, T.TAlumno, T.TGrupo, T.TNivel
From Ciclo_Superior C
RIGHT JOIN Taller T
ON C.IdCS=T.IdTaller ;