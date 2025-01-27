--UFSC - CTC - Eng Eletronica
--INE5406 - Sistemas Digitais 2018.1
--Gustavo Simas da Silva

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ffDv2 IS
PORT 	( D, clk, limpa : IN STD_LOGIC;
		Q, NQ : OUT STD_LOGIC);
END ffDv2;

ARCHITECTURE comportamento OF ffDv2 IS
BEGIN
	PROCESS (clk, limpa)
	BEGIN
		IF limpa='1' THEN
			Q <= '0'; NQ <= '1';
		ELSIF clk'EVENT AND clk = '1' THEN
			Q <= D; NQ <= not D;
		END IF;
	END PROCESS;
END comportamento;