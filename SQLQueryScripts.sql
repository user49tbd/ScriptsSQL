--a) Fazer um algoritmo que leia 1 número e mostre se são múltiplos de 2,3,5 ou nenhum deles
CREATE TABLE VAL
(
N		INT		NOT NULL, 
NR		INT		NOT NULL 
)
INSERT INTO VAL VALUES
(2,1),
(3,2),
(5,3)
DECLARE @I INT,
		@V1 INT,
		@V2 INT
SET @I =  1
SET @V1 = 0
SET @V2 = 25
WHILE (@I <= 3)
BEGIN
SET @V1 = (SELECT V.N FROM VAL V WHERE V.NR = @I) 
IF (@V2 % @V1 = 0)
BEGIN
PRINT(CAST(@V2 AS VARCHAR(100))+' E MULTIPLO DE '+CAST(@V1 AS VARCHAR(100)))
END
ELSE
BEGIN
PRINT(CAST(@V2 AS VARCHAR(100))+' NAO E MULTIPLO DE '+CAST(@V1 AS VARCHAR(100)))
END
SET @I = @I + 1
END
DROP TABLE VAL
--b)  Fazer um algoritmo que leia 3 números e mostre o maior e o menor
CREATE TABLE NUMO
(
NUM		INT		NOT NULL
)
DECLARE @NUM1 INT,
		@NUM2 INT,
		@NUM3 INT,
		@M	  INT,
		@N    INT
SET @NUM1 = 198
SET @NUM2 = 12
SET @NUM3 = 14
INSERT INTO NUMO
VALUES
(@NUM1),
(@NUM2),
(@NUM3)
SET @N = (SELECT TOP 1 N.NUM FROM NUMO N ORDER BY N.NUM ASC)
SET @M = (SELECT TOP 1 N.NUM FROM NUMO N ORDER BY N.NUM DESC)
PRINT('MAIOR: '+CAST(@M AS VARCHAR(100))+' - MENOR: '+CAST(@N AS VARCHAR(100)))
DROP TABLE NUMO
--c) Fazer um algoritmo que calcule os 15 primeiros termos da série 1,1,2,3,5,8,13,21,... 
--E calcule a soma dos 15 termos
CREATE TABLE SN
(
NUM			INT			NOT NULL
)
DECLARE @NS1 INT,
		@IS	 INT,
		@VAS INT,
		@VNS INT
SET @IS = 1 
SET @NS1 = 0
SET @VAS = 0
SET @VNS = 0
WHILE (@IS <= 15)
BEGIN
SET @VNS = (SELECT TOP 1 S.NUM FROM SN S ORDER BY S.NUM DESC)
IF(@VNS IS NULL)
BEGIN
SET @VNS = 1 
INSERT INTO SN VALUES
(1)
END
SET @VNS = @VNS + @VAS
INSERT INTO SN VALUES
(@VNS)
SET @VAS = @VNS-@VAS
PRINT(@VNS)
SET @IS = @IS + 1
END
SET @NS1 = (SELECT SUM(S.NUM) FROM SN S)
PRINT('SOMA: '+CAST(@NS1 AS VARCHAR(100)))
DROP TABLE SN
--d) Fazer um algoritmo que separa uma frase, 
--colocando todas as letras em maiúsculo e em minúsculo (Usar funções UPPER e LOWER)
DECLARE @F VARCHAR(100)
SET @F = 'DhGuusRtgKSifr'
PRINT(UPPER(@F)+' - '+LOWER(@F))
--e) Fazer um algoritmo que inverta uma palavra (Usar a função SUBSTRING)
DECLARE @W VARCHAR(100),
		@RW VARCHAR(100),
		@L INT,
		@IW INT
SET @W = 'WORD'
SET @RW = ''
SET @L = LEN(@W)
WHILE (@L > 0)
BEGIN
SET @RW = (SELECT CONCAT(@RW,SUBSTRING(@W,@L,1)))
SET @L = @L-1
END
PRINT(@RW)