LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY memory IS
  PORT( read_data     : OUT STD_LOGIC_VECTOR( 15 DOWNTO 0 );
        read_address  : IN STD_LOGIC_VECTOR( 7 DOWNTO 0 );
        write_data    : IN STD_LOGIC_VECTOR( 15 DOWNTO 0 ); 
        write_address : IN STD_LOGIC_VECTOR( 7 DOWNTO 0 );
        Memwrite      : IN STD_LOGIC;
        Clock         : IN STD_LOGIC );
  END memory;

ARCHITECTURE behavior OF memory IS
                                  --define new data type for memory array
  TYPE memory_type IS ARRAY ( 0 TO 255 ) OF STD_LOGIC_VECTOR( 15 DOWNTO 0 );
  SIGNAL memory: memory_type;
BEGIN
  -- Read Memory and convert array index to an integer with CONV_INTEGER
  read_data <= memory( CONV_INTEGER( read_address( 7 DOWNTO 0 ) ) ) ;
  PROCESS       --Write Memory?
  BEGIN
    WAIT UNTIL clock 'EVENT AND clock = '1';
    IF ( memwrite = '1' ) THEN
                          --convert array index to an integer with CONV_INTEGER
      memory( CONV_INTEGER( write_address( 7 DOWNTO 0 ) ) ) <= write_data;
    END IF;
  END PROCESS;
END behavior;
