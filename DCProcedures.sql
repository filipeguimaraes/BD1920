delimiter $$
CREATE PROCEDURE DCFaturacaoClinica(IN n_staff int, IN di DATE, IN df DATE)
    begin
        Select
			C.nome,
            count(*) as NrAtletas,
			sum(T.preco) as Faturacao
        From
			Clinica as C,
            TesteClinico as T
        where
            C.cod_clinica = T.cod_clinica
            and C.id_staff = n_staff
            and T.data between di and df
		group by C.nome;
	end $$
delimiter ;


delimiter $$
CREATE PROCEDURE DCClubeMaisTestesEntreDatasClinica(IN n_staff int, IN di DATE, IN df DATE)
	begin
	SELECT Clube.designacao, 
    count(Clube.designacao) as NrTestes
	FROM Clinica
	INNER JOIN TesteClinico
	ON Clinica.cod_clinica = TesteClinico.cod_clinica
	INNER JOIN Atleta
	ON Atleta.nif = TesteClinico.nif
	INNER JOIN Clube
	ON Atleta.cod_clube = Clube.cod_clube where Clinica.id_staff = n_staff and TesteClinico.data between di and df group by Clube.designacao order by count(Clube.designacao) DESC limit 1;
	end $$
delimiter ;


delimiter $$
CREATE PROCEDURE DCClubesInexistentesClinica(IN n_staff int)
begin
Select Cl.designacao from Clube as Cl where Cl.cod_clube not in
(SELECT Cl.cod_clube
	FROM Clinica as C
	INNER JOIN TesteClinico as T
	ON C.cod_clinica = T.cod_clinica
	INNER JOIN Atleta as A
	ON A.nif = T.nif
	INNER JOIN Clube as Cl
	ON A.cod_clube = Cl.cod_clube where C.id_staff = n_staff);
end $$
delimiter ;


delimiter $$
create procedure DCStaffAreaClinica (IN n_staff int)
begin
select S.especialidade , 
count(S.especialidade) as NrEspecialistas
from Staff as S
join Staff_Clinica as SC
on SC.Staff_id_staff = S.id_staff 
where SC.Staff_id_staff 
in (select SC.Staff_id_staff 
from Clinica as C
 join Staff_Clinica as SC 
 on C.cod_clinica = SC.Clinica_cod_clinica where C.id_staff = n_staff) 
group by S.especialidade order by count(S.especialidade);
end $$
delimiter ;


delimiter $$
create procedure DCMesesOrdemCrescenteClinica(IN n_staff int)
begin
select 
month(T.data) as Mes,
count(month(T.data)) as NrTestes
from Clinica as C,
TesteClinico as T
where T.cod_clinica = C.cod_clinica
and C.id_staff = n_staff
group by month(T.data) 
order by count(month(T.data));
end $$
delimiter ;