-- Table: DB.Users

-- DROP TABLE IF EXISTS "DB"."Users";

CREATE TABLE IF NOT EXISTS "DB"."Users"
(
    "UserID" uuid NOT NULL,
    "Email" text COLLATE pg_catalog."default" NOT NULL,
    "Username" text COLLATE pg_catalog."default" NOT NULL,
    "Password" text COLLATE pg_catalog."default" NOT NULL,
    "Nome" text COLLATE pg_catalog."default" NOT NULL,
    "IsAdmin" boolean NOT NULL,
    "DataNascimento" text COLLATE pg_catalog."default" NOT NULL,
    "Localidade" text COLLATE pg_catalog."default" NOT NULL,
    "SecretKey" text COLLATE pg_catalog."default" NOT NULL,
    "Active" boolean NOT NULL,
    CONSTRAINT "Users_pkey" PRIMARY KEY ("UserID")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS "DB"."Users"
    OWNER to postgres;



create table "DB".Distrito
(
  ID TEXT not null,
  Nome    TEXT not null,
  constraint DIST_PK 
    primary key (Nome)
);

insert into "DB".Distrito (ID, Nome)
values ('PT-01', 'Aveiro');

insert into "DB".Distrito (ID, Nome)
values ('PT-02', 'Beja');

insert into "DB".Distrito (ID, Nome)
values ('PT-03', 'Braga');

insert into "DB".Distrito (ID, Nome)
values ('PT-04', 'Bragança');

insert into "DB".Distrito (ID, Nome)
values ('PT-05', 'Castelo Branco');

insert into "DB".Distrito (ID, Nome)
values ('PT-06', 'Coimbra');

insert into "DB".Distrito (ID, Nome)
values ('PT-07', 'Évora');

insert into "DB".Distrito (ID, Nome)
values ('PT-08', 'Faro');

insert into "DB".Distrito (ID, Nome)
values ('PT-09', 'Guarda');

insert into "DB".Distrito (ID, Nome)
values ('PT-10', 'Leiria');

insert into "DB".Distrito (ID, Nome)
values ('PT-11', 'Lisboa');

insert into "DB".Distrito (ID, Nome)
values ('PT-12', 'Portalegre');

insert into "DB".Distrito (ID, Nome)
values ('PT-13', 'Porto');

insert into "DB".Distrito (ID, Nome)
values ('PT-14', 'Santarém');

insert into "DB".Distrito (ID, Nome)
values ('PT-15', 'Setúbal');

insert into "DB".Distrito (ID, Nome)
values ('PT-16', 'Viana do Castelo');

insert into "DB".Distrito (ID, Nome)
values ('PT-17', 'Vila Real');

insert into "DB".Distrito (ID, Nome)
values ('PT-18', 'Viseu');

insert into "DB".Distrito (ID, Nome)
values ('PT-20', 'Região Autónoma dos Açores');

insert into "DB".Distrito (ID, Nome)
values ('PT-30', 'Região Autónoma da Madeira');

create table "DB".Concelho
(
  ID      text not null,
  MUNICIPIO     text not null,
  ID_MUN        text not null,
  DISTRITO_ILHA text not null,
  DISTRITO_RAUT text not null,
  COD_NUTS3 text not null
  constraint L1_PK 
    primary key (ID),
  constraint L1_DIST_FK 
    foreign key (DISTRITO_RAUT) references "DB".Distrito (Nome),
);

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0101', 'Águeda', 'AGD', 'Aveiro', 'Aveiro', 'PT16D');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0901', 'Aguiar da Beira', 'AGB', 'Guarda', 'Guarda', 'PT16G');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1501', 'Alcácer do Sal', 'ASL', 'Setúbal', 'Setúbal', 'PT181');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1502', 'Alcochete', 'ACH', 'Setúbal', 'Setúbal', 'PT170');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0802', 'Alcoutim', 'ACT', 'Faro', 'Faro', 'PT150');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0401', 'Alfândega da Fé', 'AFE', 'Bragança', 'Bragança', 'PT11E');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0803', 'Aljezur', 'AJZ', 'Faro', 'Faro', 'PT150');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0902', 'Almeida', 'ALD', 'Guarda', 'Guarda', 'PT16J');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1002', 'Alvaiázere', 'AVZ', 'Leiria', 'Leiria', 'PT16F');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0203', 'Alvito', 'AVT', 'Beja', 'Beja', 'PT184');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1115', 'Amadora', 'AMD', 'Lisboa', 'Lisboa', 'PT170');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1301', 'Amarante', 'AMT', 'Porto', 'Porto', 'PT11C');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1003', 'Ansião', 'ANS', 'Leiria', 'Leiria', 'PT16F');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1601', 'Arcos de Valdevez', 'AVV', 'Viana do Castelo', 'Viana do Castelo', 'PT111');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0104', 'Arouca', 'ARC', 'Aveiro', 'Aveiro', 'PT11A');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0702', 'Arraiolos', 'ARL', 'Évora', 'Évora', 'PT187');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1103', 'Azambuja', 'AZB', 'Lisboa', 'Lisboa', 'PT185');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0302', 'Barcelos', 'BCL', 'Braga', 'Braga', 'PT112');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0204', 'Barrancos', 'BRC', 'Beja', 'Beja', 'PT184');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0205', 'Beja', 'BJA', 'Beja', 'Beja', 'PT184');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1405', 'Benavente', 'BNV', 'Santarém', 'Santarém', 'PT185');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1005', 'Bombarral', 'BBR', 'Leiria', 'Leiria', 'PT16B');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0402', 'Bragança', 'BGC', 'Bragança', 'Bragança', 'PT11E');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0304', 'Cabeceiras de Basto', 'CBC', 'Braga', 'Braga', 'PT119');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1006', 'Caldas da Rainha', 'CLD', 'Leiria', 'Leiria', 'PT16B');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1602', 'Caminha', 'CMN', 'Viana do Castelo', 'Viana do Castelo', 'PT111');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0403', 'Carrazeda de Ansiães', 'CRZ', 'Bragança', 'Bragança', 'PT11D');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1406', 'Cartaxo', 'CTX', 'Santarém', 'Santarém', 'PT185');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1007', 'Castanheira de Pêra', 'CPR', 'Leiria', 'Leiria', 'PT16F');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0106', 'Castelo de Paiva', 'CPV', 'Aveiro', 'Aveiro', 'PT11C');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1205', 'Castelo de Vide', 'CVD', 'Portalegre', 'Portalegre', 'PT186');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0206', 'Castro Verde', 'CVR', 'Beja', 'Beja', 'PT184');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0903', 'Celorico da Beira', 'CLB', 'Guarda', 'Guarda', 'PT16J');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1407', 'Chamusca', 'CHM', 'Santarém', 'Santarém', 'PT185');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0604', 'Condeixa-a-Nova', 'CDN', 'Coimbra', 'Coimbra', 'PT16E');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1409', 'Coruche', 'CCH', 'Santarém', 'Santarém', 'PT185');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0207', 'Cuba', 'CUB', 'Beja', 'Beja', 'PT184');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1207', 'Elvas', 'ELV', 'Portalegre', 'Portalegre', 'PT186');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0107', 'Espinho', 'ESP', 'Aveiro', 'Aveiro', 'PT11A');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0306', 'Esposende', 'EPS', 'Braga', 'Braga', 'PT112');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0307', 'Fafe', 'FAF', 'Braga', 'Braga', 'PT119');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1303', 'Felgueiras', 'FLG', 'Porto', 'Porto', 'PT11C');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0605', 'Figueira da Foz', 'FIG', 'Coimbra', 'Coimbra', 'PT16E');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0904', 'Figueira de Castelo Rodrigo', 'FCR', 'Guarda', 'Guarda', 'PT16J');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1008', 'Figueiró dos Vinhos', 'FVN', 'Leiria', 'Leiria', 'PT16F');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0404', 'Freixo de Espada à Cinta', 'FEC', 'Bragança', 'Bragança', 'PT11D');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0504', 'Fundão', 'FND', 'Castelo Branco', 'Castelo Branco', 'PT16J');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0906', 'Gouveia', 'GVA', 'Guarda', 'Guarda', 'PT16J');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0907', 'Guarda', 'GRD', 'Guarda', 'Guarda', 'PT16J');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0308', 'Guimarães', 'GMR', 'Braga', 'Braga', 'PT119');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0806', 'Lagoa', 'LGA', 'Faro', 'Faro', 'PT150');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0807', 'Lagos', 'LGS', 'Faro', 'Faro', 'PT150');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('4601', 'Lajes do Pico', 'LGP', 'Ilha do Pico', 'Região Autónoma dos Açores', 'PT200');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1009', 'Leiria', 'LRA', 'Leiria', 'Leiria', 'PT16F');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1107', 'Loures', 'LRS', 'Lisboa', 'Lisboa', 'PT170');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0607', 'Lousã', 'LSA', 'Coimbra', 'Coimbra', 'PT16E');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1305', 'Lousada', 'LSD', 'Porto', 'Porto', 'PT11C');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1109', 'Mafra', 'MFR', 'Lisboa', 'Lisboa', 'PT170');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1306', 'Maia', 'MAI', 'Porto', 'Porto', 'PT11A');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0908', 'Manteigas', 'MTG', 'Guarda', 'Guarda', 'PT16J');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1307', 'Marco de Canaveses', 'MCN', 'Porto', 'Porto', 'PT11C');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1308', 'Matosinhos', 'MTS', 'Porto', 'Porto', 'PT11A');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0111', 'Mealhada', 'MLD', 'Aveiro', 'Aveiro', 'PT16E');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0209', 'Mértola', 'MTL', 'Beja', 'Beja', 'PT184');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1704', 'Mesão Frio', 'MSF', 'Vila Real', 'Vila Real', 'PT11D');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0406', 'Miranda do Douro', 'MDR', 'Bragança', 'Bragança', 'PT11E');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1506', 'Moita', 'MTA', 'Setúbal', 'Setúbal', 'PT170');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0809', 'Monchique', 'MCQ', 'Faro', 'Faro', 'PT150');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1705', 'Mondim de Basto', 'MDB', 'Vila Real', 'Vila Real', 'PT119');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0706', 'Montemor-o-Novo', 'MMN', 'Évora', 'Évora', 'PT187');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1507', 'Montijo', 'MTJ', 'Setúbal', 'Setúbal', 'PT170');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0707', 'Mora', 'MOR', 'Évora', 'Évora', 'PT187');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1808', 'Mortágua', 'MRT', 'Viseu', 'Viseu', 'PT16E');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0112', 'Murtosa', 'MRS', 'Aveiro', 'Aveiro', 'PT16D');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1011', 'Nazaré', 'NZR', 'Leiria', 'Leiria', 'PT16B');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0211', 'Odemira', 'ODM', 'Beja', 'Beja', 'PT181');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1110', 'Oeiras', 'OER', 'Lisboa', 'Lisboa', 'PT170');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0810', 'Olhão', 'OLH', 'Faro', 'Faro', 'PT150');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0113', 'Oliveira de Azeméis', 'OAZ', 'Aveiro', 'Aveiro', 'PT11A');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0611', 'Oliveira do Hospital', 'OHP', 'Coimbra', 'Coimbra', 'PT16E');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1421', 'Ourém', 'VNO', 'Santarém', 'Santarém', 'PT16I');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0212', 'Ourique', 'ORQ', 'Beja', 'Beja', 'PT184');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0612', 'Pampilhosa da Serra', 'PPS', 'Coimbra', 'Coimbra', 'PT16E');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1310', 'Paredes', 'PRD', 'Porto', 'Porto', 'PT11A');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1013', 'Pedrógão Grande', 'PGR', 'Leiria', 'Leiria', 'PT16F');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1311', 'Penafiel', 'PNF', 'Porto', 'Porto', 'PT11C');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0507', 'Penamacor', 'PNC', 'Castelo Branco', 'Castelo Branco', 'PT16H');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1014', 'Peniche', 'PNI', 'Leiria', 'Leiria', 'PT16B');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1606', 'Ponte da Barca', 'PTB', 'Viana do Castelo', 'Viana do Castelo', 'PT111');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1214', 'Portalegre', 'PTG', 'Portalegre', 'Portalegre', 'PT186');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0709', 'Portel', 'PRL', 'Évora', 'Évora', 'PT187');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0811', 'Portimão', 'PTM', 'Faro', 'Faro', 'PT150');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1016', 'Porto de Mós', 'PMS', 'Leiria', 'Leiria', 'PT16F');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0309', 'Póvoa de Lanhoso', 'PVL', 'Braga', 'Braga', 'PT119');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1313', 'Póvoa de Varzim', 'PVZ', 'Porto', 'Porto', 'PT11A');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0710', 'Redondo', 'RDD', 'Évora', 'Évora', 'PT187');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0711', 'Reguengos de Monsaraz', 'RMZ', 'Évora', 'Évora', 'PT187');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1813', 'Resende', 'RSD', 'Viseu', 'Viseu', 'PT11C');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1710', 'Sabrosa', 'SBR', 'Vila Real', 'Vila Real', 'PT11D');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0911', 'Sabugal', 'SBG', 'Guarda', 'Guarda', 'PT16J');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1415', 'Salvaterra de Magos', 'SMG', 'Santarém', 'Santarém', 'PT185');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0109', 'Santa Maria da Feira', 'VFR', 'Aveiro', 'Aveiro', 'PT11A');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('3109', 'Santana', 'STN', 'Ilha da Madeira', 'Região Autónoma da Madeira', 'PT300');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1314', 'Santo Tirso', 'STS', 'Porto', 'Porto', 'PT11A');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0812', 'São Brás de Alportel', 'SBA', 'Faro', 'Faro', 'PT150');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0116', 'São João da Madeira', 'SJM', 'Aveiro', 'Aveiro', 'PT11A');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('3110', 'São Vicente', 'SVC', 'Ilha da Madeira', 'Região Autónoma da Madeira', 'PT300');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0912', 'Seia', 'SEI', 'Guarda', 'Guarda', 'PT16J');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0813', 'Silves', 'SLV', 'Faro', 'Faro', 'PT150');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1215', 'Sousel', 'SSL', 'Portalegre', 'Portalegre', 'PT186');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1819', 'Tabuaço', 'TBC', 'Viseu', 'Viseu', 'PT11D');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0814', 'Tavira', 'TVR', 'Faro', 'Faro', 'PT150');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0409', 'Torre de Moncorvo', 'TMC', 'Bragança', 'Bragança', 'PT11D');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0913', 'Trancoso', 'TCS', 'Guarda', 'Guarda', 'PT16J');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1315', 'Valongo', 'VLG', 'Porto', 'Porto', 'PT11A');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0713', 'Viana do Alentejo', 'VNT', 'Évora', 'Évora', 'PT187');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0815', 'Vila do Bispo', 'VBP', 'Faro', 'Faro', 'PT150');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1316', 'Vila do Conde', 'VCD', 'Porto', 'Porto', 'PT11A');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1114', 'Vila Franca de Xira', 'VFX', 'Lisboa', 'Lisboa', 'PT170');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1420', 'Vila Nova da Barquinha', 'VNB', 'Santarém', 'Santarém', 'PT16I');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0312', 'Vila Nova de Famalicão', 'VNF', 'Braga', 'Braga', 'PT119');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1822', 'Vila Nova de Paiva', 'VNP', 'Viseu', 'Viseu', 'PT16G');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0617', 'Vila Nova de Poiares', 'PRS', 'Coimbra', 'Coimbra', 'PT16E');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1713', 'Vila Pouca de Aguiar', 'VPA', 'Vila Real', 'Vila Real', 'PT11B');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0313', 'Vila Verde', 'VVD', 'Braga', 'Braga', 'PT112');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0411', 'Vimioso', 'VMS', 'Bragança', 'Bragança', 'PT11E');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0412', 'Vinhais', 'VNH', 'Bragança', 'Bragança', 'PT11E');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1401', 'Abrantes', 'ABT', 'Santarém', 'Santarém', 'PT16I');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0102', 'Albergaria-a-Velha', 'ABL', 'Aveiro', 'Aveiro', 'PT16D');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1001', 'Alcobaça', 'ACB', 'Leiria', 'Leiria', 'PT16B');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1101', 'Alenquer', 'ALQ', 'Lisboa', 'Lisboa', 'PT16B');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1701', 'Alijó', 'ALJ', 'Vila Real', 'Vila Real', 'PT11D');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1503', 'Almada', 'ALM', 'Setúbal', 'Setúbal', 'PT170');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0202', 'Almodôvar', 'ADV', 'Beja', 'Beja', 'PT184');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1201', 'Alter do Chão', 'ALT', 'Portalegre', 'Portalegre', 'PT186');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0301', 'Amares', 'AMR', 'Braga', 'Braga', 'PT112');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('4301', 'Angra do Heroísmo', 'AGH', 'Ilha Terceira', 'Região Autónoma dos Açores', 'PT200');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1801', 'Armamar', 'AMM', 'Viseu', 'Viseu', 'PT11D');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1202', 'Arronches', 'ARR', 'Portalegre', 'Portalegre', 'PT186');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1203', 'Avis', 'AVS', 'Portalegre', 'Portalegre', 'PT186');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1302', 'Baião', 'BAO', 'Porto', 'Porto', 'PT11C');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1504', 'Barreiro', 'BRR', 'Setúbal', 'Setúbal', 'PT170');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0501', 'Belmonte', 'BMT', 'Castelo Branco', 'Castelo Branco', 'PT16J');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0703', 'Borba', 'BRB', 'Évora', 'Évora', 'PT187');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0303', 'Braga', 'BRG', 'Braga', 'Braga', 'PT112');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1104', 'Cadaval', 'CDV', 'Lisboa', 'Lisboa', 'PT16B');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('4501', 'Calheta (R.A.A.)', 'CHT', 'Ilha de São Jorge', 'Região Autónoma dos Açores', 'PT200');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('3101', 'Calheta (R.A.M.)', 'CLT', 'Ilha da Madeira', 'Região Autónoma da Madeira', 'PT300');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1204', 'Campo Maior', 'CMR', 'Portalegre', 'Portalegre', 'PT186');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1802', 'Carregal do Sal', 'CRS', 'Viseu', 'Viseu', 'PT16G');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0502', 'Castelo Branco', 'CTB', 'Castelo Branco', 'Castelo Branco', 'PT16H');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1803', 'Castro Daire', 'CDR', 'Viseu', 'Viseu', 'PT16G');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0305', 'Celorico de Basto', 'CBT', 'Braga', 'Braga', 'PT11C');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0603', 'Coimbra', 'CBR', 'Coimbra', 'Coimbra', 'PT16E');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1408', 'Constância', 'CTC', 'Santarém', 'Santarém', 'PT16I');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('4901', 'Corvo', 'CRV', 'Ilha do Corvo', 'Região Autónoma dos Açores', 'PT200');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1206', 'Crato', 'CRT', 'Portalegre', 'Portalegre', 'PT186');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1410', 'Entroncamento', 'ENT', 'Santarém', 'Santarém', 'PT16I');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0704', 'Estremoz', 'ETZ', 'Évora', 'Évora', 'PT187');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1411', 'Ferreira do Zêzere', 'FZZ', 'Santarém', 'Santarém', 'PT16I');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0905', 'Fornos de Algodres', 'FAG', 'Guarda', 'Guarda', 'PT16J');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('3103', 'Funchal', 'FUN', 'Ilha da Madeira', 'Região Autónoma da Madeira', 'PT300');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1209', 'Gavião', 'GAV', 'Portalegre', 'Portalegre', 'PT186');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1304', 'Gondomar', 'GDM', 'Porto', 'Porto', 'PT11A');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1505', 'Grândola', 'GDL', 'Setúbal', 'Setúbal', 'PT181');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('4701', 'Horta', 'HRT', 'Ilha do Faial', 'Região Autónoma dos Açores', 'PT200');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0110', 'Ílhavo', 'ILH', 'Aveiro', 'Aveiro', 'PT16D');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('4201', 'Lagoa (R.A.A)', 'LAG', 'Ilha de São Miguel', 'Região Autónoma dos Açores', 'PT200');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0808', 'Loulé', 'LLE', 'Faro', 'Faro', 'PT150');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1108', 'Lourinhã', 'LNH', 'Lisboa', 'Lisboa', 'PT16B');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1413', 'Mação', 'MAC', 'Santarém', 'Santarém', 'PT16I');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('3104', 'Machico', 'MCH', 'Ilha da Madeira', 'Região Autónoma da Madeira', 'PT300');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('4602', 'Madalena', 'MAD', 'Ilha do Pico', 'Região Autónoma dos Açores', 'PT200');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1010', 'Marinha Grande', 'MGR', 'Leiria', 'Leiria', 'PT16F');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0909', 'Mêda', 'MDA', 'Guarda', 'Guarda', 'PT16J');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1603', 'Melgaço', 'MLG', 'Viana do Castelo', 'Viana do Castelo', 'PT111');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0609', 'Miranda do Corvo', 'MCV', 'Coimbra', 'Coimbra', 'PT16E');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0408', 'Mogadouro', 'MGD', 'Bragança', 'Bragança', 'PT11E');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1604', 'Monção', 'MNC', 'Viana do Castelo', 'Viana do Castelo', 'PT111');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1211', 'Monforte', 'MFT', 'Portalegre', 'Portalegre', 'PT186');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0610', 'Montemor-o-Velho', 'MMV', 'Coimbra', 'Coimbra', 'PT16E');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0210', 'Moura', 'MRA', 'Beja', 'Beja', 'PT184');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1707', 'Murça', 'MUR', 'Vila Real', 'Vila Real', 'PT11D');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1809', 'Nelas', 'NLS', 'Viseu', 'Viseu', 'PT16G');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('4202', 'Nordeste', 'NRD', 'Ilha de São Miguel', 'Região Autónoma dos Açores', 'PT200');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1116', 'Odivelas', 'ODV', 'Lisboa', 'Lisboa', 'PT170');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0506', 'Oleiros', 'OLR', 'Castelo Branco', 'Castelo Branco', 'PT16H');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0114', 'Oliveira do Bairro', 'OBR', 'Aveiro', 'Aveiro', 'PT16D');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1605', 'Paredes de Coura', 'PCR', 'Viana do Castelo', 'Viana do Castelo', 'PT111');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1811', 'Penalva do Castelo', 'PCT', 'Viseu', 'Viseu', 'PT16G');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0614', 'Penela', 'PNL', 'Coimbra', 'Coimbra', 'PT16E');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0910', 'Pinhel', 'PNH', 'Guarda', 'Guarda', 'PT16J');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('4203', 'Ponta Delgada', 'PDL', 'Ilha de São Miguel', 'Região Autónoma dos Açores', 'PT200');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('3105', 'Ponta do Sol', 'PTS', 'Ilha da Madeira', 'Região Autónoma da Madeira', 'PT300');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1213', 'Ponte de Sor', 'PSR', 'Portalegre', 'Portalegre', 'PT186');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1312', 'Porto', 'PRT', 'Porto', 'Porto', 'PT11A');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('3106', 'Porto Moniz', 'PMZ', 'Ilha da Madeira', 'Região Autónoma da Madeira', 'PT300');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('3201', 'Porto Santo', 'PST', 'Ilha de Porto Santo', 'Região Autónoma da Madeira', 'PT300');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('4204', 'Povoação', 'PVC', 'Ilha de São Miguel', 'Região Autónoma dos Açores', 'PT200');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('3107', 'Ribeira Brava', 'RBR', 'Ilha da Madeira', 'Região Autónoma da Madeira', 'PT300');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1814', 'Santa Comba Dão', 'SCD', 'Viseu', 'Viseu', 'PT16G');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('3108', 'Santa Cruz', 'SCR', 'Ilha da Madeira', 'Região Autónoma da Madeira', 'PT300');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1711', 'Santa Marta de Penaguião', 'SMP', 'Vila Real', 'Vila Real', 'PT11D');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1416', 'Santarém', 'STR', 'Santarém', 'Santarém', 'PT185');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1816', 'São Pedro do Sul', 'SPS', 'Viseu', 'Viseu', 'PT16G');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('4603', 'São Roque do Pico', 'SRQ', 'Ilha do Pico', 'Região Autónoma dos Açores', 'PT200');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1818', 'Sernancelhe', 'SRN', 'Viseu', 'Viseu', 'PT11D');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1512', 'Setúbal', 'STB', 'Setúbal', 'Setúbal', 'PT170');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1112', 'Sobral de Monte Agraço', 'SMA', 'Lisboa', 'Lisboa', 'PT16B');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1821', 'Tondela', 'TND', 'Viseu', 'Viseu', 'PT16G');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1113', 'Torres Vedras', 'TVD', 'Lisboa', 'Lisboa', 'PT16B');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1608', 'Valença', 'VLN', 'Viana do Castelo', 'Viana do Castelo', 'PT111');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('4502', 'Velas', 'VLS', 'Ilha de São Jorge', 'Região Autónoma dos Açores', 'PT200');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0311', 'Vieira do Minho', 'VRM', 'Braga', 'Braga', 'PT119');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('4302', 'Praia da Vitória', 'VPV', 'Ilha Terceira', 'Região Autónoma dos Açores', 'PT200');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1610', 'Vila Nova de Cerveira', 'VNC', 'Viana do Castelo', 'Viana do Castelo', 'PT111');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0816', 'Vila Real de Santo António', 'VRS', 'Faro', 'Faro', 'PT150');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0314', 'Vizela', 'VIZ', 'Braga', 'Braga', 'PT119');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0701', 'Alandroal', 'ADL', 'Évora', 'Évora', 'PT187');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1402', 'Alcanena', 'ACN', 'Santarém', 'Santarém', 'PT16I');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0201', 'Aljustrel', 'AJT', 'Beja', 'Beja', 'PT184');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1404', 'Alpiarça', 'APC', 'Santarém', 'Santarém', 'PT185');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0103', 'Anadia', 'AND', 'Aveiro', 'Aveiro', 'PT16D');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0601', 'Arganil', 'AGN', 'Coimbra', 'Coimbra', 'PT16E');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0105', 'Aveiro', 'AVR', 'Aveiro', 'Aveiro', 'PT16D');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1004', 'Batalha', 'BTL', 'Leiria', 'Leiria', 'PT16F');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1702', 'Boticas', 'BTC', 'Vila Real', 'Vila Real', 'PT11B');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('3102', 'Câmara de Lobos', 'CML', 'Ilha da Madeira', 'Região Autónoma da Madeira', 'PT300');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1105', 'Cascais', 'CSC', 'Lisboa', 'Lisboa', 'PT170');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0804', 'Castro Marim', 'CTM', 'Faro', 'Faro', 'PT150');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1703', 'Chaves', 'CHV', 'Vila Real', 'Vila Real', 'PT11B');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0503', 'Covilhã', 'CVL', 'Castelo Branco', 'Castelo Branco', 'PT16J');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0108', 'Estarreja', 'ETR', 'Aveiro', 'Aveiro', 'PT16D');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0208', 'Ferreira do Alentejo', 'FAL', 'Beja', 'Beja', 'PT184');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1208', 'Fronteira', 'FTR', 'Portalegre', 'Portalegre', 'PT186');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1412', 'Golegã', 'GLG', 'Santarém', 'Santarém', 'PT185');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0505', 'Idanha-a-Nova', 'IDN', 'Castelo Branco', 'Castelo Branco', 'PT16H');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1106', 'Lisboa', 'LSB', 'Lisboa', 'Lisboa', 'PT170');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0405', 'Macedo de Cavaleiros', 'MDC', 'Bragança', 'Bragança', 'PT11E');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1210', 'Marvão', 'MRV', 'Portalegre', 'Portalegre', 'PT186');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0608', 'Mira', 'MIR', 'Coimbra', 'Coimbra', 'PT16E');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1807', 'Moimenta da Beira', 'MBR', 'Viseu', 'Viseu', 'PT11D');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1706', 'Montalegre', 'MTR', 'Vila Real', 'Vila Real', 'PT11B');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0708', 'Mourão', 'MOU', 'Évora', 'Évora', 'PT187');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1212', 'Nisa', 'NIS', 'Portalegre', 'Portalegre', 'PT186');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1810', 'Oliveira de Frades', 'OFR', 'Viseu', 'Viseu', 'PT16G');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1508', 'Palmela', 'PLM', 'Setúbal', 'Setúbal', 'PT170');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0613', 'Penacova', 'PCV', 'Coimbra', 'Coimbra', 'PT16E');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1812', 'Penedono', 'PND', 'Viseu', 'Viseu', 'PT11D');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1015', 'Pombal', 'PBL', 'Leiria', 'Leiria', 'PT16F');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1607', 'Ponte de Lima', 'PTL', 'Viana do Castelo', 'Viana do Castelo', 'PT111');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0508', 'Proença-a-Nova', 'PNV', 'Castelo Branco', 'Castelo Branco', 'PT16H');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1414', 'Rio Maior', 'RMR', 'Santarém', 'Santarém', 'PT185');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('4401', 'Santa Cruz da Graciosa', 'SCG', 'Ilha da Graciosa', 'Região Autónoma dos Açores', 'PT200');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1417', 'Sardoal', 'SRD', 'Santarém', 'Santarém', 'PT16I');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1513', 'Sines', 'SNS', 'Setúbal', 'Setúbal', 'PT181');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1418', 'Tomar', 'TMR', 'Santarém', 'Santarém', 'PT16I');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0118', 'Vagos', 'VGS', 'Aveiro', 'Aveiro', 'PT16D');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1609', 'Viana do Castelo', 'VCT', 'Viana do Castelo', 'Viana do Castelo', 'PT111');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1317', 'Vila Nova de Gaia', 'VNG', 'Porto', 'Porto', 'PT11A');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0714', 'Vila Viçosa', 'VVC', 'Évora', 'Évora', 'PT187');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0801', 'Albufeira', 'ABF', 'Faro', 'Faro', 'PT150');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1403', 'Almeirim', 'ALR', 'Santarém', 'Santarém', 'PT185');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1102', 'Arruda dos Vinhos', 'ARV', 'Lisboa', 'Lisboa', 'PT16B');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0602', 'Cantanhede', 'CNT', 'Coimbra', 'Coimbra', 'PT16E');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1804', 'Cinfães', 'CNF', 'Viseu', 'Viseu', 'PT11C');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0705', 'Évora', 'EVR', 'Évora', 'Évora', 'PT187');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0606', 'Góis', 'GOI', 'Coimbra', 'Coimbra', 'PT16E');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1805', 'Lamego', 'LMG', 'Viseu', 'Viseu', 'PT11D');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1806', 'Mangualde', 'MGL', 'Viseu', 'Viseu', 'PT16G');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0407', 'Mirandela', 'MDL', 'Bragança', 'Bragança', 'PT11E');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1012', 'Óbidos', 'OBD', 'Leiria', 'Leiria', 'PT16B');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0115', 'Ovar', 'OVR', 'Aveiro', 'Aveiro', 'PT16D');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1708', 'Peso da Régua', 'PRG', 'Vila Real', 'Vila Real', 'PT11D');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1709', 'Ribeira de Pena', 'RPN', 'Vila Real', 'Vila Real', 'PT11B');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0509', 'Sertã', 'SRT', 'Castelo Branco', 'Castelo Branco', 'PT16I');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0410', 'Vila Flor', 'VFL', 'Bragança', 'Bragança', 'PT11E');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0805', 'Faro', 'FAR', 'Faro', 'Faro', 'PT150');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('4801', 'Lajes das Flores', 'LGF', 'Ilha das Flores', 'Região Autónoma dos Açores', 'PT200');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1309', 'Paços de Ferreira', 'PFR', 'Porto', 'Porto', 'PT11C');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('4205', 'Ribeira Grande', 'RGR', 'Ilha de São Miguel', 'Região Autónoma dos Açores', 'PT200');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('4802', 'Santa Cruz das Flores', 'SCF', 'Ilha das Flores', 'Região Autónoma dos Açores', 'PT200');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1509', 'Santiago do Cacém', 'STC', 'Setúbal', 'Setúbal', 'PT181');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1815', 'São João da Pesqueira', 'SJP', 'Viseu', 'Viseu', 'PT11D');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1817', 'Sátão', 'SAT', 'Viseu', 'Viseu', 'PT16G');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1510', 'Seixal', 'SXL', 'Setúbal', 'Setúbal', 'PT170');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0213', 'Serpa', 'SRP', 'Beja', 'Beja', 'PT184');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1511', 'Sesimbra', 'SSB', 'Setúbal', 'Setúbal', 'PT170');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0117', 'Sever do Vouga', 'SVV', 'Aveiro', 'Aveiro', 'PT16D');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1111', 'Sintra', 'SNT', 'Lisboa', 'Lisboa', 'PT170');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0615', 'Soure', 'SRE', 'Coimbra', 'Coimbra', 'PT16E');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0616', 'Tábua', 'TBU', 'Coimbra', 'Coimbra', 'PT16E');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1820', 'Tarouca', 'TRC', 'Viseu', 'Viseu', 'PT11D');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0310', 'Terras de Bouro', 'TBR', 'Braga', 'Braga', 'PT112');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1419', 'Torres Novas', 'TNV', 'Santarém', 'Santarém', 'PT16I');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1318', 'Trofa', 'TRF', 'Porto', 'Porto', 'PT11A');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0119', 'Vale de Cambra', 'VLC', 'Aveiro', 'Aveiro', 'PT11A');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1712', 'Valpaços', 'VLP', 'Vila Real', 'Vila Real', 'PT11B');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0712', 'Vendas Novas', 'VND', 'Évora', 'Évora', 'PT187');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0214', 'Vidigueira', 'VDG', 'Beja', 'Beja', 'PT184');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0510', 'Vila de Rei', 'VLR', 'Castelo Branco', 'Castelo Branco', 'PT16I');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('4101', 'Vila do Porto', 'VPT', 'Ilha de Santa Maria', 'Região Autónoma dos Açores', 'PT200');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('4206', 'Vila Franca do Campo', 'VFC', 'Ilha de São Miguel', 'Região Autónoma dos Açores', 'PT200');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0914', 'Vila Nova de Foz Côa', 'VLF', 'Guarda', 'Guarda', 'PT11D');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1714', 'Vila Real', 'VRL', 'Vila Real', 'Vila Real', 'PT11D');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('0511', 'Vila Velha de Ródão', 'VVR', 'Castelo Branco', 'Castelo Branco', 'PT16H');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1823', 'Viseu', 'VIS', 'Viseu', 'Viseu', 'PT16G');

insert into "DB".Concelho (COD_LAU1, MUNICIPIO, ID_MUN, DISTRITO_ILHA, DISTRITO_RAUT)
values ('1824', 'Vouzela', 'VZL', 'Viseu', 'Viseu', 'PT16G');