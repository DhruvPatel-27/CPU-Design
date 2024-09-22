LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;
USE IEEE.NUMERIC_STD.all;
ENTITY ALU3 IS 
PORT (Clock: IN STD_LOGIC;
		A, B: IN UNSIGNED(7 DOWNTO 0);
		student_id: IN UNSIGNED(3 DOWNTO 0);
		OP: IN UNSIGNED(15 DOWNTO 0);
		Neg: OUT STD_LOGIC;
		Ans: OUT UNSIGNED(3 DOWNTO 0));
		
END ALU3;

ARCHITECTURE calculation of ALU3 IS 
SIGNAL Reg1, Reg2, Result: UNSIGNED(7 DOWNTO 0):= (OTHERS =>'0');
SIGNAL Reg4: UNSIGNED (0 TO 7);
BEGIN

Reg1 <= A;
Reg2 <= B;

PROCESS(Clock, OP)
BEGIN
CASE OP IS
	WHEN "0000000000000001" => 
	if (Reg1(3 downto 0) = student_id) then 
		Result <= "00000001";
	elsif (Reg1(7 downto 4) = student_id) then
		Result <= "00000001";
	else 
		Result <= "00000000";
	end if;
	
	WHEN "0000000000000010" =>
	if (Reg1(3 downto 0) = student_id) then 
		Result <= "00000001";
	elsif (Reg1(7 downto 4) = student_id) then
		Result <= "00000001";
	else 
		Result <= "00000000";
	end if;
	
	
	WHEN "0000000000000100" =>
	if (Reg1(3 downto 0) = student_id) then 
		Result <= "00000001";
	elsif (Reg1(7 downto 4) = student_id) then
		Result <= "00000001";
	else 
		Result <= "00000000";
	end if;
	
	WHEN "0000000000001000" =>
	if (Reg1(3 downto 0) = student_id) then 
		Result <= "00000001";
	elsif (Reg1(7 downto 4) = student_id) then
		Result <= "00000001";
	else 
		Result <= "00000000";
	end if;
	
	WHEN "0000000000010000" =>
	if (Reg1(3 downto 0) = student_id) then 
		Result <= "00000001";
	elsif (Reg1(7 downto 4) = student_id) then
		Result <= "00000001";
	else 
		Result <= "00000000";
	end if;
	
	WHEN "0000000000100000" =>
	if (Reg1(3 downto 0) = student_id) then 
		Result <= "00000001";
	elsif (Reg1(7 downto 4) = student_id) then
		Result <= "00000001";
	else 
		Result <= "00000000";
	end if;
	
	WHEN "0000000001000000" =>
	if (Reg1(3 downto 0) = student_id) then 
		Result <= "00000001";
	elsif (Reg1(7 downto 4) = student_id) then
		Result <= "00000001";
	else 
		Result <= "00000000";
	end if;
	
	WHEN "0000000010000000" =>
	if (Reg1(3 downto 0) = student_id) then 
		Result <= "00000001";
	elsif (Reg1(7 downto 4) = student_id) then
		Result <= "00000001";
	else 
		Result <= "00000000";
	end if;
	
	WHEN "0000000100000000" =>
	if (Reg1(3 downto 0) = student_id) then 
		Result <= "00000001";
	elsif (Reg1(7 downto 4) = student_id) then
		Result <= "00000001";
	else 
		Result <= "00000000";
	end if;
	
	WHEN OTHERS =>
	Result <= "--------";
	
	END CASE;
END PROCESS;

Ans <= Result(3 downto 0);

END calculation;