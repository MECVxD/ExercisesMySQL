DELIMITER ;
DROP PROCEDURE IF EXISTS `SP_MAURICIOPRO`;
DELIMITER $$

CREATE PROCEDURE `SP_MAURICIOPRO`(
/* SP para realizar suma de los dias dependiendo si los dias habiles
		son de lunes a viernes o de lunes a sabado
		
		Ejemplo del call "CALL SP_MAURICIOPRO(5, 5, '2021-06-24', ?, ?);"
		
*/
	
	Par_DiasSum											INT(11),	
	Par_SabadoHabil									CHAR(1),	
	Par_Fecha												DATE,	
	OUT Mensaje											VARCHAR(200),
	OUT Resultado										VARCHAR(200)
	
)
TerminaStore: BEGIN
	-- Declaracion de Variables
	
	DECLARE Fecha_Vacia							DATE;
	DECLARE Entero_Cero							INT(5);
	DECLARE Var_DiasTrancurridos		INT(11);
	DECLARE Var_Resultado_Pr				DATE;

	SET Entero_Cero									:= 0;							
	SET	Fecha_Vacia	 		 						:= '1900-01-01';
	SET Dias        								:= 0;
	SET Var_Resultado_Pr 						:= Par_Fecha;
	
	ManejoErrores: BEGIN 
		
		IF(IFNULL(Par_Fecha	, Fecha_Vacia) = Fecha_Vacia) THEN
			SET Mensaje:= 'La fecha esta vacia.';
			LEAVE ManejoErrores;
		END IF;
		
		IF(IFNULL(Par_DiasSum, Entero_Cero) = Entero_Cero) THEN
			SET Mensaje:= 'El campo de dia esta vacio';
			LEAVE ManejoErrores;
		END IF;
	  
		WHILE Var_DiasTrancurridos < Par_DiasSum DO
			SET Var_Resultado_Pr:=DATE_ADD(Var_Resultado_Pr, INTERVAL 1 DAY);

			IF DAYOFWEEK(Var_Resultado_Pr) IN (2,3,4,5,6) OR (DAYOFWEEK(Var_Resultado_Pr)=7 AND Par_SabadoHabil='S') THEN
				SET Var_DiasTrancurridos:=Var_DiasTrancurridos+1;
			END IF;
 		END WHILE;
 	
		SET Resultado:= Var_Resultado_Pr;
	END ManejoErrores;	
END TerminaStore$$;
