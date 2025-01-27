LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY memram01 IS
   PORT(
      reset, clock, mem_en, wr_en, carga_reg : IN STD_LOGIC ;
      data_out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
      dbg_cont : OUT STD_LOGIC_VECTOR (2 DOWNTO 0));
END memram01;

ARCHITECTURE structural OF memram01 IS   
   COMPONENT contnb IS
      PORT ( R : IN INTEGER RANGE 0 TO 7;
		clk, limpa , carga : IN STD_LOGIC;
		Q : BUFFER INTEGER RANGE 0 TO 7 );
   END COMPONENT;

   COMPONENT ram1port
      PORT
		(
			aclr		: IN STD_LOGIC  := '0';
			address		: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
			clken		: IN STD_LOGIC  := '1';
			clock		: IN STD_LOGIC  := '1';
			data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			wren		: IN STD_LOGIC ;
			q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
   END COMPONENT;

   SIGNAL address : INTEGER RANGE 0 TO 7;
   SIGNAL cont_out : STD_LOGIC_VECTOR (2 DOWNTO 0);
	SIGNAL data_input: STD_LOGIC_VECTOR (7 DOWNTO 0);
	
	BEGIN
   cont_inst : contnb PORT MAP (
      R       	=> 0,
      clk     	=> clock,
      limpa 	=> reset,
      carga 	=> carga_reg,
      Q       	=> address
   );
   
   PROCESS (address)
   BEGIN
      cont_out <= conv_std_logic_vector(address, 3);
		data_input <= conv_std_logic_vector(address, 8);
      -- DBG
      dbg_cont <= conv_std_logic_vector(address, 3);
   END PROCESS;   
   
   ram1port_inst : ram1port PORT MAP (
      aclr		=> '0',
      address  => cont_out,
      clken    => mem_en,
      clock    => clock,
      data     => data_input,
      wren     => wr_en,
      q        => data_out
   );

END structural;