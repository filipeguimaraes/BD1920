delimiter $$
CREATE PROCEDURE DTRecursosTeste(IN n_staff int)
    begin
        Select
			T.id_teste,
            R.designacao
        From
			Recurso as R,
            TesteClinico as T
        where
            R.id_teste = T.id_teste
            and T.id_staff = n_staff;
	end $$
delimiter ;

delimiter $$
CREATE PROCEDURE DTClinicaRealizouMaisTestes(In n_staff int)
    begin
        Select 
	        C.nome,
            count(C.cod_clinica) as NrTestes
        From 
	        Clinica as C,
            TesteClinico as T
        where
	        T.cod_clinica = C.cod_clinica
	        and T.id_staff = n_staff
            group by C.cod_clinica
            order by count(C.cod_clinica) DESC
            limit 1;
	end $$
delimiter ; 

delimiter $$
CREATE PROCEDURE DTComQuemTrabalhouTestes(In n_staff int)
    begin
        Select 
	        E.id_teste,
            S.nome
        From 
	        EquipaEnvolvente as E,
            Staff as S
        where
	        S.id_staff = E.id_staff
	        and E.id_teste in
		(select
			T.id_teste
		from
			TesteClinico as T,
            EquipaEnvolvente as E
		where T.id_teste = E.id_teste
        and T.id_staff = n_staff);
	end $$
delimiter ; 

delimiter $$
CREATE PROCEDURE DTAtletasTestes(In n_staff int)
    begin
        Select 
	        T.id_teste,
            A.*
        From 
	        Atleta as A,
            TesteClinico as T
        where
	        A.nif = T.nif
		and T.id_staff = n_staff;
	end $$
delimiter ; 

delimiter $$
CREATE PROCEDURE DTContactoAtletasTestes(In n_staff int)
	begin
		SELECT 
        T.id_teste,
        A.nome,
        C.ContactoCol
        FROM TesteClinico as T 
        join Atleta as A 
        ON T.nif = A.nif
		join Contacto as C 
        ON A.nif = C.Atleta_nif_atleta 
        where T.id_staff = n_staff;
	end $$
delimiter ; 