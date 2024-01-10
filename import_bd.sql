
--en caso no exista la tabla la crea
IF NOT EXISTS (SELECT * FROM SYS.TABLES WHERE object_id=OBJECT_ID(N'dbo.starbucks') AND type ='U')
create table dbo.starbucks(
beverage_category varchar(50),
beverage varchar (100),
beverage_prep varchar(50),
calories decimal (6,3),
total_fat_g varchar(10),
trans_fat_g decimal(6,3),
saturated_fat_g decimal(6,3),
sodium_mg decimal(6,3),
total_carbohydrates_g decimal (6,3),
cholesterol_mg decimal(6,3),
dietary_fibre_g decimal (6,3),
sugar_g decimal(6,3),
protein_g decimal(6,3),
vitamin_a_pct varchar (10),
vitamin_c_pct varchar (10),
calcium_pct varchar(10),
iron_pct varchar (10),
caffeine_mg varchar(10)
)
go
--si ya existe la tabla dbo.starbucks la limpia
TRUNCATE TABLE dbo.starbucks;
go

---import datadesde archivo

BULK INSERT dbo.starbucks
from 'C:\Users\JSM\Documents\proyecto_parcial\dataset\starbucks.csv'
WITH 
(
FIRSTROW =2, ---empieza en la 2da fila ya que la 1 era es la cabecera
FIELDTERMINATOR =',', ---indicamos separador de columnas
ROWTERMINATOR ='0x0a'--hace referencia a un salto d elinea
)
go