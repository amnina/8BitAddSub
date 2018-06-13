library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity ics_adder is
Port ( X : in STD_LOGIC_VECTOR (7 downto 0);
Y : in STD_LOGIC_VECTOR (7 downto 0);
Cin : in STD_LOGIC; --always 0
S : out STD_LOGIC_VECTOR (7 downto 0);
Cout : out STD_LOGIC
);

end ics_adder;
 
architecture Behavioral of ics_adder is
 
component cl_adder
Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
B : in STD_LOGIC_VECTOR(3 downto 0);
Cin : in STD_LOGIC;
S : out STD_LOGIC_VECTOR(3 downto 0);
Cout : out STD_LOGIC;
Cx: out STD_LOGIC 
);
end component;
 
component mux2_1
port(
A,B : in STD_LOGIC;
Sel: in STD_LOGIC;
Z: out STD_LOGIC
);
end component;
 
signal M, N: STD_LOGIC_VECTOR( 3 DOWNTO 0) := "0000"; --M and N are temp values for S
signal C0,C1, C: STD_LOGIC :='0'; --these are the carry out that needs to be chosen
signal V, v1, v2: STD_LOGIC:='0'; --these are the overflow values that needs to be chosen from
signal Cx0, Cx1, Cx2: STD_LOGIC; -- these values are needed to calculate overflow

begin
 --must match Port in entity
--the first 4 bits
CL0: cl_adder PORT MAP	(X(3 downto 0), 
										Y(3 downto 0),
										'0', 
										S(3 downto 0),
										C, 
										Cx0);

--for the 2nd 4 bits, need to select between these two										
CL1: cl_adder PORT MAP	(X(7 downto 4),
										Y(7 downto 4),
										'0',
										M(3 downto 0),
										C0, Cx1);
										
CL2: cl_adder PORT MAP	(X(7 downto 4),
										Y(7 downto 4),
										'1',
										N(3 downto 0),
										C1, Cx2);

--Muxes for Sum
MUX1: mux2_1 PORT MAP(M(0),N(0),C,S(4));
MUX2: mux2_1 PORT MAP(M(1),N(1),C,S(5));
MUX3: mux2_1 PORT MAP(M(2),N(2),C,S(6));
MUX4: mux2_1 PORT MAP(M(3),N(3),C,S(7));
 
--Mux for Carry Out
MUX5: mux2_1 PORT MAP(C0,C1,C,Cout); 

--Detect overflow
v1 <= (C0 XOR Cx1);
v2 <= (C1 XOR Cx2);
--Mux for Overflow detection
MUX6: mux2_1 PORT MAP(v1, v2, C, V);

end Behavioral;