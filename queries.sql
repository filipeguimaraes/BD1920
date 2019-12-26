Use MedicinaDesporto;

select * from Atleta;
select * from Clube;
select * from Clinica;
select * from Competicao;
select * from Contacto;
select * from EquipaEnvolvente;
select * from Inscricao;
select * from Modalidade;
select * from Recurso;
select * from Staff;
select * from Staff_Clinica;
select * from TesteClinico;

/*Nome dos atletas que realizaram exames na clínica 2*/
select Atleta.nome from TesteClinico join Atleta on Atleta.nif=TesteClinico.nif where cod_clinica='2';

/*Nome dos atletas cujo preço do teste clínico realizado excedeu os 15€*/
select Atleta.nome from TesteClinico join Atleta on Atleta.nif=TesteClinico.nif where preco>'15';

/*Nome dos atletas e respetiva modalidade*/
select nome,designacao from Atleta join Modalidade on Atleta.cod_modalidade=Modalidade.cod_modalidade;

/*Qual é o nome dos atletas da modalidade "Boxe"*/
select nome from Atleta join Modalidade on Atleta.cod_modalidade=Modalidade.cod_modalidade where designacao='Boxe';

/*Qual o nome dos atletas do sexo masculino da modalidade "Basquete"*/
select nome from Atleta join Modalidade on Atleta.cod_modalidade=Modalidade.cod_modalidade where sexo='M' and designacao='Basquete';

/*Qual é o nome dos atletas que não são da modalidade "Beisebol"*/
select nome from Atleta where nif not in (select nif from Atleta join Modalidade on Atleta.cod_modalidade=Modalidade.cod_modalidade where designacao='Beisebol');