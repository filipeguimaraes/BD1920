use MedicinaDesporto;

DELIMITER $$
CREATE TRIGGER deleteClube
	AFTER DELETE
    ON Atleta
    FOR EACH ROW
BEGIN
    DECLARE num INT;
    SET num = (select count(*) from Atleta where cod_clube = old.cod_clube);
	IF (num = 0) THEN DELETE from Clube where cod_clube = old.cod_clube;
    END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER deleteModalidade
	AFTER DELETE
    ON Atleta
    FOR EACH ROW
BEGIN
    DECLARE num INT;
    DECLARE num_competicao INT;
    SET num_competicao = (select count(*) from Competicao where cod_modalidade = old.cod_modalidade);
    SET num = (select count(*) from Atleta where cod_modalidade = old.cod_modalidade);
	IF (num = 0 and num_competicao = 0) THEN 
    DELETE from Modalidade where cod_modalidade = old.cod_modalidade;
    END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER deleteRecurso
	BEFORE DELETE
    ON TesteClinico
    FOR EACH ROW
BEGIN
    DECLARE num INT;
    SET num = (select count(*) from Recurso where id_teste = old.id_teste);
	IF (num = 1) THEN 
    DELETE from Recurso where id_teste = old.id_teste;
    END IF;
END $$
DELIMITER ;