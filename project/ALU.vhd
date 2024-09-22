LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;
USE IEEE.NUMERIC_STD.all;
ENTITY ALU IS 
PORT (Clock: IN STD_LOGIC;
		A, B: IN UNSIGNED(7 DOWNTO 0);
		student_id: IN UNSIGNED(3 DOWNTO 0);
		OP: IN UNSIGNED(15 DOWNTO 0);
		Neg: OUT STD_LOGIC;
		R1: OUT UNSIGNED(3 DOWNTO 0);
		R2: OUT UNSIGNED(3 DOWNTO 0));
		
END ALU;

ARCHITECTURE calculation of ALU IS 
SIGNAL Reg1, Reg2, Result: UNSIGNED(7 DOWNTO 0):= (OTHERS =>'0');
SIGNAL Reg4: UNSIGNED (0 TO 7);
BEGIN

Reg1 <= A;
Reg2 <= B;

PROCESS(Clock, OP)
BEGIN
CASE OP IS
	WHEN "0000000000000001" => 
	Result <= Reg1 + Reg2;
	Neg<='0';
	
	WHEN "0000000000000010" =>
	Result<= (Reg1-Reg2);
	if (Reg2>Reg1) then
			Result<= Reg2 - Reg1;
			Neg<='1';
	end if;
	
	
	WHEN "0000000000000100" =>
	Result <= NOT Reg1;
	Neg<='0';
	
	WHEN "0000000000001000" =>
	Result <= NOT (Reg1 AND Reg2);
	Neg<='0';
	
	WHEN "0000000000010000" =>
	Result <= NOT (Reg1 OR Reg2);
	Neg<='0';
	
	WHEN "0000000000100000" =>
	Result <= (Reg1 AND Reg2);
	Neg<='0';
	
	WHEN "0000000001000000" =>
	Result <= (Reg1 OR Reg2);
	Neg<='0';

	WHEN "0000000010000000" =>
	Result <= (Reg1 XOR Reg2);
	Neg<='0';
	
	WHEN "0000000100000000" =>
	Result <= (Reg1 XNOR Reg2);
	Neg<='0';
	
	WHEN OTHERS =>
	Result <= "--------";
	
	END CASE;
END PROCESS;

R1 <= Result(3 DOWNTO 0);
R2 <= Result(7 DOWNTO 4);

END calculation;