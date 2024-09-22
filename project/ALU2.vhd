-- g
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;
USE IEEE.NUMERIC_STD.all;
ENTITY ALU2 IS 
PORT (Clock: IN STD_LOGIC;
		A, B: IN UNSIGNED(7 DOWNTO 0);
		student_id: IN UNSIGNED(3 DOWNTO 0);
		OP: IN UNSIGNED(15 DOWNTO 0);
		Neg: OUT STD_LOGIC;
		R1: OUT UNSIGNED(3 DOWNTO 0);
		R2: OUT UNSIGNED(3 DOWNTO 0));
		
END ALU2;

ARCHITECTURE calculation of ALU2 IS 
SIGNAL Reg1, Reg2, Result: UNSIGNED(7 DOWNTO 0):= (OTHERS =>'0');
SIGNAL Reg4: UNSIGNED (0 TO 7);
BEGIN

Reg1 <= A;
Reg2 <= B;

PROCESS(Clock, OP)
BEGIN
CASE OP IS
	WHEN "0000000000000001" => 
	Result(0)<= Reg1(7);
	Result(1)<= Reg1(6);
	Result(2)<= Reg1(5);
	Result(3)<= Reg1(4);
	Result(4)<= Reg1(3);
	Result(5)<= Reg1(2);
	Result(6)<= Reg1(1);
	Result(7)<= Reg1(0);
	Neg<= '0';
	
	WHEN "0000000000000010" =>
	Result <= Reg1 sll 4;
	Result(0)<= '1';
	Result(1)<= '1';
	Result(2)<= '1';
	Result(3)<= '1';
	
	
	
	WHEN "0000000000000100" =>
	Result(7)<= NOT Reg2(7);
	Result(6)<= NOT Reg2(6);
	Result(5)<= NOT Reg2(5);
	Result(4)<= NOT Reg2(4);
	Result(3)<= Reg2(3);
	Result(2)<= Reg2(2);
	Result(1)<= Reg2(1);
	Result(0)<= Reg2(0);
	
	WHEN "0000000000001000" =>
	if (Reg1 <= Reg2) then
			Result <= Reg1;
	else
		Result <= Reg2;
	end if;
	
	WHEN "0000000000010000" =>
	Result <= (Reg1 + Reg2) + "00000100";
	
	WHEN "0000000000100000" =>
	Result <= Reg1 + "00000011";
	
	WHEN "0000000001000000" =>
	Result(0) <= Reg2(0);
	Result(2) <= Reg2(2);
	Result(4) <= Reg2(4);
	Result(6) <= Reg2(6);
	
	
	WHEN "0000000010000000" =>
	Result <= Reg1 XNOR Reg2;
	
	WHEN "0000000100000000" =>
	Result <= Reg2 ROR 3;
	
	WHEN OTHERS =>
	Result <= "--------";
	
	END CASE;
END PROCESS;

R1 <= Result(3 DOWNTO 0);
R2 <= Result(7 DOWNTO 4);

END calculation;