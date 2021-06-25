DELIMITER ;
DROP PROCEDURE IF EXISTS `SP_MAURICIOPRO`;
DELIMITER $$

CREATE PROCEDURE `SP_MAURICIOPRO`(
/* SP para realizar suma de los dias dependiendo si los dias habiles
		son de lunes a viernes o de lunes a sabado
		
		Ejemplo del call "CALL SP_MAURICIOPRO(5, 5, '2021-06-24', ?, ?);"
		
*/
	
	Par_DiasSum					INT(5),	
	Par_DiasHabiles				INT(5),	
	Par_Fecha					DATE,	
	OUT Mensaje					VARCHAR(200),
	OUT Resultado				VARCHAR(200)
	
)
TerminaStore: BEGIN
	-- Declaracion de Variables
	
	DECLARE Fecha_Vacia			DATE;
	DECLARE Entero_Cero			INT(5);
	DECLARE Var_DHabil			INT;
	DECLARE Var_FechaFin		DATE;
	DECLARE Dias 				INT(5);
	DECLARE Resultado_Pr		DATE;

	SET Entero_Cero				:=0;							
	SET	Fecha_Vacia	 		 	:='1900-01-01';
	SET Dias        			:=0;
	
	ManejoErrores: BEGIN 
		
		IF(IFNULL(Par_fecha	, Fecha_Vacia) = Fecha_Vacia) THEN
			SET Mensaje:= 'La fecha esta vacia.';
			LEAVE ManejoErrores;
		END IF;
		
		IF(IFNULL(Par_DiasSum, Entero_Cero) = Entero_Cero) THEN
			SET Mensaje:= 'El campo de dia esta vacio';
			LEAVE ManejoErrores;
		END IF;
	  
		SET Var_FechaFin:=DATE_ADD(Par_Fecha, INTERVAL Par_DiasSum DAY);

		IF Par_DiasHabiles+1=6 THEN	
  			WHILE Par_Fecha<=Var_FechaFin DO
      	  		IF DAYOFWEEK(Par_Fecha) = 1 THEN
      	     		SET Dias=Dias+1;
      	     	ELSEIF DAYOFWEEK(Par_Fecha) = 7 THEN
      	     		SET Dias=Dias+1;
      	  		END IF;

        		SET Par_Fecha=Par_Fecha+INTERVAL 1 day;
    		END WHILE;
    	
    		IF DAYOFWEEK(Var_FechaFin)=7 THEN
    			SET Resultado_Pr:=DATE_ADD(Var_FechaFin, INTERVAL Dias+1 DAY);-- Resultado_Pr
    		ELSE
    			SET Resultado_Pr:=DATE_ADD(Var_FechaFin, INTERVAL Dias DAY);
    		END IF;
    	
    		IF DAYOFWEEK(Resultado_Pr)=1 THEN
    			SET Resultado:=DATE_ADD(Resultado_Pr, INTERVAL 2 DAY);
    		ELSEIF DAYOFWEEK(Resultado_Pr)=7 THEN
    			SET Resultado:=DATE_ADD(Resultado_Pr, INTERVAL 2 DAY);
    		ELSE
    			SET Resultado:=Resultado_Pr;
    		END IF;
    	
    	/*ELSEIF Par_DiasHabiles+1=7 THEN	
  			WHILE Par_Fecha<=Var_FechaFin DO
      	  		IF DAYOFWEEK(Par_Fecha) = 1 THEN
      	     		SET Dias=Dias+1;
      	  		END IF;
				SET Par_Fecha=Par_Fecha+INTERVAL 1 day;
    		END WHILE;
    		IF DAYOFWEEK(Var_FechaFin)=7 THEN
    			SET Resultado_Pr:=DATE_ADD(Var_FechaFin, INTERVAL Dias+1	DAY);
    		ELSE
    			SET Resultado_Pr:=DATE_ADD(Var_FechaFin, INTERVAL Dias	DAY);
    		END IF;*/
		END IF;
	END ManejoErrores;	
END TerminaStore$$;
