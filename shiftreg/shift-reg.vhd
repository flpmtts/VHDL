--UFSC - CTC - Eng Eletronica
--INE5406 - Sistemas Digitais 2018.1
--Gustavo Simas da Silva

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY shiftreg IS
 PORT ( R : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		carga, serial, clk : IN STD_LOGIC;
		Q : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0) );
END shiftreg ;

ARCHITECTURE estrutura OF shiftreg IS

COMPONENT muxffd
PORT 	( D0, D1, sel, clk : IN STD_LOGIC;
		Q : OUT STD_LOGIC );
END COMPONENT;
 
BEGIN
	estagio3: muxffd PORT MAP ( serial, R(3), carga, clk, Q(3) );
	estagio2: muxffd PORT MAP ( Q(3), R(2), carga, clk, Q(2) );
	estagio1: muxffd PORT MAP ( Q(2), R(1), carga, clk, Q(1) );
	estagio0: muxffd PORT MAP ( Q(1), R(0), carga, clk, Q(0) );
END estrutura;