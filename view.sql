Use MedicinaDesporto;

create view atletasAlfabeticamente as 
	select A.*
	from Atleta A
	order by A.nome asc;
    
create view staffAlfabeticamente as
	select S.*
    from Staff S
    order by S.nome asc;
    
create view clinicasAlfabeticamente as
	select C.*
    from Clinica C
    order by C.nome asc;
    
create view testesData as
	select T.*
    from TesteClinico T
    order by T.data desc;