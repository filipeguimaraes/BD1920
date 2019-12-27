LOAD DATA INFILE 'csv/modalidade.csv'
    INTO TABLE Modalidade
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

LOAD DATA INFILE 'csv/clube.csv'
    INTO TABLE Clube
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

LOAD DATA INFILE 'csv/atleta.csv'
    INTO TABLE Atleta
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

LOAD DATA INFILE 'csv/competicao.csv'
    INTO TABLE Competicao
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

LOAD DATA INFILE 'csv/staff.csv'
    INTO TABLE Staff
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

LOAD DATA INFILE 'csv/clinica.csv'
    INTO TABLE Clinica
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

LOAD DATA INFILE 'csv/staff_clinica.csv'
    INTO TABLE Staff_Clinica
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

LOAD DATA INFILE 'csv/contacto.csv'
    INTO TABLE Contacto
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

LOAD DATA INFILE 'csv/inscricao.csv'
    INTO TABLE Inscricao
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

LOAD DATA INFILE 'csv/testeclinico.csv'
    INTO TABLE TesteClinico
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

LOAD DATA INFILE 'csv/equipa_envolvente.csv'
    INTO TABLE EquipaEnvolvente
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

LOAD DATA INFILE 'csv/recurso.csv'
    INTO TABLE Recurso
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';