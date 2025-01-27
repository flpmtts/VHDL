--UFSC - CTC - Eng Eletronica
--INE5406 - Sistemas Digitais 2018.1
--Gustavo Simas da Silva

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY contnb IS
PORT 	( R : IN INTEGER RANGE 0 TO 15;
		clk, limpa , carga : IN STD_LOGIC;
		Q : BUFFER INTEGER RANGE 0 TO 15 );
END contnb ;

ARCHITECTURE comportamento OF contnb IS
BEGIN
	PROCESS (clk, limpa)
	BEGIN
		IF limpa = '0' THEN
			Q <= 0;
		ELSIF clk'EVENT AND clk = '1' THEN
			IF carga = '1' THEN
				Q <= R;
			ELSE
				Q <= Q + 1;
			END IF;
		END IF;
	END PROCESS;
END comportamento;