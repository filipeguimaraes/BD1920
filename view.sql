Use MedicinaDesporto;

Create view Atleta_Teste(
        nif,
        nome,
        DOB,
        sexo,
        peso,
        altura,
        cod_postal,
        cod_clinica,
        data,
        hora,
        preco,
		cod_modalidade,
        cod_clube,
        id_teste,
        id_staff
    )
    as
Select
    A.nif,
    A.nome,
    A.DOB,
    A.sexo,
    A.peso,
    A.altura,
    A.cod_postal,
    T.cod_clinica,
    T.data,
    T.hora,
    T.preco,
	A.cod_modalidade,
    A.cod_clube,
    T.id_teste,
    T.id_staff
From
    Atleta as A,
    TesteClinico as T
where A.nif = T.nif;
