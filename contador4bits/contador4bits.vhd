--UFSC - CTC - Eng Eletronica
--INE5406 - Sistemas Digitais 2018.1
--Gustavo Simas da Silva

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY contador4bits IS
PORT 	( clk, limpa , carga : IN STD_LOGIC;
		Q : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0) );
END contador4bits;

ARCHITECTURE comportamento OF contador4bits IS
	SIGNAL conta : STD_LOGIC_VECTOR (3 DOWNTO 0) ;
BEGIN
	PROCESS (clk, limpa)
	BEGIN
		IF (limpa = '0') THEN
			conta <= "0000";
		ELSIF (clk’EVENT AND clk = '1') THEN
			IF carga = '1' THEN
				conta <= conta + 1;
			ELSE
				conta <= conta;
			END IF;
		END IF;
	END PROCESS;
	Q <= conta;
END comportamento;