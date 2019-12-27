Use MedicinaDesporto;

CREATE ROLE DIRETORCLINICA;
CREATE ROLE DIRETORTESTE;
CREATE ROLE ATLETA;

GRANT EXECUTE ON PROCEDURE MedicinaDesporto.DCFaturacaoClinica TO DIRETORCLINICA;
GRANT EXECUTE ON PROCEDURE MedicinaDesporto.DCClubeMaisTestesEntreDatasClinica TO DIRETORCLINICA;
GRANT EXECUTE ON PROCEDURE MedicinaDesporto.DCClubesInexistentesClinica TO DIRETORCLINICA;
GRANT EXECUTE ON PROCEDURE MedicinaDesporto.DCStaffAreaClinica TO DIRETORCLINICA;
GRANT EXECUTE ON PROCEDURE MedicinaDesporto.DCMesesOrdemCrescenteClinica TO DIRETORCLINICA;

GRANT EXECUTE ON PROCEDURE MedicinaDesporto.DTRecursosTeste TO DIRETORTESTE;
GRANT EXECUTE ON PROCEDURE MedicinaDesporto.DTClinicaRealizouMaisTestes TO DIRETORTESTE;
GRANT EXECUTE ON PROCEDURE MedicinaDesporto.DTComQuemTrabalhouTestes TO DIRETORTESTE;
GRANT EXECUTE ON PROCEDURE MedicinaDesporto.DTAtletasTestes TO DIRETORTESTE;
GRANT EXECUTE ON PROCEDURE MedicinaDesporto.DTContactoAtletasTestes TO DIRETORTESTE;

GRANT EXECUTE ON PROCEDURE MedicinaDesporto.AClinicaEmQueMaisGasta TO ATLETA;
GRANT EXECUTE ON PROCEDURE MedicinaDesporto.ATestesEmClinica TO ATLETA;
GRANT EXECUTE ON PROCEDURE MedicinaDesporto.ATestesEntreDatas TO ATLETA;
GRANT EXECUTE ON PROCEDURE MedicinaDesporto.ATestesPrecoCrescente TO ATLETA;
GRANT EXECUTE ON PROCEDURE MedicinaDesporto.ATodosTestes TO ATLETA;

CREATE USER 'diretorclinica2'@'localhost' IDENTIFIED BY 'diretorclinicapassword';
GRANT DIRETORCLINICA to 'diretorclinica2'@'localhost';

CREATE USER 'diretorteste14'@'localhost' IDENTIFIED BY 'diretorteste';
GRANT DIRETORTESTE to 'diretorteste14'@'localhost';

CREATE USER 'atleta50'@'localhost' IDENTIFIED BY 'atletapassword';
GRANT ATLETA to 'atleta50'@'localhost';
