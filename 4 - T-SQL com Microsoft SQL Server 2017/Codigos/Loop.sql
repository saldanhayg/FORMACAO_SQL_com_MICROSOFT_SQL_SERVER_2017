
DECLARE @LIMITE_MINIMO INT, @LIMITE_MAXIMO INT, @LIMITE_BREAK INT

SET @LIMITE_MINIMO = 1
SET @LIMITE_MAXIMO = 10
SET @LIMITE_BREAK = 12

WHILE @LIMITE_MINIMO <= @LIMITE_MAXIMO
BEGIN
   PRINT @LIMITE_MINIMO
   SET @LIMITE_MINIMO = @LIMITE_MINIMO + 1
   IF @LIMITE_MINIMO = @LIMITE_BREAK
   BEGIN
      PRINT 'Saindo por causa do BREAK'
      BREAK
   END
END