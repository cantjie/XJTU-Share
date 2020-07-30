#name "test.cl"
#5 CLASS
#5 TYPEID CellularAutomaton
#5 INHERITS
#5 TYPEID IO
#5 '{'
#6 OBJECTID population_map
#6 ':'
#6 TYPEID String
#6 ';'
#8 OBJECTID init
#8 '('
#8 OBJECTID map
#8 ':'
#8 TYPEID String
#8 ')'
#8 ':'
#8 TYPEID SELF_TYPE
#8 '{'
#9 '{'
#10 OBJECTID population_map
#10 ASSIGN
#10 OBJECTID map
#10 ';'
#11 OBJECTID self
#11 ';'
#12 '}'
#13 '}'
#13 ';'
#15 OBJECTID print
#15 '('
#15 ')'
#15 ':'
#15 TYPEID SELF_TYPE
#15 '{'
#16 '{'
#17 OBJECTID out_string
#17 '('
#17 OBJECTID population_map
#17 '.'
#17 OBJECTID concat
#17 '('
#17 STR_CONST "\n"
#17 ')'
#17 ')'
#17 ';'
#18 OBJECTID self
#18 ';'
#19 '}'
#20 '}'
#20 ';'
#22 OBJECTID num_cells
#22 '('
#22 ')'
#22 ':'
#22 TYPEID Int
#22 '{'
#23 OBJECTID population_map
#23 '.'
#23 OBJECTID length
#23 '('
#23 ')'
#24 '}'
#24 ';'
#26 OBJECTID cell
#26 '('
#26 OBJECTID position
#26 ':'
#26 TYPEID Int
#26 ')'
#26 ':'
#26 TYPEID String
#26 '{'
#27 OBJECTID population_map
#27 '.'
#27 OBJECTID substr
#27 '('
#27 OBJECTID position
#27 ','
#27 INT_CONST 1
#27 ')'
#28 '}'
#28 ';'
#30 OBJECTID cell_left_neighbor
#30 '('
#30 OBJECTID position
#30 ':'
#30 TYPEID Int
#30 ')'
#30 ':'
#30 TYPEID String
#30 '{'
#31 IF
#31 OBJECTID position
#31 '='
#31 INT_CONST 0
#31 THEN
#32 OBJECTID cell
#32 '('
#32 OBJECTID num_cells
#32 '('
#32 ')'
#32 '-'
#32 INT_CONST 1
#32 ')'
#33 ELSE
#34 OBJECTID cell
#34 '('
#34 OBJECTID position
#34 '-'
#34 INT_CONST 1
#34 ')'
#35 FI
#36 '}'
#36 ';'
#38 OBJECTID cell_right_neighbor
#38 '('
#38 OBJECTID position
#38 ':'
#38 TYPEID Int
#38 ')'
#38 ':'
#38 TYPEID String
#38 '{'
#39 IF
#39 OBJECTID position
#39 '='
#39 OBJECTID num_cells
#39 '('
#39 ')'
#39 '-'
#39 INT_CONST 1
#39 THEN
#40 OBJECTID cell
#40 '('
#40 INT_CONST 0
#40 ')'
#41 ELSE
#42 OBJECTID cell
#42 '('
#42 OBJECTID position
#42 '+'
#42 INT_CONST 1
#42 ')'
#43 FI
#44 '}'
#44 ';'
#48 OBJECTID cell_at_next_evolution
#48 '('
#48 OBJECTID position
#48 ':'
#48 TYPEID Int
#48 ')'
#48 ':'
#48 TYPEID String
#48 '{'
#49 IF
#49 '('
#49 IF
#49 OBJECTID cell
#49 '('
#49 OBJECTID position
#49 ')'
#49 '='
#49 STR_CONST "X"
#49 THEN
#49 INT_CONST 1
#49 ELSE
#49 INT_CONST 0
#49 FI
#50 '+'
#50 IF
#50 OBJECTID cell_left_neighbor
#50 '('
#50 OBJECTID position
#50 ')'
#50 '='
#50 STR_CONST "X"
#50 THEN
#50 INT_CONST 1
#50 ELSE
#50 INT_CONST 0
#50 FI
#51 '+'
#51 IF
#51 OBJECTID cell_right_neighbor
#51 '('
#51 OBJECTID position
#51 ')'
#51 '='
#51 STR_CONST "X"
#51 THEN
#51 INT_CONST 1
#51 ELSE
#51 INT_CONST 0
#51 FI
#52 '='
#52 INT_CONST 1
#52 ')'
#53 THEN
#54 STR_CONST "X"
#55 ELSE
#56 ERROR "'"
#56 '.'
#56 ERROR "'"
#57 FI
#58 '}'
#58 ';'
#60 OBJECTID evolve
#60 '('
#60 ')'
#60 ':'
#60 TYPEID SELF_TYPE
#60 '{'
#61 '('
#61 LET
#61 OBJECTID position
#61 ':'
#61 TYPEID Int
#61 IN
#62 '('
#62 LET
#62 OBJECTID num
#62 ':'
#62 TYPEID Int
#62 ASSIGN
#62 OBJECTID num_cells
#62 ERROR "["
#62 ERROR "]"
#62 IN
#63 '('
#63 LET
#63 OBJECTID temp
#63 ':'
#63 TYPEID String
#63 IN
#64 '{'
#65 WHILE
#65 OBJECTID position
#65 '<'
#65 OBJECTID num
#65 LOOP
#66 '{'
#67 OBJECTID temp
#67 ASSIGN
#67 OBJECTID temp
#67 '.'
#67 OBJECTID concat
#67 '('
#67 OBJECTID cell_at_next_evolution
#67 '('
#67 OBJECTID position
#67 ')'
#67 ')'
#67 ';'
#68 OBJECTID position
#68 ASSIGN
#68 OBJECTID position
#68 '+'
#68 INT_CONST 1
#68 ';'
#69 '}'
#70 POOL
#70 ';'
#71 OBJECTID population_map
#71 ASSIGN
#71 OBJECTID temp
#71 ';'
#72 OBJECTID self
#72 ';'
#73 '}'
#74 ')'
#74 ')'
#74 ')'
#75 '}'
#75 ';'
#76 '}'
#76 ';'
#78 CLASS
#78 TYPEID Main
#78 '{'
#79 OBJECTID cells
#79 ':'
#79 TYPEID CellularAutomaton
#79 ';'
#81 OBJECTID main
#81 '('
#81 ')'
#81 ':'
#81 TYPEID SELF_TYPE
#81 '{'
#82 '{'
#83 OBJECTID cells
#83 ASSIGN
#83 '('
#83 NEW
#83 TYPEID CellularAutomaton
#83 ')'
#83 '.'
#83 OBJECTID init
#83 '('
#83 STR_CONST "         X         "
#83 ')'
#83 ';'
#84 OBJECTID cells
#84 '.'
#84 OBJECTID print
#84 '('
#84 ')'
#84 ';'
#85 '('
#85 LET
#85 OBJECTID countdown
#85 ':'
#85 TYPEID Int
#85 ASSIGN
#85 INT_CONST 20
#85 IN
#86 WHILE
#86 OBJECTID countdown
#86 ERROR ">"
#86 INT_CONST 0
#86 LOOP
#87 '{'
#88 OBJECTID cells
#88 '.'
#88 OBJECTID evolve
#88 '('
#88 ')'
#88 ';'
#89 OBJECTID cells
#89 '.'
#89 OBJECTID print
#89 '('
#89 ')'
#89 ';'
#90 OBJECTID countdown
#90 ASSIGN
#90 OBJECTID countdown
#90 '-'
#90 INT_CONST 1
#90 ';'
#92 POOL
#93 ')'
#93 ';'
#98 ERROR "EOF in comment"
