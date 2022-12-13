--SQL
USE master;
GO
IF DB_ID (N'Veterinaria') IS NOT NULL
DROP DATABASE Veterinaria
GO
CREATE DATABASE Veterinaria
ON
( NAME = Veterinaria_dat,
    FILENAME = 'C:\BD\Veterinaria.mdf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5 )
LOG ON
( NAME = Veterinaria_log,
    FILENAME = 'C:\BD\Veterinaria.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB ) ;
GO
USE Veterinaria
GO
CREATE TABLE Perro
(
    idPerro INT not null,
	nombre VARCHAR (50) not null,
	raza VARCHAR (50) not null,
	color VARCHAR (50) not null,
    tamaño VARCHAR (50) not null,
	edad INT not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Dueño
(
    idDueño INT not null,
	nombre VARCHAR (50) not null,
	apellidoP VARCHAR (50) not null,
	apellidoM VARCHAR (50) not null,
    telefono INT not null,
	edad INT not null,
    calle VARCHAR (50) not null,
	colonia VARCHAR (50) not null,
	numero INT not null,
	estado VARCHAR (50) not null,
	ciudad VARCHAR (50) not null,
	codigoPostal INT not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Veterinario
(
    idVeterinario INT not null,
	nombre VARCHAR (50) not null,
	apellidoP VARCHAR (50) not null,
	apellidoM VARCHAR (50) not null,
    telefono INT not null,
    calle VARCHAR (50) not null,
	colonia VARCHAR (50) not null,
	numero INT not null,
	estado VARCHAR (50) not null,
	ciudad VARCHAR (50) not null,
	codigoPostal INT not null,
	estatus BIT DEFAULT 1 not null,
    idPago INT not null,
);
GO
CREATE TABLE Jaula
(
    idJaula INT not null,
	tamaño VARCHAR (50) not null,
	numero INT not null,
	estado VARCHAR (50) not null,
	ciudad VARCHAR (50) not null,
	codigoPostal INT not null,
	calle VARCHAR (50) not null,
	colonia VARCHAR (50) not null,
	estatus BIT DEFAULT 1 not null,
    idPerro INT not null,
);
GO
CREATE TABLE Sucursal
(
    idSucursal INT not null,
	nombre VARCHAR (50) not null,
	estado VARCHAR (50) not null,
	ciudad VARCHAR (50) not null,
	codigoPostal INT not null,
	calle VARCHAR (50) not null,
	colonia VARCHAR (50) not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Tratamiento
(
    idTratamiento INT not null,
	descripcion VARCHAR (50) not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE Medicacion
(
    idMedicacion INT not null,
	descripcion VARCHAR (50) not null,
	estatus BIT DEFAULT 1 not null,   
	idPerro INT not null,
);
GO
CREATE TABLE Padecimiento
(
    idPadecimiento INT not null,
	nombre VARCHAR (50) not null,
    gravedad VARCHAR (50) not null,
	descripcion VARCHAR (50) not null,
	estatus BIT DEFAULT 1 not null,
	idPerro INT not null,
);
GO
CREATE TABLE Cartilla
(
    idCartilla INT not null,
	fechaInicio DATETIME not null,
	fechaExpiracion DATETIME not null,
	estatus BIT DEFAULT 1 not null,
    idPerro INT not null,
);
GO
CREATE TABLE Pago
(
    idPago INT not null,
	cantidad VARCHAR (50) not null,
	fechaPago DATETIME not null,
	estatus BIT DEFAULT 1 not null,
	idDueño INT not null,
);
GO
CREATE TABLE DueñoPerro
(
    idDueñoPerro INT not null,
	idPerro INT not null,
	idDueño INT not null,
	fechaEntrega DATETIME not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE DueñoCartilla
(
    idDueñoCartilla INT not null,
	idCartilla INT not null,
	idDueño INT not null,
	fechaEntrega DATETIME not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE JaulaSucursal
(
    idJaulaSucursal INT not null,
	idJaula INT not null,
	idSucursal INT not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE VeterinarioSucursal
(
    idVeterinarioSucursal INT not null,
    idVeterinario INT not null,
	idSucursal INT not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE TratamientoMedicacion
(
    idTratamientoMedicacion INT not null,
	idTratamiento INT not null,
	idMedicacion INT not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE VeterinarioTratamiento
(
    idVeterinarioTratamiento INT not null,
	idTratamiento INT not null,
	idVeterinario INT not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE PerroVeterinario
(
    idPerroVeterinario INT not null,
	idPerro INT not null,
	idVeterinario INT not null,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE VeterinarioPadecimiento
(
    idVeterinarioPadecimiento INT not null,
    idVeterinario INT not null,
	idPadecimiento INT not null,
	fechaDiagnostico DATETIME NOT NULL,
	estatus BIT DEFAULT 1 not null,
);
GO
CREATE TABLE VeterinarioCartilla
(
    idVeterinarioCartilla INT not null,
	idVeterinario INT not null,
	idCartilla INT not null,
	estatus BIT DEFAULT 1 not null,
);
--LLaves Primarias 
ALTER TABLE Perro ADD CONSTRAINT PK_Perro PRIMARY KEY (idPerro)
ALTER TABLE Dueño ADD CONSTRAINT PK_Dueño PRIMARY KEY (idDueño)
ALTER TABLE Veterinario ADD CONSTRAINT PK_Veterinario PRIMARY KEY (idVeterinario)
ALTER TABLE Jaula ADD CONSTRAINT PK_Jaula PRIMARY KEY (idJaula)
ALTER TABLE Sucursal ADD CONSTRAINT PK_Sucursal PRIMARY KEY (idSucursal)
ALTER TABLE Tratamiento ADD CONSTRAINT PK_Tratamiento PRIMARY KEY (idTratamiento)
ALTER TABLE Medicacion ADD CONSTRAINT PK_Medicacion PRIMARY KEY (idMedicacion)
ALTER TABLE Padecimiento ADD CONSTRAINT PK_Padicimiento PRIMARY KEY (idPadecimiento)
ALTER TABLE Cartilla ADD CONSTRAINT PK_Cartilla PRIMARY KEY (idCartilla)
ALTER TABLE Pago ADD CONSTRAINT PK_Pago PRIMARY KEY (idPago)
ALTER TABLE DueñoPerro ADD CONSTRAINT PK_DueñoPerro PRIMARY KEY (idDueñoPerro)
ALTER TABLE DueñoCartilla ADD CONSTRAINT PK_DueñoCartilla PRIMARY KEY (idDueñoCartilla)
ALTER TABLE JaulaSucursal ADD CONSTRAINT PK_JaulaSucursal PRIMARY KEY (idJaulaSucursal)
ALTER TABLE VeterinarioSucursal ADD CONSTRAINT PK_VeteriniarioSucursal PRIMARY KEY (idVeterinarioSucursal)
ALTER TABLE TratamientoMedicacion ADD CONSTRAINT PK_TratamientoMedicacion PRIMARY KEY (idTratamientoMedicacion)
ALTER TABLE VeterinarioTratamiento ADD CONSTRAINT PK_VeterinarioTratamiento PRIMARY KEY (idVeterinarioTratamiento)
ALTER TABLE PerroVeterinario ADD CONSTRAINT PK_PerroVeterinario PRIMARY KEY (idPerroVeterinario)
ALTER TABLE VeterinarioPadecimiento ADD CONSTRAINT PK_VeterinarioPadecimiento PRIMARY KEY (idVeterinarioPadecimiento)
ALTER TABLE VeterinarioCartilla ADD CONSTRAINT PK_VeterinarioCartilla PRIMARY KEY (idVeterinarioCartilla)
--LLaves Foraneas 
--Padecimiento
ALTER TABLE Padecimiento ADD CONSTRAINT FK_Padecimiento FOREIGN KEY (idPerro) REFERENCES Perro (idPerro)
--Medicacion
ALTER TABLE Medicacion ADD CONSTRAINT FK_Medicacion FOREIGN KEY (idPerro) REFERENCES Perro (idPerro)
--Jaula
ALTER TABLE Jaula ADD CONSTRAINT FK_Jaula FOREIGN KEY (idPerro) REFERENCES Perro (idPerro)
--Cartilla
ALTER TABLE Cartilla ADD CONSTRAINT FK_Cartilla FOREIGN KEY (idPerro) REFERENCES Perro (idPerro)
--Pago
ALTER TABLE Pago ADD CONSTRAINT FK_Pago FOREIGN KEY (idDueño) REFERENCES Dueño (idDueño)
--Veterinario
ALTER TABLE Veterinario ADD CONSTRAINT FK_Veterinario FOREIGN KEY (idPago) REFERENCES Pago (idPago)
--JaulaSucursal
ALTER TABLE JaulaSucursal ADD CONSTRAINT FK_JaulaSucursalJaula FOREIGN KEY (idJaula) REFERENCES Jaula (idJaula)
ALTER TABLE JaulaSucursal ADD CONSTRAINT FK_JaulaSucursalSucursal FOREIGN KEY (idSucursal) REFERENCES Sucursal (idSucursal)
--VeterinarioSucursal
ALTER TABLE VeterinarioSucursal ADD CONSTRAINT FK_VeterinarioSucursalSucursal FOREIGN KEY (idSucursal) REFERENCES Sucursal (idSucursal)
ALTER TABLE VeterinarioSucursal ADD CONSTRAINT FK_VeterinarioSucursalVeterinario FOREIGN KEY (idVeterinario) REFERENCES Veterinario (idVeterinario)
--VeterinarioTratamiento
ALTER TABLE VeterinarioTratamiento ADD CONSTRAINT FK_VeterinarioTratamientoVeterinario FOREIGN KEY (idVeterinario) REFERENCES Veterinario (idVeterinario)
ALTER TABLE VeterinarioTratamiento ADD CONSTRAINT FK_VeterinarioSTratamientoTratamiento FOREIGN KEY (idTratamiento) REFERENCES Tratamiento (idTratamiento)
--VeterinarioPadecimiento
ALTER TABLE VeterinarioPadecimiento ADD CONSTRAINT FK_VeterinarioPadecimientoVeterinario FOREIGN KEY (idVeterinario) REFERENCES Veterinario (idVeterinario)
ALTER TABLE VeterinarioPadecimiento ADD CONSTRAINT FK_VeterinarioPadecimientoPadecimento FOREIGN KEY (idPadecimiento) REFERENCES Padecimiento (idPadecimiento)
--TratamientoMedicacion
ALTER TABLE TratamientoMedicacion ADD CONSTRAINT FK_TratamientoMedicacionTratamiento FOREIGN KEY (idTratamiento) REFERENCES Tratamiento (idTratamiento)
ALTER TABLE TratamientoMedicacion ADD CONSTRAINT FK_TratamientoMedicacionMedicacion FOREIGN KEY (idMedicacion) REFERENCES Medicacion (idMedicacion)
--PerroVeterinario
ALTER TABLE PerroVeterinario ADD CONSTRAINT FK_PerroVeterinarioVeterinario FOREIGN KEY (idVeterinario) REFERENCES Veterinario (idVeterinario)
ALTER TABLE PerroVeterinario ADD CONSTRAINT FK_PerroVeterinarioPerro FOREIGN KEY (idPerro) REFERENCES Perro (idPerro)
--DueñoPerro
ALTER TABLE DueñoPerro ADD CONSTRAINT FK_DueñoPerroDueño FOREIGN KEY (idDueño) REFERENCES Dueño (idDueño)
ALTER TABLE DueñoPerro ADD CONSTRAINT FK_DueñoPerroPerro FOREIGN KEY (idPerro) REFERENCES Perro (idPerro)
--DueñoCartilla
ALTER TABLE DueñoCartilla ADD CONSTRAINT FK_DueñoCartillaDueño FOREIGN KEY (idDueño) REFERENCES Dueño (idDueño)
ALTER TABLE DueñoCartilla ADD CONSTRAINT FK_DueñoCartillaCartilla FOREIGN KEY (idCartilla) REFERENCES Cartilla (idCartilla)
--CartillaVeterinario
ALTER TABLE VeterinarioCartilla ADD CONSTRAINT FK_VeterinarioCartillaCartilla FOREIGN KEY (idCartilla) REFERENCES Cartilla (idCartilla)
ALTER TABLE VeterinarioCartilla ADD CONSTRAINT FK_VeterinarioCartillaVeterinario FOREIGN KEY (idVeterinario) REFERENCES Veterinario (idVeterinario)

--INDICES
CREATE INDEX IX_Perro ON Perro (idPerro)
CREATE INDEX IX_Dueño ON Dueño (idDueño)
CREATE INDEX IX_Veterinario ON Veterinario (idVeterinario)
CREATE INDEX IX_Jaula ON Jaula (idJaula)
CREATE INDEX IX_Sucursal ON Sucursal (idSucursal)
CREATE INDEX IX_Tratamiento ON Tratamiento (idTratamiento)
CREATE INDEX IX_Medicacion ON Medicacion (idMedicacion)
CREATE INDEX IX_Padecimiento ON Padecimiento (idPadecimiento)
CREATE INDEX IX_Cartilla ON Cartilla (idCartilla)
CREATE INDEX IX_Pago ON Pago (idPago)
CREATE INDEX IX_DueñoPerro ON DueñoPerro (idDueñoPerro)
CREATE INDEX IX_DueñoCartilla ON DueñoCartilla (idDueñoCartilla)
CREATE INDEX IX_JaulaSucural ON JaulaSucursal (idJaulaSucursal)
CREATE INDEX IX_VeterinarioSucursal ON VeterinarioSucursal (idVeterinarioSucursal)
CREATE INDEX IX_TratamientoMedicacion ON TratamientoMedicacion (idTratamientoMedicacion)
CREATE INDEX IX_VeterinarioTratamiento ON VeterinarioTratamiento (idVeterinarioTratamiento)
CREATE INDEX IX_PerroVeterinario ON PerroVeterinario (idPerroVeterinario)
CREATE INDEX IX_VeterinarioPadecimiento ON VeterinarioPadecimiento (idVeterinarioPadecimiento)
CREATE INDEX IX_VeterinarioCartilla ON VeterinarioCartilla (idVeterinarioCartilla)