delimiter $$
CREATE PROCEDURE ATodosTestes(IN nif_atleta int)
    begin
        Select 
            T.*
        From
            TesteClinico as T,
            Atleta as A
        where
	        A.nif = T.nif
            and A.nif = nif_atleta;
	end $$
delimiter ;

delimiter $$
CREATE PROCEDURE ATestesEmClinica(IN n_clinica int, IN n_atleta INT)
begin
	Select
		T.*
	From
		TesteClinico as T,
		Atleta as A
	where
		T.nif = A.nif
        and A.nif = n_atleta
		and T.cod_clinica = n_clinica;
end$$
delimiter ;

delimiter $$
CREATE PROCEDURE ATestesEntreDatas(IN d_start DATE, IN d_end DATE, IN n_atleta INT)
    begin
        Select *
        From 
	        TesteClinico as T,
            Atleta as A
        where 
			T.nif = A.nif
            and A.nif = n_atleta
	        and T.data between d_start and d_end;
	end $$
delimiter ;

delimiter $$
CREATE PROCEDURE ATestesPrecoCrescente(In nif_atleta int)
    begin
        Select 
			T.id_teste,
			T.preco
        From 
	        Atleta as A,
            TesteClinico as T
        where 
            A.nif = T.nif
            and A.nif = nif_atleta
        order by T.preco;  
	end $$
delimiter ;

delimiter $$
CREATE PROCEDURE AClinicaEmQueMaisGasta(In nif_atleta int)
    begin
        Select 
			T.cod_clinica,
            sum(T.preco) as Gasto
        From 
	        Atleta as A,
            TesteClinico as T
        where 
            A.nif = T.nif
            and A.nif = nif_atleta
		group by T.cod_clinica
        order by sum(T.preco) DESC
        limit 1;  
	end $$
delimiter ;