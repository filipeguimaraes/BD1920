use MedicinaDesporto;

#Quantos recursos gastou uma clinica entre duas datas
DELIMITER $$
CREATE FUNCTION recursosGastos (cod_clinica int, di date, df date) returns int deterministic
begin
	declare num int;
    set num = (select count(*) from Recurso join TesteClinico on TesteClinico.id_teste = Recurso.id_teste 
    where TesteClinico.cod_clinica = cod_clinica and TesteClinico.data between di and df);
	return num;
end $$
DELIMITER ;

#Hora em que há mais testes numa clínica (em média)
DELIMITER $$
CREATE FUNCTION horaMaisTestes (cod_clinica int) returns int deterministic
begin
	declare num int;
    set num = (select round(sum(hour(TesteClinico.hora))/count(*)) from TesteClinico where TesteClinico.cod_clinica = cod_clinica);
	return num;
end $$
DELIMITER ;

#Quantos funcionários com um determinado cargo tem uma clínica
DELIMITER $$
CREATE FUNCTION quantosFuncionariosCargo (cod_clinica int, cargo varchar(45)) returns int deterministic
begin
	declare num int;
    set num = (select count(*) from Staff where Staff.cargo = cargo and Staff.id_staff in 
    (select Staff_id_Staff from Staff_Clinica where Clinica_cod_clinica = cod_clinica));
	return num;
end $$
DELIMITER ;

#Quantos anos de serviço tem um determinado funcionário
DELIMITER $$
CREATE FUNCTION quantosAnosServico (id_staff int) returns int deterministic
begin
	declare num int;
    set num = (select year(now())-year(data_ini_servico) from Staff where Staff.id_staff = id_staff);
	return num;
end $$
DELIMITER ;

#Quanto custa realizar um teste numa clínica (em média)
DELIMITER $$
CREATE FUNCTION quantoCustaTeste (cod_clinica int) returns double deterministic
begin
	declare num double;
    set num = (select round(sum(TesteClinico.preco)/count(*),2) from TesteClinico where TesteClinico.cod_clinica = cod_clinica);
	return num;
end $$
DELIMITER ;