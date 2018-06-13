--Nina's VHDL cheat sheet
-- A little note: VHDL is case insensitive


--the libraries
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--entity: the high level design of the body (top module)
entity nina_vhdl is
port (
	A : in STD_LOGIC;
	B : in STD_LOGIC_VECTOR (3 downto 0);
	C : in STD_LOGIC_1164;
	
	D: out STD_LOGIC_VECTOR (0 to 5);
);

end nina_vhdl

--architecture: how this body function
architecture behave of nina_vhdl is
--declaration of components and signals (not a part of the top module) here. 
--the port name in components don't have to match those in entity
--the port name in component must match the name in the other file.

begin

end behave;


