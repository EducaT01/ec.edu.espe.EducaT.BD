/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     26/06/2017 18:26:48                          */
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
   COD_ALUMNO           VARCHAR(10) NOT NULL COMMENT 'Clave primaria que corresponde a la cédula de identidad del estudiante.',
   NOMBRE               VARCHAR(150) NOT NULL COMMENT 'Columna que corresponde al nombre y apellido del estudiante.',
   DIRECCION            VARCHAR(200) NOT NULL COMMENT 'Columna que corresponde a la direccion de la vivienda del estudiante.',
   TELEFONO             VARCHAR(15) NOT NULL COMMENT 'Columna que corresponde al telefono, ya sea el movil o el de casa, del estudiante.',
   CORREO_ELECTRONICO   VARCHAR(128) NOT NULL COMMENT 'Columna correspondiente al correo electronico del estudiante.',
   FECHA_NACIMIENTO     DATE NOT NULL COMMENT 'Columna correspondiente a la fecha de nacimiento del estudiante.',
   GENERO               VARCHAR(1) NOT NULL COMMENT 'Columna correspondiente al genero del estudiante, este puede ser masculino (M), femenino (F) u otros (O).',
   PRIMARY KEY (COD_ALUMNO)
);

ALTER TABLE ALUMNO COMMENT 'Entidad que almacena la informaciácion de los alumnos que re';

/*==============================================================*/
/* Table: CAPACITACION                                          */
/*==============================================================*/
CREATE TABLE CAPACITACION
(
   COD_CAPACITACION     INT NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria que corresponde al ID de la capacitación.',
   COD_CURSO            VARCHAR(8) NOT NULL COMMENT 'Clave primaria que corresponde al ID que tiene el curso en la institución.',
   COD_DOCENTE          VARCHAR(10) COMMENT 'Clave primaria que corresponde a la cédula de identidad del docente.',
   FECHA_INICIO         DATE NOT NULL COMMENT 'Fecha en la que se tiene previsto empezar la capacitación.',
   FECHA_FIN            DATE NOT NULL COMMENT 'Fecha en la que se tiene previsto finalizar la capacitación.',
   ESTADO               VARCHAR(3) NOT NULL DEFAULT 'DEF' COMMENT 'Estado en la que se encuentra cada una de las capacitaciones, estos estados pueden ser: "inscripciones", "en progreso", "finalizada", "cancelada" y "definida".',
   CAPACIDAD            NUMERIC(2) NOT NULL COMMENT 'Es la capacidada en numero de personas que pueden recibir la capacitación.',
   PRIMARY KEY (COD_CAPACITACION)
);

ALTER TABLE CAPACITACION COMMENT 'Entidad que registar la información de  las capacitaciones c';

/*==============================================================*/
/* Table: CAPACITACION_ALUMNO                                   */
/*==============================================================*/
CREATE TABLE CAPACITACION_ALUMNO
(
   COD_CAPACITACION     INT NOT NULL COMMENT 'Clave primaria que corresponde la que identifica a la entidad "CAPACITACION".',
   COD_ALUMNO           VARCHAR(10) NOT NULL COMMENT 'Clave primaria que corresponde la que identifica a la entidad "ALUMNO".',
   NOTA_FINAL           NUMERIC(4,2) NOT NULL COMMENT 'Columna que corresponde a la nota final obtenida por el estudiante en los programas.',
   ESTADO               VARCHAR(3) NOT NULL DEFAULT 'INS' COMMENT 'Columna correspondiente al estado en que se encuentra la capacitacion por alumno, esta puede ser inscrito (INS), matriculado (MAT), aprobado (APR), reprobado (REP), reprobado por faltas (RFA).',
   PRIMARY KEY (COD_CAPACITACION, COD_ALUMNO)
);

ALTER TABLE CAPACITACION_ALUMNO COMMENT 'Entidad encargada de mostrar la relacion existente entre las';

/*==============================================================*/
/* Table: CURSO                                                 */
/*==============================================================*/
CREATE TABLE CURSO
(
   COD_CURSO            VARCHAR(8) NOT NULL COMMENT 'Clave primaria que corresponde al ID que tiene el curso en cuestión.',
   NOMBRE               VARCHAR(100) NOT NULL COMMENT 'Nombre que recibe el curso que puede ser impartido en un prograam de capacitación',
   OBJETIVO             VARCHAR(4000) COMMENT 'Es el objetivo que se pretende alcanzar con el curso que se aprende.',
   DESCRIPCION          VARCHAR(4000) COMMENT 'Detalles específicos de lo que es el curso y en que consiste el aprendizaje que se ira a recibir.',
   DURACION             NUMERIC(3) NOT NULL COMMENT 'Duración que tiene el curso en un periodo de tiempo, en este caso número de horas.',
   ESTADO               VARCHAR(3) NOT NULL DEFAULT 'ACT' COMMENT 'Es el estado del curos, y se lo puede encontrar en los estados de "activo" e "inactivo".',
   PRIMARY KEY (COD_CURSO)
);

ALTER TABLE CURSO COMMENT 'Entidad que registra información referente a cada curso que ';

/*==============================================================*/
/* Table: DOCENTE                                               */
/*==============================================================*/
CREATE TABLE DOCENTE
(
   COD_DOCENTE          VARCHAR(10) NOT NULL COMMENT 'Clave primaria que corresponde a la cédula de identidad del docente.',
   NOMBRE               VARCHAR(150) NOT NULL COMMENT 'Nombre que consta de nombre y apellido de cada uno de los docentes del instituto.',
   DIRECCION            VARCHAR(200) NOT NULL COMMENT 'Es la dirección en la que viven los docentes que imparten clases en el instituto.',
   TELEFONO             VARCHAR(15) NOT NULL COMMENT 'Teléfono personal de los docentes para ser contactados.',
   CORREO_ELECTRONICO   VARCHAR(128) NOT NULL COMMENT 'Es el correo electrónico que tienen los docentes, para hacerles llegar cualquier comunicado.',
   PRIMARY KEY (COD_DOCENTE)
);

ALTER TABLE DOCENTE COMMENT 'Entidad que almacena la informacion de los docentes que dict';

/*==============================================================*/
/* Table: PROGRAMA                                              */
/*==============================================================*/
CREATE TABLE PROGRAMA
(
   COD_PROGRAMA         VARCHAR(8) NOT NULL COMMENT 'Clave primaria que identifica al programa.',
   NOMBRE               VARCHAR(100) NOT NULL COMMENT 'Es el nombre que recibe el programa por los temas que llega a tratar.',
   DESCRIPCION          VARCHAR(4000) COMMENT 'Es la descripción que tiene ese curso de una manera mucho más específica.',
   DURACION             NUMERIC(4) NOT NULL COMMENT 'Es el número de días que dura cada uno de los programas.',
   FECHA_INICIO         DATE COMMENT 'Fecha en la que se tiene previsto empezar el programa.',
   FECHA_FIN            DATE COMMENT 'Fecha en la que se tiene previsto finalizar  el programa.',
   PRIMARY KEY (COD_PROGRAMA)
);

ALTER TABLE PROGRAMA COMMENT 'Entidad que define un programa en el isntituto. Un programa ';

/*==============================================================*/
/* Table: PROGRAMA_ALUMNO                                       */
/*==============================================================*/
CREATE TABLE PROGRAMA_ALUMNO
(
   COD_PROGRAMA         VARCHAR(8) NOT NULL COMMENT 'Clave primaria correspondiente a la que identifica a la entidad "PROGRAMA".',
   COD_ALUMNO           VARCHAR(10) NOT NULL COMMENT 'Clave primaria correspondiente a la que identifica a la entidad "ALUMNO".',
   ESTADO               VARCHAR(3) NOT NULL COMMENT 'Columna que corresponde al estado del estudiante con respecto a algun programa, este puede ser: inscrito (INS), matriculado (MAT), en progreso (PRO) o finalizafo (FIN).',
   PRIMARY KEY (COD_PROGRAMA, COD_ALUMNO)
);

ALTER TABLE PROGRAMA_ALUMNO COMMENT 'Entidad encargada de mostrar la relacion existente entre las';

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

