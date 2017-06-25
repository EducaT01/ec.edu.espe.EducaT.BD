/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     24/6/2017 21:38:56                           */
/*==============================================================*/


DROP TABLE IF EXISTS ALUMNO;

DROP TABLE IF EXISTS CAPACITACION;

DROP TABLE IF EXISTS CAPACITACION_ALUMNO;

DROP TABLE IF EXISTS CURSO;

DROP TABLE IF EXISTS DOCENTE;

DROP TABLE IF EXISTS PROGRAMA;

DROP TABLE IF EXISTS PROGRAMA_ALUMNO;

DROP TABLE IF EXISTS PROGRAMA_CURSO;

/*==============================================================*/
/* Table: ALUMNO                                                */
/*==============================================================*/
CREATE TABLE ALUMNO
(
   COD_ALUMNO           VARCHAR(10) NOT NULL,
   NOMBRE               VARCHAR(150) NOT NULL,
   DIRECCION            VARCHAR(200) NOT NULL,
   TELEFONO             VARCHAR(15) NOT NULL,
   CORREO_ELECTRONICO   VARCHAR(128) NOT NULL,
   FECHA_NACIMIENTO     DATE NOT NULL,
   GENERO               VARCHAR(1) NOT NULL,
   PRIMARY KEY (COD_ALUMNO)
);

/*==============================================================*/
/* Table: CAPACITACION                                          */
/*==============================================================*/
CREATE TABLE CAPACITACION
(
   COD_CAPACITACION     INT NOT NULL AUTO_INCREMENT,
   COD_CURSO            VARCHAR(8) NOT NULL,
   COD_DOCENTE          VARCHAR(10) COMMENT 'Clave primaria que corresponde a la cédula de identidad del docente',
   FECHA_INICIO         DATE NOT NULL,
   FECHA_FIN            DATE NOT NULL,
   ESTADO               VARCHAR(3) NOT NULL DEFAULT 'DEF',
   CAPACIDAD            NUMERIC(2) NOT NULL,
   PRIMARY KEY (COD_CAPACITACION)
);

/*==============================================================*/
/* Table: CAPACITACION_ALUMNO                                   */
/*==============================================================*/
CREATE TABLE CAPACITACION_ALUMNO
(
   COD_CAPACITACION     INT NOT NULL,
   COD_ALUMNO           VARCHAR(10) NOT NULL,
   NOTA_FINAL           NUMERIC(4,2) NOT NULL,
   ESTADO               VARCHAR(3) NOT NULL DEFAULT 'INS',
   PRIMARY KEY (COD_CAPACITACION, COD_ALUMNO)
);

/*==============================================================*/
/* Table: CURSO                                                 */
/*==============================================================*/
CREATE TABLE CURSO
(
   COD_CURSO            VARCHAR(8) NOT NULL COMMENT 'Codigo que identifica al curso ',
   NOMBRE               VARCHAR(100) NOT NULL COMMENT 'Nombre del curso ofertado',
   OBJETIVO             VARCHAR(4000) COMMENT 'Describe el objetivo al de tomar el curso',
   DESCRIPCION          VARCHAR(4000) COMMENT 'Descripcion de los contenidos del curso',
   DURACION             NUMERIC(3) NOT NULL COMMENT 'Espesifica la duración en horas del curso',
   ESTADO               VARCHAR(3) NOT NULL DEFAULT 'ACT' COMMENT 'Espesifica el estado actual del curso',
   PRIMARY KEY (COD_CURSO)
);

ALTER TABLE CURSO COMMENT 'Entidad que registra información referente a cada curso que ';

/*==============================================================*/
/* Table: DOCENTE                                               */
/*==============================================================*/
CREATE TABLE DOCENTE
(
   COD_DOCENTE          VARCHAR(10) NOT NULL COMMENT 'Clave primaria que corresponde a la cédula de identidad del docente',
   NOMBRE               VARCHAR(150) NOT NULL,
   DIRECCION            VARCHAR(200) NOT NULL,
   TELEFONO             VARCHAR(15) NOT NULL,
   CORREO_ELECTRONICO   VARCHAR(128) NOT NULL,
   PRIMARY KEY (COD_DOCENTE)
);

ALTER TABLE DOCENTE COMMENT 'Entidad que almacena la informaciácion de los docentes qeu d';

/*==============================================================*/
/* Table: PROGRAMA                                              */
/*==============================================================*/
CREATE TABLE PROGRAMA
(
   COD_PROGRAMA         VARCHAR(8) NOT NULL COMMENT 'Codigo que identifica al programa',
   NOMBRE               VARCHAR(100) NOT NULL COMMENT 'Nombre del programa',
   DESCRIPCION          VARCHAR(4000) COMMENT 'Descripcion de los contenidos del programa',
   DURACION             NUMERIC(4) NOT NULL COMMENT 'Duracion en horas del programa',
   FECHA_INICIO         DATE COMMENT 'fecha en que inicia el programa',
   FECHA_FIN            DATE COMMENT 'fecha de finalización del programa',
   PRIMARY KEY (COD_PROGRAMA)
);

ALTER TABLE PROGRAMA COMMENT 'Entidad que define un programa en el instituto. Un programa ';

/*==============================================================*/
/* Table: PROGRAMA_ALUMNO                                       */
/*==============================================================*/
CREATE TABLE PROGRAMA_ALUMNO
(
   COD_PROGRAMA         VARCHAR(8) NOT NULL,
   COD_ALUMNO           VARCHAR(10) NOT NULL,
   ESTADO               VARCHAR(3) NOT NULL,
   PRIMARY KEY (COD_PROGRAMA, COD_ALUMNO)
);

/*==============================================================*/
/* Table: PROGRAMA_CURSO                                        */
/*==============================================================*/
CREATE TABLE PROGRAMA_CURSO
(
   COD_PROGRAMA         VARCHAR(8) NOT NULL COMMENT 'Codigo del programa al que pertenece',
   COD_CURSO            VARCHAR(8) NOT NULL COMMENT 'Codigo del curso a tomar',
   ORDEN                NUMERIC(2) NOT NULL COMMENT 'Indica el orden en el que se deben tomar los cursos',
   ESTADO               VARCHAR(3) NOT NULL DEFAULT 'ACT' COMMENT 'indica el estado del curso ',
   PRIMARY KEY (COD_PROGRAMA, COD_CURSO)
);

ALTER TABLE PROGRAMA_CURSO COMMENT 'Entidad que almacena los cursos que pertenecen a un programa';

ALTER TABLE CAPACITACION ADD CONSTRAINT FK_CAPACITACION_A_CURSO FOREIGN KEY (COD_CURSO)
      REFERENCES CURSO (COD_CURSO) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE CAPACITACION ADD CONSTRAINT FK_CAPACITACION_A_DOCENTE FOREIGN KEY (COD_DOCENTE)
      REFERENCES DOCENTE (COD_DOCENTE) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE CAPACITACION_ALUMNO ADD CONSTRAINT FK_CAPACALUMNO_A_ALUMNO FOREIGN KEY (COD_ALUMNO)
      REFERENCES ALUMNO (COD_ALUMNO) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE CAPACITACION_ALUMNO ADD CONSTRAINT FK_CAPACALUMNO_A_CAPACITAC FOREIGN KEY (COD_CAPACITACION)
      REFERENCES CAPACITACION (COD_CAPACITACION) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PROGRAMA_ALUMNO ADD CONSTRAINT FK_PROGRAMALUMN_A_ALUMNO FOREIGN KEY (COD_ALUMNO)
      REFERENCES ALUMNO (COD_ALUMNO) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PROGRAMA_ALUMNO ADD CONSTRAINT FK_PROGRAMALUMN_A_PROGRAMA FOREIGN KEY (COD_PROGRAMA)
      REFERENCES PROGRAMA (COD_PROGRAMA) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PROGRAMA_CURSO ADD CONSTRAINT FK_PROGRAMCURSO_A_CURSO FOREIGN KEY (COD_CURSO)
      REFERENCES CURSO (COD_CURSO) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE PROGRAMA_CURSO ADD CONSTRAINT FK_PROGRAMCUR_A_PROGRAMA FOREIGN KEY (COD_PROGRAMA)
      REFERENCES PROGRAMA (COD_PROGRAMA) ON DELETE RESTRICT ON UPDATE RESTRICT;

