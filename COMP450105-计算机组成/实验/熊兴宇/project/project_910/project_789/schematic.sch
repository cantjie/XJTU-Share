# File saved with Nlview 6.5.12  2016-01-29 bk=1.3547 VDI=39 GEI=35 GUI=JA:1.6
# 
# non-default properties - (restore without -noprops)
property attrcolor #000000
property attrfontsize 8
property autobundle 1
property backgroundcolor #ffffff
property boxcolor0 #000000
property boxcolor1 #000000
property boxcolor2 #000000
property boxinstcolor #000000
property boxpincolor #000000
property buscolor #008000
property closeenough 5
property createnetattrdsp 2048
property decorate 1
property elidetext 40
property fillcolor1 #ffffcc
property fillcolor2 #dfebf8
property fillcolor3 #f0f0f0
property gatecellname 2
property instattrmax 30
property instdrag 15
property instorder 1
property marksize 12
property maxfontsize 12
property maxzoom 5
property netcolor #19b400
property objecthighlight0 #ff00ff
property objecthighlight1 #ffff00
property objecthighlight2 #00ff00
property objecthighlight3 #ff6666
property objecthighlight4 #0000ff
property objecthighlight5 #ffc800
property objecthighlight7 #00ffff
property objecthighlight8 #ff00ff
property objecthighlight9 #ccccff
property objecthighlight10 #0ead00
property objecthighlight11 #cefc00
property objecthighlight12 #9e2dbe
property objecthighlight13 #ba6a29
property objecthighlight14 #fc0188
property objecthighlight15 #02f990
property objecthighlight16 #f1b0fb
property objecthighlight17 #fec004
property objecthighlight18 #149bff
property objecthighlight19 #eb591b
property overlapcolor #19b400
property pbuscolor #000000
property pbusnamecolor #000000
property pinattrmax 20
property pinorder 2
property pinpermute 0
property portcolor #000000
property portnamecolor #000000
property ripindexfontsize 8
property rippercolor #000000
property rubberbandcolor #000000
property rubberbandfontsize 12
property selectattr 0
property selectionappearance 2
property selectioncolor #0000ff
property sheetheight 44
property sheetwidth 68
property showmarks 1
property shownetname 0
property showpagenumbers 1
property showripindex 4
property timelimit 1
#
module new top work:top:NOFILE -nosplit
load symbol Add1 work:Add1:NOFILE HIERBOX pinBus a input.left [31:0] pinBus b input.left [31:0] pinBus out output.right [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol Add1 work:abstract:NOFILE HIERBOX pinBus a input.left [31:0] pinBus b input.left [31:0] pinBus out output.right [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol SimpleALU work:SimpleALU:NOFILE HIERBOX pin z output.right pinBus a input.left [31:0] pinBus b input.left [31:0] pinBus op input.left [2:0] pinBus y output.right [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol ALUControl work:ALUControl:NOFILE HIERBOX pinBus aluop output.right [3:0] pinBus opcode input.left [5:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol ControlUnit work:ControlUnit:NOFILE HIERBOX pin ALUSrc output.right pin Branch output.right pin Jump output.right pin MemRd output.right pin MemWr output.right pin MemtoReg output.right pin RegDst output.right pin RegWr output.right pinBus opcode input.left [5:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol DataMemory work:DataMemory:NOFILE HIERBOX pin rd input.left pin wr input.left pinBus addr input.left [31:0] pinBus rdata output.right [31:0] pinBus wdata input.left [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol InstructionMemory work:InstructionMemory:NOFILE HIERBOX pinBus addr26 output.right [25:0] pinBus imm16 output.right [15:0] pinBus opcode output.right [5:0] pinBus pc input.left [31:0] pinBus rd output.right [4:0] pinBus rs output.right [4:0] pinBus rt output.right [4:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol Multiplexer work:Multiplexer:NOFILE HIERBOX pin e input.left pinBus a input.left [31:0] pinBus b input.left [31:0] pinBus c output.right [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol Multiplexer work:abstract:NOFILE HIERBOX pin e input.left pinBus a input.left [31:0] pinBus b input.left [31:0] pinBus c output.right [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol ProgramCounter work:ProgramCounter:NOFILE HIERBOX pin clk input.left pinBus addrin input.left [31:0] pinBus addrout output.right [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol RegisterFile work:RegisterFile:NOFILE HIERBOX pin clk input.left pin rdata1 output.right pin rdata2 output.right pin regrst input.left pin regwr input.left pinBus reg1 input.left [4:0] pinBus reg2 input.left [4:0] pinBus wdata input.left [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol RTL_AND0 work AND pin I0 input pin I1 input pin O output fillcolor 1
load symbol RTL_INV0 work INV pin I0 input pin O output fillcolor 1
load symbol RTL_LSHIFT4 work RTL(<<) pin I2 input.left pinBus I0 input.left [31:0] pinBus I1 input.left [31:0] pinBus O output.right [31:0] fillcolor 1
load symbol RTL_MUX9 work MUX pin S input.bot pinBus I0 input.left [31:0] pinBus I1 input.left [31:0] pinBus O output.right [31:0] fillcolor 1
load symbol ShiftUnit work:ShiftUnit:NOFILE HIERBOX pinBus addr26 input.left [25:0] pinBus addr28 output.right [27:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol SignalExtension work:SignalExtension:NOFILE HIERBOX pinBus alua output.right [31:0] pinBus imm16 input.left [15:0] boxcolor 1 fillcolor 2 minwidth 13%
load inst ADD2 Add1 work:abstract:NOFILE -autohide -attr @cell(#000000) Add1 -pinBusAttr a @name a[31:0] -pinBusAttr b @name b[31:0] -pinBusAttr out @name out[31:0] -pg 1 -lvl 8 -y 530
load inst DM DataMemory work:DataMemory:NOFILE -autohide -attr @cell(#000000) DataMemory -pinBusAttr addr @name addr[31:0] -pinBusAttr rdata @name rdata[31:0] -pinBusAttr wdata @name wdata[31:0] -pg 1 -lvl 3 -y 100
load inst SigExt SignalExtension work:SignalExtension:NOFILE -autohide -attr @cell(#000000) SignalExtension -pinBusAttr alua @name alua[31:0] -pinBusAttr imm16 @name imm16[15:0] -pg 1 -lvl 5 -y 390
load inst CU ControlUnit work:ControlUnit:NOFILE -autohide -attr @cell(#000000) ControlUnit -pinAttr ALUSrc @attr n/c -pinAttr MemRd @attr n/c -pinBusAttr opcode @name opcode[5:0] -pg 1 -lvl 2 -y 90
load inst RTL_INV RTL_INV0 work -attr @cell(#000000) RTL_INV -pg 1 -lvl 4 -y 200
load inst RTL_MUX__0 RTL_MUX9 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[31:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[31:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[31:0] -pg 1 -lvl 6 -y 270
load inst ALU1 SimpleALU work:SimpleALU:NOFILE -autohide -attr @cell(#000000) SimpleALU -pinBusAttr a @name a[31:0] -pinBusAttr b @name b[31:0] -pinBusAttr op @name op[2:0] -pinBusAttr y @name y[31:0] -pg 1 -lvl 7 -y 240
load inst IM InstructionMemory work:InstructionMemory:NOFILE -autohide -attr @cell(#000000) InstructionMemory -pinBusAttr addr26 @name addr26[25:0] -pinBusAttr imm16 @name imm16[15:0] -pinBusAttr opcode @name opcode[5:0] -pinBusAttr pc @name pc[31:0] -pinBusAttr rd @name rd[4:0] -pinBusAttr rs @name rs[4:0] -pinBusAttr rt @name rt[4:0] -pinBusAttr rt @attr n/c -pg 1 -lvl 1 -y 330
load inst ALUCU ALUControl work:ALUControl:NOFILE -autohide -attr @cell(#000000) ALUControl -pinBusAttr aluop @name aluop[3:0] -pinBusAttr opcode @name opcode[5:0] -pg 1 -lvl 6 -y 40
load inst RTL_AND RTL_AND0 work -attr @cell(#000000) RTL_AND -pg 1 -lvl 8 -y 180
load inst MUX1 Multiplexer work:Multiplexer:NOFILE -autohide -attr @cell(#000000) Multiplexer -pinBusAttr a @name a[31:0] -pinBusAttr b @name b[31:0] -pinBusAttr c @name c[31:0] -pg 1 -lvl 9 -y 530
load inst RF RegisterFile work:RegisterFile:NOFILE -autohide -attr @cell(#000000) RegisterFile -pinBusAttr reg1 @name reg1[4:0] -pinBusAttr reg2 @name reg2[4:0] -pinBusAttr wdata @name wdata[31:0] -pg 1 -lvl 5 -y 100
load inst MUX2 Multiplexer work:abstract:NOFILE -autohide -attr @cell(#000000) Multiplexer -pinBusAttr a @name a[31:0] -pinBusAttr b @name b[31:0] -pinBusAttr c @name c[31:0] -pg 1 -lvl 10 -y 390
load inst SHL ShiftUnit work:ShiftUnit:NOFILE -autohide -attr @cell(#000000) ShiftUnit -pinBusAttr addr26 @name addr26[25:0] -pinBusAttr addr28 @name addr28[27:0] -pg 1 -lvl 9 -y 340
load inst PC ProgramCounter work:ProgramCounter:NOFILE -autohide -attr @cell(#000000) ProgramCounter -pinBusAttr addrin @name addrin[31:0] -pinBusAttr addrout @name addrout[31:0] -pg 1 -lvl 11 -y 450
load inst RTL_MUX RTL_MUX9 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[31:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[31:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[31:0] -pg 1 -lvl 4 -y 90
load inst ADD1 Add1 work:Add1:NOFILE -autohide -attr @cell(#000000) Add1 -pinBusAttr a @name a[31:0] -pinBusAttr a @attr V=X\"00000004\" -pinBusAttr b @name b[31:0] -pinBusAttr out @name out[31:0] -pg 1 -lvl 12 -y 440
load inst RTL_LSHIFT RTL_LSHIFT4 work -attr @cell(#000000) RTL_LSHIFT -pinBusAttr I0 @name I0[31:0] -pinBusAttr I1 @name I1[31:0] -pinBusAttr I1 @attr V=X\"00000002\" -pinBusAttr O @name O[31:0] -pg 1 -lvl 7 -y 560
load net RTL_LSHIFT_n_18 -attr @rip O[13] -pin ADD2 b[13] -pin RTL_LSHIFT O[13]
load net mux1out[16] -attr @rip c[16] -pin MUX1 c[16] -pin MUX2 b[16]
load net p_0_out[19] -attr @rip O[19] -pin RF wdata[19] -pin RTL_MUX O[19]
load net pcout[16] -attr @rip addrout[16] -pin ADD1 b[16] -pin IM pc[16] -pin PC addrout[16]
load net pcout[4] -attr @rip addrout[4] -pin ADD1 b[4] -pin IM pc[4] -pin PC addrout[4]
load net addr26[14] -attr @rip addr26[14] -pin IM addr26[14] -pin SHL addr26[14]
load net RTL_LSHIFT_n_19 -attr @rip O[12] -pin ADD2 b[12] -pin RTL_LSHIFT O[12]
load net p_0_out[0] -attr @rip O[0] -pin RF wdata[0] -pin RTL_MUX O[0]
load net shlout[21] -attr @rip addr28[21] -pin MUX2 a[21] -pin SHL addr28[21]
load net aluout[31] -attr @rip y[31] -pin ALU1 y[31] -pin DM addr[31] -pin RTL_MUX I1[31]
load net dmout[3] -attr @rip rdata[3] -pin DM rdata[3] -pin RTL_MUX I0[3]
load net aluout[5] -attr @rip y[5] -pin ALU1 y[5] -pin DM addr[5] -pin RTL_MUX I1[5]
load net imm16[14] -attr @rip imm16[14] -pin IM imm16[14] -pin SigExt imm16[14]
load net p_0_out[24] -attr @rip O[24] -pin RF wdata[24] -pin RTL_MUX O[24]
load net add2out[29] -attr @rip out[29] -pin ADD2 out[29] -pin MUX1 b[29]
load net add2out[11] -attr @rip out[11] -pin ADD2 out[11] -pin MUX1 b[11]
load net dmout[21] -attr @rip rdata[21] -pin DM rdata[21] -pin RTL_MUX I0[21]
load net aluout[17] -attr @rip y[17] -pin ALU1 y[17] -pin DM addr[17] -pin RTL_MUX I1[17]
load net mux1out[20] -attr @rip c[20] -pin MUX1 c[20] -pin MUX2 b[20]
load net p_0_out[15] -attr @rip O[15] -pin RF wdata[15] -pin RTL_MUX O[15]
load net pcout[0] -attr @rip addrout[0] -pin ADD1 b[0] -pin IM pc[0] -pin PC addrout[0]
load net addr26[4] -attr @rip addr26[4] -pin IM addr26[4] -pin SHL addr26[4]
load net alub[8] -attr @rip alua[8] -pin RTL_LSHIFT I0[8] -pin RTL_MUX__0 I0[8] -pin SigExt alua[8]
load net add1out[19] -attr @rip out[19] -pin ADD1 out[19] -pin ADD2 a[19] -pin MUX1 a[19]
load net alub[29] -attr @rip alua[29] -pin RTL_LSHIFT I0[29] -pin RTL_MUX__0 I0[29] -pin SigExt alua[29]
load net add2out[3] -attr @rip out[3] -pin ADD2 out[3] -pin MUX1 b[3]
load net RTL_MUX__0_n_30 -attr @rip O[1] -pin ALU1 b[1] -pin RTL_MUX__0 O[1]
load net opcode[0] -attr @rip opcode[0] -pin ALUCU opcode[0] -pin CU opcode[0] -pin IM opcode[0]
load net shlout[17] -attr @rip addr28[17] -pin MUX2 a[17] -pin SHL addr28[17]
load net RTL_AND_n_0 -pin MUX1 e -pin RTL_AND O
netloc RTL_AND_n_0 1 8 1 2390
load net addr26[23] -attr @rip addr26[23] -pin IM addr26[23] -pin SHL addr26[23]
load net RTL_MUX__0_n_31 -attr @rip O[0] -pin ALU1 b[0] -pin RTL_MUX__0 O[0]
load net alub[16] -attr @rip alua[16] -pin RTL_LSHIFT I0[16] -pin RTL_MUX__0 I0[16] -pin SigExt alua[16]
load net pcin[0] -attr @rip c[0] -pin MUX2 c[0] -pin PC addrin[0]
load net pcin[17] -attr @rip c[17] -pin MUX2 c[17] -pin PC addrin[17]
load net add2out[0] -attr @rip out[0] -pin ADD2 out[0] -pin MUX1 b[0]
load net dmout[24] -attr @rip rdata[24] -pin DM rdata[24] -pin RTL_MUX I0[24]
load net imm16[7] -attr @rip imm16[7] -pin IM imm16[7] -pin SigExt imm16[7]
load net mux1out[4] -attr @rip c[4] -pin MUX1 c[4] -pin MUX2 b[4]
load net alub[9] -attr @rip alua[9] -pin RTL_LSHIFT I0[9] -pin RTL_MUX__0 I0[9] -pin SigExt alua[9]
load net add1out[3] -attr @rip out[3] -pin ADD1 out[3] -pin ADD2 a[3] -pin MUX1 a[3]
load net p_0_out[29] -attr @rip O[29] -pin RF wdata[29] -pin RTL_MUX O[29]
load net mux1out[15] -attr @rip c[15] -pin MUX1 c[15] -pin MUX2 b[15]
load net p_0_out[18] -attr @rip O[18] -pin RF wdata[18] -pin RTL_MUX O[18]
load net p_0_out[9] -attr @rip O[9] -pin RF wdata[9] -pin RTL_MUX O[9]
load net addr26[13] -attr @rip addr26[13] -pin IM addr26[13] -pin SHL addr26[13]
load net mux1out[10] -attr @rip c[10] -pin MUX1 c[10] -pin MUX2 b[10]
load net pcin[9] -attr @rip c[9] -pin MUX2 c[9] -pin PC addrin[9]
load net aluout[30] -attr @rip y[30] -pin ALU1 y[30] -pin DM addr[30] -pin RTL_MUX I1[30]
load net pcout[17] -attr @rip addrout[17] -pin ADD1 b[17] -pin IM pc[17] -pin PC addrout[17]
load net pcout[5] -attr @rip addrout[5] -pin ADD1 b[5] -pin IM pc[5] -pin PC addrout[5]
load net add1out[12] -attr @rip out[12] -pin ADD1 out[12] -pin ADD2 a[12] -pin MUX1 a[12]
load net imm16[13] -attr @rip imm16[13] -pin IM imm16[13] -pin SigExt imm16[13]
load net dmout[4] -attr @rip rdata[4] -pin DM rdata[4] -pin RTL_MUX I0[4]
load net add2out[23] -attr @rip out[23] -pin ADD2 out[23] -pin MUX1 b[23]
load net add2out[28] -attr @rip out[28] -pin ADD2 out[28] -pin MUX1 b[28]
load net aluout[6] -attr @rip y[6] -pin ALU1 y[6] -pin DM addr[6] -pin RTL_MUX I1[6]
load net dmout[20] -attr @rip rdata[20] -pin DM rdata[20] -pin RTL_MUX I0[20]
load net alub[5] -attr @rip alua[5] -pin RTL_LSHIFT I0[5] -pin RTL_MUX__0 I0[5] -pin SigExt alua[5]
load net pcout[30] -attr @rip addrout[30] -pin ADD1 b[30] -pin IM pc[30] -pin PC addrout[30]
load net aluout[16] -attr @rip y[16] -pin ALU1 y[16] -pin DM addr[16] -pin RTL_MUX I1[16]
load net add2out[12] -attr @rip out[12] -pin ADD2 out[12] -pin MUX1 b[12]
load net p_0_out[14] -attr @rip O[14] -pin RF wdata[14] -pin RTL_MUX O[14]
load net p_0_out[5] -attr @rip O[5] -pin RF wdata[5] -pin RTL_MUX O[5]
load net alub[11] -attr @rip alua[11] -pin RTL_LSHIFT I0[11] -pin RTL_MUX__0 I0[11] -pin SigExt alua[11]
load net add1out[11] -attr @rip out[11] -pin ADD1 out[11] -pin ADD2 a[11] -pin MUX1 a[11]
load net <const0> -ground -pin ADD1 a[31] -pin ADD1 a[30] -pin ADD1 a[29] -pin ADD1 a[28] -pin ADD1 a[27] -pin ADD1 a[26] -pin ADD1 a[25] -pin ADD1 a[24] -pin ADD1 a[23] -pin ADD1 a[22] -pin ADD1 a[21] -pin ADD1 a[20] -pin ADD1 a[19] -pin ADD1 a[18] -pin ADD1 a[17] -pin ADD1 a[16] -pin ADD1 a[15] -pin ADD1 a[14] -pin ADD1 a[13] -pin ADD1 a[12] -pin ADD1 a[11] -pin ADD1 a[10] -pin ADD1 a[9] -pin ADD1 a[8] -pin ADD1 a[7] -pin ADD1 a[6] -pin ADD1 a[5] -pin ADD1 a[4] -pin ADD1 a[3] -pin ADD1 a[1] -pin ADD1 a[0] -pin ALU1 a[31] -pin ALU1 a[30] -pin ALU1 a[29] -pin ALU1 a[28] -pin ALU1 a[27] -pin ALU1 a[26] -pin ALU1 a[25] -pin ALU1 a[24] -pin ALU1 a[23] -pin ALU1 a[22] -pin ALU1 a[21] -pin ALU1 a[20] -pin ALU1 a[19] -pin ALU1 a[18] -pin ALU1 a[17] -pin ALU1 a[16] -pin ALU1 a[15] -pin ALU1 a[14] -pin ALU1 a[13] -pin ALU1 a[12] -pin ALU1 a[11] -pin ALU1 a[10] -pin ALU1 a[9] -pin ALU1 a[8] -pin ALU1 a[7] -pin ALU1 a[6] -pin ALU1 a[5] -pin ALU1 a[4] -pin ALU1 a[3] -pin ALU1 a[2] -pin ALU1 a[1] -pin DM wdata[31] -pin DM wdata[30] -pin DM wdata[29] -pin DM wdata[28] -pin DM wdata[27] -pin DM wdata[26] -pin DM wdata[25] -pin DM wdata[24] -pin DM wdata[23] -pin DM wdata[22] -pin DM wdata[21] -pin DM wdata[20] -pin DM wdata[19] -pin DM wdata[18] -pin DM wdata[17] -pin DM wdata[16] -pin DM wdata[15] -pin DM wdata[14] -pin DM wdata[13] -pin DM wdata[12] -pin DM wdata[11] -pin DM wdata[10] -pin DM wdata[9] -pin DM wdata[8] -pin DM wdata[7] -pin DM wdata[6] -pin DM wdata[5] -pin DM wdata[4] -pin DM wdata[3] -pin DM wdata[2] -pin DM wdata[1] -pin RF regwr -pin RTL_LSHIFT I1[31] -pin RTL_LSHIFT I1[30] -pin RTL_LSHIFT I1[29] -pin RTL_LSHIFT I1[28] -pin RTL_LSHIFT I1[27] -pin RTL_LSHIFT I1[26] -pin RTL_LSHIFT I1[25] -pin RTL_LSHIFT I1[24] -pin RTL_LSHIFT I1[23] -pin RTL_LSHIFT I1[22] -pin RTL_LSHIFT I1[21] -pin RTL_LSHIFT I1[20] -pin RTL_LSHIFT I1[19] -pin RTL_LSHIFT I1[18] -pin RTL_LSHIFT I1[17] -pin RTL_LSHIFT I1[16] -pin RTL_LSHIFT I1[15] -pin RTL_LSHIFT I1[14] -pin RTL_LSHIFT I1[13] -pin RTL_LSHIFT I1[12] -pin RTL_LSHIFT I1[11] -pin RTL_LSHIFT I1[10] -pin RTL_LSHIFT I1[9] -pin RTL_LSHIFT I1[8] -pin RTL_LSHIFT I1[7] -pin RTL_LSHIFT I1[6] -pin RTL_LSHIFT I1[5] -pin RTL_LSHIFT I1[4] -pin RTL_LSHIFT I1[3] -pin RTL_LSHIFT I1[2] -pin RTL_LSHIFT I1[0] -pin RTL_MUX__0 I1[31] -pin RTL_MUX__0 I1[30] -pin RTL_MUX__0 I1[29] -pin RTL_MUX__0 I1[28] -pin RTL_MUX__0 I1[27] -pin RTL_MUX__0 I1[26] -pin RTL_MUX__0 I1[25] -pin RTL_MUX__0 I1[24] -pin RTL_MUX__0 I1[23] -pin RTL_MUX__0 I1[22] -pin RTL_MUX__0 I1[21] -pin RTL_MUX__0 I1[20] -pin RTL_MUX__0 I1[19] -pin RTL_MUX__0 I1[18] -pin RTL_MUX__0 I1[17] -pin RTL_MUX__0 I1[16] -pin RTL_MUX__0 I1[15] -pin RTL_MUX__0 I1[14] -pin RTL_MUX__0 I1[13] -pin RTL_MUX__0 I1[12] -pin RTL_MUX__0 I1[11] -pin RTL_MUX__0 I1[10] -pin RTL_MUX__0 I1[9] -pin RTL_MUX__0 I1[8] -pin RTL_MUX__0 I1[7] -pin RTL_MUX__0 I1[6] -pin RTL_MUX__0 I1[5] -pin RTL_MUX__0 I1[4] -pin RTL_MUX__0 I1[3] -pin RTL_MUX__0 I1[2] -pin RTL_MUX__0 I1[1]
load net mux1out[21] -attr @rip c[21] -pin MUX1 c[21] -pin MUX2 b[21]
load net pcout[1] -attr @rip addrout[1] -pin ADD1 b[1] -pin IM pc[1] -pin PC addrout[1]
load net opcode[4] -attr @rip opcode[4] -pin ALUCU opcode[4] -pin CU opcode[4] -pin IM opcode[4]
load net add2out[4] -attr @rip out[4] -pin ADD2 out[4] -pin MUX1 b[4]
load net rs[4] -attr @rip rs[4] -pin IM rs[4] -pin RF reg1[4]
load net shlout[18] -attr @rip addr28[18] -pin MUX2 a[18] -pin SHL addr28[18]
load net addr26[24] -attr @rip addr26[24] -pin IM addr26[24] -pin SHL addr26[24]
load net imm16[8] -attr @rip imm16[8] -pin IM imm16[8] -pin SigExt imm16[8]
load net mux1out[14] -attr @rip c[14] -pin MUX1 c[14] -pin MUX2 b[14]
load net mux1out[19] -attr @rip c[19] -pin MUX1 c[19] -pin MUX2 b[19]
load net p_0_out[17] -attr @rip O[17] -pin RF wdata[17] -pin RTL_MUX O[17]
load net pcout[2] -attr @rip addrout[2] -pin ADD1 b[2] -pin IM pc[2] -pin PC addrout[2]
load net addr26[12] -attr @rip addr26[12] -pin IM addr26[12] -pin SHL addr26[12]
load net RTL_MUX__0_n_0 -attr @rip O[31] -pin ALU1 b[31] -pin RTL_MUX__0 O[31]
load net dmout[27] -attr @rip rdata[27] -pin DM rdata[27] -pin RTL_MUX I0[27]
load net RTL_MUX__0_n_1 -attr @rip O[30] -pin ALU1 b[30] -pin RTL_MUX__0 O[30]
load net dmout[30] -attr @rip rdata[30] -pin DM rdata[30] -pin RTL_MUX I0[30]
load net imm16[12] -attr @rip imm16[12] -pin IM imm16[12] -pin SigExt imm16[12]
load net pcin[22] -attr @rip c[22] -pin MUX2 c[22] -pin PC addrin[22]
load net add1out[26] -attr @rip out[26] -pin ADD1 out[26] -pin ADD2 a[26] -pin MUX1 a[26]
load net RTL_MUX__0_n_2 -attr @rip O[29] -pin ALU1 b[29] -pin RTL_MUX__0 O[29]
load net pcout[18] -attr @rip addrout[18] -pin ADD1 b[18] -pin IM pc[18] -pin PC addrout[18]
load net add2out[22] -attr @rip out[22] -pin ADD2 out[22] -pin MUX1 b[22]
load net add1out[13] -attr @rip out[13] -pin ADD1 out[13] -pin ADD2 a[13] -pin MUX1 a[13]
load net RTL_MUX__0_n_3 -attr @rip O[28] -pin ALU1 b[28] -pin RTL_MUX__0 O[28]
load net clk -pin PC clk -pin RF clk -pin RTL_INV I0 -pin RTL_INV O
netloc clk 1 3 8 930 240 1160 460 NJ 460 NJ 460 NJ 460 NJ 460 NJ 480 NJ
load net RTL_MUX__0_n_4 -attr @rip O[27] -pin ALU1 b[27] -pin RTL_MUX__0 O[27]
load net dmout[5] -attr @rip rdata[5] -pin DM rdata[5] -pin RTL_MUX I0[5]
load net RTL_MUX__0_n_5 -attr @rip O[26] -pin ALU1 b[26] -pin RTL_MUX__0 O[26]
load net aluout[7] -attr @rip y[7] -pin ALU1 y[7] -pin DM addr[7] -pin RTL_MUX I1[7]
load net p_0_out[13] -attr @rip O[13] -pin RF wdata[13] -pin RTL_MUX O[13]
load net alub[10] -attr @rip alua[10] -pin RTL_LSHIFT I0[10] -pin RTL_MUX__0 I0[10] -pin SigExt alua[10]
load net alub[6] -attr @rip alua[6] -pin RTL_LSHIFT I0[6] -pin RTL_MUX__0 I0[6] -pin SigExt alua[6]
load net RTL_MUX__0_n_6 -attr @rip O[25] -pin ALU1 b[25] -pin RTL_MUX__0 O[25]
load net dmout[13] -attr @rip rdata[13] -pin DM rdata[13] -pin RTL_MUX I0[13]
load net add1out[10] -attr @rip out[10] -pin ADD1 out[10] -pin ADD2 a[10] -pin MUX1 a[10]
load net add2out[13] -attr @rip out[13] -pin ADD2 out[13] -pin MUX1 b[13]
load net RTL_MUX__0_n_7 -attr @rip O[24] -pin ALU1 b[24] -pin RTL_MUX__0 O[24]
load net dmout[31] -attr @rip rdata[31] -pin DM rdata[31] -pin RTL_MUX I0[31]
load net p_0_out[6] -attr @rip O[6] -pin RF wdata[6] -pin RTL_MUX O[6]
load net alub[27] -attr @rip alua[27] -pin RTL_LSHIFT I0[27] -pin RTL_MUX__0 I0[27] -pin SigExt alua[27]
load net RTL_MUX__0_n_8 -attr @rip O[23] -pin ALU1 b[23] -pin RTL_MUX__0 O[23]
load net opcode[3] -attr @rip opcode[3] -pin ALUCU opcode[3] -pin CU opcode[3] -pin IM opcode[3]
load net RTL_MUX__0_n_9 -attr @rip O[22] -pin ALU1 b[22] -pin RTL_MUX__0 O[22]
load net <const1> -power -pin ADD1 a[2] -pin RTL_LSHIFT I2 -pin RTL_LSHIFT I1[1]
load net alub[0] -attr @rip alua[0] -pin RTL_LSHIFT I0[0] -pin RTL_MUX__0 I0[0] -pin SigExt alua[0]
load net aluout[19] -attr @rip y[19] -pin ALU1 y[19] -pin DM addr[19] -pin RTL_MUX I1[19]
load net mux1out[22] -attr @rip c[22] -pin MUX1 c[22] -pin MUX2 b[22]
load net add2out[5] -attr @rip out[5] -pin ADD2 out[5] -pin MUX1 b[5]
load net opcode[2] -attr @rip opcode[2] -pin ALUCU opcode[2] -pin CU opcode[2] -pin IM opcode[2]
load net addr26[25] -attr @rip addr26[25] -pin IM addr26[25] -pin SHL addr26[25]
load net mux1out[13] -attr @rip c[13] -pin MUX1 c[13] -pin MUX2 b[13]
load net p_0_out[16] -attr @rip O[16] -pin RF wdata[16] -pin RTL_MUX O[16]
load net p_0_out[7] -attr @rip O[7] -pin RF wdata[7] -pin RTL_MUX O[7]
load net addr26[11] -attr @rip addr26[11] -pin IM addr26[11] -pin SHL addr26[11]
load net aluout[23] -attr @rip y[23] -pin ALU1 y[23] -pin DM addr[23] -pin RTL_MUX I1[23]
load net pcin[2] -attr @rip c[2] -pin MUX2 c[2] -pin PC addrin[2]
load net shlout[5] -attr @rip addr28[5] -pin MUX2 a[5] -pin SHL addr28[5]
load net dmout[26] -attr @rip rdata[26] -pin DM rdata[26] -pin RTL_MUX I0[26]
load net pcin[29] -attr @rip c[29] -pin MUX2 c[29] -pin PC addrin[29]
load net pcout[3] -attr @rip addrout[3] -pin ADD1 b[3] -pin IM pc[3] -pin PC addrout[3]
load net imm16[11] -attr @rip imm16[11] -pin IM imm16[11] -pin SigExt imm16[11]
load net pcin[21] -attr @rip c[21] -pin MUX2 c[21] -pin PC addrin[21]
load net add1out[25] -attr @rip out[25] -pin ADD1 out[25] -pin ADD2 a[25] -pin MUX1 a[25]
load net pcout[28] -attr @rip addrout[28] -pin ADD1 b[28] -pin IM pc[28] -pin PC addrout[28]
load net add2out[21] -attr @rip out[21] -pin ADD2 out[21] -pin MUX1 b[21]
load net pcout[25] -attr @rip addrout[25] -pin ADD1 b[25] -pin IM pc[25] -pin PC addrout[25]
load net pcout[19] -attr @rip addrout[19] -pin ADD1 b[19] -pin IM pc[19] -pin PC addrout[19]
load net add1out[14] -attr @rip out[14] -pin ADD1 out[14] -pin ADD2 a[14] -pin MUX1 a[14]
load net p_0_out[12] -attr @rip O[12] -pin RF wdata[12] -pin RTL_MUX O[12]
load net p_0_out[3] -attr @rip O[3] -pin RF wdata[3] -pin RTL_MUX O[3]
load net pcin[30] -attr @rip c[30] -pin MUX2 c[30] -pin PC addrin[30]
load net rd[4] -attr @rip rd[4] -pin IM rd[4] -pin RF reg2[4]
load net dmout[6] -attr @rip rdata[6] -pin DM rdata[6] -pin RTL_MUX I0[6]
load net aluout[8] -attr @rip y[8] -pin ALU1 y[8] -pin DM addr[8] -pin RTL_MUX I1[8]
load net dmout[14] -attr @rip rdata[14] -pin DM rdata[14] -pin RTL_MUX I0[14]
load net add2out[14] -attr @rip out[14] -pin ADD2 out[14] -pin MUX1 b[14]
load net aluout[18] -attr @rip y[18] -pin ALU1 y[18] -pin DM addr[18] -pin RTL_MUX I1[18]
load net alub[28] -attr @rip alua[28] -pin RTL_LSHIFT I0[28] -pin RTL_MUX__0 I0[28] -pin SigExt alua[28]
load net alub[13] -attr @rip alua[13] -pin RTL_LSHIFT I0[13] -pin RTL_MUX__0 I0[13] -pin SigExt alua[13]
load net mux1out[23] -attr @rip c[23] -pin MUX1 c[23] -pin MUX2 b[23]
load net opcode[1] -attr @rip opcode[1] -pin ALUCU opcode[1] -pin CU opcode[1] -pin IM opcode[1]
load net mux1out[12] -attr @rip c[12] -pin MUX1 c[12] -pin MUX2 b[12]
load net add2out[6] -attr @rip out[6] -pin ADD2 out[6] -pin MUX1 b[6]
load net pcin[1] -attr @rip c[1] -pin MUX2 c[1] -pin PC addrin[1]
load net shlout[4] -attr @rip addr28[4] -pin MUX2 a[4] -pin SHL addr28[4]
load net dmout[10] -attr @rip rdata[10] -pin DM rdata[10] -pin RTL_MUX I0[10]
load net p_0_out[8] -attr @rip O[8] -pin RF wdata[8] -pin RTL_MUX O[8]
load net aluout[24] -attr @rip y[24] -pin ALU1 y[24] -pin DM addr[24] -pin RTL_MUX I1[24]
load net RTL_LSHIFT_n_0 -attr @rip O[31] -pin ADD2 b[31] -pin RTL_LSHIFT O[31]
load net imm16[10] -attr @rip imm16[10] -pin IM imm16[10] -pin SigExt imm16[10]
load net RTL_LSHIFT_n_1 -attr @rip O[30] -pin ADD2 b[30] -pin RTL_LSHIFT O[30]
load net add1out[29] -attr @rip out[29] -pin ADD1 out[29] -pin ADD2 a[29] -pin MUX1 a[29] -pin MUX2 a[29]
load net p_0_out[20] -attr @rip O[20] -pin RF wdata[20] -pin RTL_MUX O[20]
load net shlout[10] -attr @rip addr28[10] -pin MUX2 a[10] -pin SHL addr28[10]
load net RTL_LSHIFT_n_2 -attr @rip O[29] -pin ADD2 b[29] -pin RTL_LSHIFT O[29]
load net add2out[20] -attr @rip out[20] -pin ADD2 out[20] -pin MUX1 b[20]
load net pcout[24] -attr @rip addrout[24] -pin ADD1 b[24] -pin IM pc[24] -pin PC addrout[24]
load net RTL_LSHIFT_n_3 -attr @rip O[28] -pin ADD2 b[28] -pin RTL_LSHIFT O[28]
load net dmout[29] -attr @rip rdata[29] -pin DM rdata[29] -pin RTL_MUX I0[29]
load net pcout[29] -attr @rip addrout[29] -pin ADD1 b[29] -pin IM pc[29] -pin PC addrout[29]
load net RTL_LSHIFT_n_4 -attr @rip O[27] -pin ADD2 b[27] -pin RTL_LSHIFT O[27]
load net pcin[24] -attr @rip c[24] -pin MUX2 c[24] -pin PC addrin[24]
load net rd[3] -attr @rip rd[3] -pin IM rd[3] -pin RF reg2[3]
load net RTL_LSHIFT_n_5 -attr @rip O[26] -pin ADD2 b[26] -pin RTL_LSHIFT O[26]
load net add1out[28] -attr @rip out[28] -pin ADD1 out[28] -pin ADD2 a[28] -pin MUX1 a[28] -pin MUX2 a[28]
load net pcout[8] -attr @rip addrout[8] -pin ADD1 b[8] -pin IM pc[8] -pin PC addrout[8]
load net add1out[15] -attr @rip out[15] -pin ADD1 out[15] -pin ADD2 a[15] -pin MUX1 a[15]
load net MemRd -pin CU MemtoReg -pin DM rd -pin DM wr
netloc MemRd 1 2 1 550
load net RTL_LSHIFT_n_6 -attr @rip O[25] -pin ADD2 b[25] -pin RTL_LSHIFT O[25]
load net p_0_out[4] -attr @rip O[4] -pin RF wdata[4] -pin RTL_MUX O[4]
load net pcin[31] -attr @rip c[31] -pin MUX2 c[31] -pin PC addrin[31]
load net aluout[20] -attr @rip y[20] -pin ALU1 y[20] -pin DM addr[20] -pin RTL_MUX I1[20]
load net RTL_LSHIFT_n_7 -attr @rip O[24] -pin ADD2 b[24] -pin RTL_LSHIFT O[24]
load net alub[25] -attr @rip alua[25] -pin RTL_LSHIFT I0[25] -pin RTL_MUX__0 I0[25] -pin SigExt alua[25]
load net dmout[7] -attr @rip rdata[7] -pin DM rdata[7] -pin RTL_MUX I0[7]
load net RTL_LSHIFT_n_8 -attr @rip O[23] -pin ADD2 b[23] -pin RTL_LSHIFT O[23]
load net aluout[9] -attr @rip y[9] -pin ALU1 y[9] -pin DM addr[9] -pin RTL_MUX I1[9]
load net alub[12] -attr @rip alua[12] -pin RTL_LSHIFT I0[12] -pin RTL_MUX__0 I0[12] -pin SigExt alua[12]
load net RTL_LSHIFT_n_9 -attr @rip O[22] -pin ADD2 b[22] -pin RTL_LSHIFT O[22]
load net dmout[15] -attr @rip rdata[15] -pin DM rdata[15] -pin RTL_MUX I0[15]
load net mux1out[0] -attr @rip c[0] -pin MUX1 c[0] -pin MUX2 b[0]
load net opcode[5] -attr @rip opcode[5] -pin ALUCU opcode[5] -pin CU opcode[5] -pin IM opcode[5]
load net p_0_out[25] -attr @rip O[25] -pin RF wdata[25] -pin RTL_MUX O[25]
load net pcin[20] -attr @rip c[20] -pin MUX2 c[20] -pin PC addrin[20]
load net add1out[1] -attr @rip out[1] -pin ADD1 out[1] -pin ADD2 a[1] -pin MUX1 a[1]
load net mux1out[11] -attr @rip c[11] -pin MUX1 c[11] -pin MUX2 b[11]
load net mux1out[24] -attr @rip c[24] -pin MUX1 c[24] -pin MUX2 b[24]
load net aluout[21] -attr @rip y[21] -pin ALU1 y[21] -pin DM addr[21] -pin RTL_MUX I1[21]
load net shlout[3] -attr @rip addr28[3] -pin MUX2 a[3] -pin SHL addr28[3]
load net mux1out[31] -attr @rip c[31] -pin MUX1 c[31] -pin MUX2 b[31]
load net add2out[7] -attr @rip out[7] -pin ADD2 out[7] -pin MUX1 b[7]
load net pcin[14] -attr @rip c[14] -pin MUX2 c[14] -pin PC addrin[14]
load net dmout[11] -attr @rip rdata[11] -pin DM rdata[11] -pin RTL_MUX I0[11]
load net pcout[10] -attr @rip addrout[10] -pin ADD1 b[10] -pin IM pc[10] -pin PC addrout[10]
load net addr26[7] -attr @rip addr26[7] -pin IM addr26[7] -pin SHL addr26[7]
load net pcin[4] -attr @rip c[4] -pin MUX2 c[4] -pin PC addrin[4]
load net dmout[28] -attr @rip rdata[28] -pin DM rdata[28] -pin RTL_MUX I0[28]
load net pcin[23] -attr @rip c[23] -pin MUX2 c[23] -pin PC addrin[23]
load net ALUSrc -pin CU MemWr -pin RTL_MUX__0 S
netloc ALUSrc 1 2 4 530 320 NJ 320 NJ 320 NJ
load net add1out[27] -attr @rip out[27] -pin ADD1 out[27] -pin ADD2 a[27] -pin MUX1 a[27]
load net alub[19] -attr @rip alua[19] -pin RTL_LSHIFT I0[19] -pin RTL_MUX__0 I0[19] -pin SigExt alua[19]
load net pcout[27] -attr @rip addrout[27] -pin ADD1 b[27] -pin IM pc[27] -pin PC addrout[27]
load net mux1out[7] -attr @rip c[7] -pin MUX1 c[7] -pin MUX2 b[7]
load net pcin[10] -attr @rip c[10] -pin MUX2 c[10] -pin PC addrin[10]
load net pcout[9] -attr @rip addrout[9] -pin ADD1 b[9] -pin IM pc[9] -pin PC addrout[9]
load net alub[26] -attr @rip alua[26] -pin RTL_LSHIFT I0[26] -pin RTL_MUX__0 I0[26] -pin SigExt alua[26]
load net dmout[8] -attr @rip rdata[8] -pin DM rdata[8] -pin RTL_MUX I0[8]
load net add2out[27] -attr @rip out[27] -pin ADD2 out[27] -pin MUX1 b[27]
load net dmout[16] -attr @rip rdata[16] -pin DM rdata[16] -pin RTL_MUX I0[16]
load net mux1out[1] -attr @rip c[1] -pin MUX1 c[1] -pin MUX2 b[1]
load net p_0_out[26] -attr @rip O[26] -pin RF wdata[26] -pin RTL_MUX O[26]
load net shlout[2] -attr @rip addr28[2] -pin MUX2 a[2] -pin SHL addr28[2]
load net add1out[2] -attr @rip out[2] -pin ADD1 out[2] -pin ADD2 a[2] -pin MUX1 a[2]
load net mux1out[25] -attr @rip c[25] -pin MUX1 c[25] -pin MUX2 b[25]
load net mux1out[30] -attr @rip c[30] -pin MUX1 c[30] -pin MUX2 b[30]
load net addr26[10] -attr @rip addr26[10] -pin IM addr26[10] -pin SHL addr26[10]
load net aluout[22] -attr @rip y[22] -pin ALU1 y[22] -pin DM addr[22] -pin RTL_MUX I1[22]
load net add1out[22] -attr @rip out[22] -pin ADD1 out[22] -pin ADD2 a[22] -pin MUX1 a[22]
load net addr26[6] -attr @rip addr26[6] -pin IM addr26[6] -pin SHL addr26[6]
load net add2out[8] -attr @rip out[8] -pin ADD2 out[8] -pin MUX1 b[8]
load net pcin[15] -attr @rip c[15] -pin MUX2 c[15] -pin PC addrin[15]
load net pcin[3] -attr @rip c[3] -pin MUX2 c[3] -pin PC addrin[3]
load net dmout[12] -attr @rip rdata[12] -pin DM rdata[12] -pin RTL_MUX I0[12]
load net imm16[5] -attr @rip imm16[5] -pin IM imm16[5] -pin SigExt imm16[5]
load net pcout[11] -attr @rip addrout[11] -pin ADD1 b[11] -pin IM pc[11] -pin PC addrout[11]
load net add1out[30] -attr @rip out[30] -pin ADD1 out[30] -pin ADD2 a[30] -pin MUX1 a[30] -pin MUX2 a[30]
load net shlout[19] -attr @rip addr28[19] -pin MUX2 a[19] -pin SHL addr28[19]
load net pcout[6] -attr @rip addrout[6] -pin ADD1 b[6] -pin IM pc[6] -pin PC addrout[6]
load net alub[18] -attr @rip alua[18] -pin RTL_LSHIFT I0[18] -pin RTL_MUX__0 I0[18] -pin SigExt alua[18]
load net aluout[0] -attr @rip y[0] -pin ALU1 y[0] -pin DM addr[0] -pin RTL_MUX I1[0]
load net pcout[26] -attr @rip addrout[26] -pin ADD1 b[26] -pin IM pc[26] -pin PC addrout[26]
load net alub[23] -attr @rip alua[23] -pin RTL_LSHIFT I0[23] -pin RTL_MUX__0 I0[23] -pin SigExt alua[23]
load net mux1out[6] -attr @rip c[6] -pin MUX1 c[6] -pin MUX2 b[6]
load net pcin[26] -attr @rip c[26] -pin MUX2 c[26] -pin PC addrin[26]
load net pcin[11] -attr @rip c[11] -pin MUX2 c[11] -pin PC addrin[11]
load net add2out[26] -attr @rip out[26] -pin ADD2 out[26] -pin MUX1 b[26]
load net imm16[1] -attr @rip imm16[1] -pin IM imm16[1] -pin SigExt imm16[1]
load net alub[3] -attr @rip alua[3] -pin RTL_LSHIFT I0[3] -pin RTL_MUX__0 I0[3] -pin SigExt alua[3]
load net dmout[9] -attr @rip rdata[9] -pin DM rdata[9] -pin RTL_MUX I0[9]
load net add1out[9] -attr @rip out[9] -pin ADD1 out[9] -pin ADD2 a[9] -pin MUX1 a[9]
load net dmout[17] -attr @rip rdata[17] -pin DM rdata[17] -pin RTL_MUX I0[17]
load net addr26[19] -attr @rip addr26[19] -pin IM addr26[19] -pin SHL addr26[19]
load net p_0_out[27] -attr @rip O[27] -pin RF wdata[27] -pin RTL_MUX O[27]
load net pcin[12] -attr @rip c[12] -pin MUX2 c[12] -pin PC addrin[12]
load net add1out[21] -attr @rip out[21] -pin ADD1 out[21] -pin ADD2 a[21] -pin MUX1 a[21]
load net mux1out[26] -attr @rip c[26] -pin MUX1 c[26] -pin MUX2 b[26]
load net pcout[21] -attr @rip addrout[21] -pin ADD1 b[21] -pin IM pc[21] -pin PC addrout[21]
load net rs[2] -attr @rip rs[2] -pin IM rs[2] -pin RF reg1[2]
load net alub[31] -attr @rip alua[31] -pin RTL_LSHIFT I0[31] -pin RTL_MUX__0 I0[31] -pin SigExt alua[31]
load net add2out[9] -attr @rip out[9] -pin ADD2 out[9] -pin MUX1 b[9]
load net rd[0] -attr @rip rd[0] -pin IM rd[0] -pin RF reg2[0]
load net imm16[6] -attr @rip imm16[6] -pin IM imm16[6] -pin SigExt imm16[6]
load net pcout[12] -attr @rip addrout[12] -pin ADD1 b[12] -pin IM pc[12] -pin PC addrout[12]
load net shlout[27] -attr @rip addr28[27] -pin MUX2 a[27] -pin SHL addr28[27]
load net add1out[31] -attr @rip out[31] -pin ADD1 out[31] -pin ADD2 a[31] -pin MUX1 a[31] -pin MUX2 a[31]
load net addr26[9] -attr @rip addr26[9] -pin IM addr26[9] -pin SHL addr26[9]
load net aluout[27] -attr @rip y[27] -pin ALU1 y[27] -pin DM addr[27] -pin RTL_MUX I1[27]
load net pcin[6] -attr @rip c[6] -pin MUX2 c[6] -pin PC addrin[6]
load net pcout[7] -attr @rip addrout[7] -pin ADD1 b[7] -pin IM pc[7] -pin PC addrout[7]
load net shlout[6] -attr @rip addr28[6] -pin MUX2 a[6] -pin SHL addr28[6]
load net aluout[1] -attr @rip y[1] -pin ALU1 y[1] -pin DM addr[1] -pin RTL_MUX I1[1]
load net add2out[30] -attr @rip out[30] -pin ADD2 out[30] -pin MUX1 b[30]
load net pcin[25] -attr @rip c[25] -pin MUX2 c[25] -pin PC addrin[25]
load net alub[24] -attr @rip alua[24] -pin RTL_LSHIFT I0[24] -pin RTL_MUX__0 I0[24] -pin SigExt alua[24]
load net add2out[25] -attr @rip out[25] -pin ADD2 out[25] -pin MUX1 b[25]
load net mux1out[9] -attr @rip c[9] -pin MUX1 c[9] -pin MUX2 b[9]
load net add1out[8] -attr @rip out[8] -pin ADD1 out[8] -pin ADD2 a[8] -pin MUX1 a[8]
load net aluout[13] -attr @rip y[13] -pin ALU1 y[13] -pin DM addr[13] -pin RTL_MUX I1[13]
load net imm16[2] -attr @rip imm16[2] -pin IM imm16[2] -pin SigExt imm16[2]
load net p_0_out[11] -attr @rip O[11] -pin RF wdata[11] -pin RTL_MUX O[11]
load net alub[4] -attr @rip alua[4] -pin RTL_LSHIFT I0[4] -pin RTL_MUX__0 I0[4] -pin SigExt alua[4]
load net aluop[2] -attr @rip aluop[2] -pin ALU1 op[2] -pin ALUCU aluop[2]
load net add1out[0] -attr @rip out[0] -pin ADD1 out[0] -pin ADD2 a[0] -pin MUX1 a[0]
load net addr26[18] -attr @rip addr26[18] -pin IM addr26[18] -pin SHL addr26[18]
load net z -pin ALU1 z -pin RTL_AND I1
netloc z 1 7 1 2160
load net dmout[18] -attr @rip rdata[18] -pin DM rdata[18] -pin RTL_MUX I0[18]
load net p_0_out[28] -attr @rip O[28] -pin RF wdata[28] -pin RTL_MUX O[28]
load net pcin[13] -attr @rip c[13] -pin MUX2 c[13] -pin PC addrin[13]
load net pcout[20] -attr @rip addrout[20] -pin ADD1 b[20] -pin IM pc[20] -pin PC addrout[20]
load net add2out[15] -attr @rip out[15] -pin ADD2 out[15] -pin MUX1 b[15]
load net alub[30] -attr @rip alua[30] -pin RTL_LSHIFT I0[30] -pin RTL_MUX__0 I0[30] -pin SigExt alua[30]
load net RegDst -pin CU Jump -pin RF regrst
netloc RegDst 1 2 3 NJ 50 NJ 30 1240
load net imm16[3] -attr @rip imm16[3] -pin IM imm16[3] -pin SigExt imm16[3]
load net mux1out[27] -attr @rip c[27] -pin MUX1 c[27] -pin MUX2 b[27]
load net rs[3] -attr @rip rs[3] -pin IM rs[3] -pin RF reg1[3]
load net add1out[24] -attr @rip out[24] -pin ADD1 out[24] -pin ADD2 a[24] -pin MUX1 a[24]
load net shlout[26] -attr @rip addr28[26] -pin MUX2 a[26] -pin SHL addr28[26]
load net addr26[8] -attr @rip addr26[8] -pin IM addr26[8] -pin SHL addr26[8]
load net pcin[5] -attr @rip c[5] -pin MUX2 c[5] -pin PC addrin[5]
load net alub[21] -attr @rip alua[21] -pin RTL_LSHIFT I0[21] -pin RTL_MUX__0 I0[21] -pin SigExt alua[21]
load net add2out[10] -attr @rip out[10] -pin ADD2 out[10] -pin MUX1 b[10]
load net pcout[13] -attr @rip addrout[13] -pin ADD1 b[13] -pin IM pc[13] -pin PC addrout[13]
load net aluout[28] -attr @rip y[28] -pin ALU1 y[28] -pin DM addr[28] -pin RTL_MUX I1[28]
load net Branch -pin CU RegDst -pin RTL_AND I0
netloc Branch 1 2 6 510 280 NJ 280 NJ 280 NJ 170 NJ 170 NJ
load net dmout[0] -attr @rip rdata[0] -pin DM rdata[0] -pin RTL_MUX I0[0]
load net shlout[14] -attr @rip addr28[14] -pin MUX2 a[14] -pin SHL addr28[14]
load net shlout[7] -attr @rip addr28[7] -pin MUX2 a[7] -pin SHL addr28[7]
load net add2out[31] -attr @rip out[31] -pin ADD2 out[31] -pin MUX1 b[31]
load net add2out[24] -attr @rip out[24] -pin ADD2 out[24] -pin MUX1 b[24]
load net aluout[2] -attr @rip y[2] -pin ALU1 y[2] -pin DM addr[2] -pin RTL_MUX I1[2]
load net Jump -pin CU RegWr -pin MUX2 e
netloc Jump 1 2 8 490 440 NJ 440 NJ 440 NJ 440 NJ 440 NJ 440 NJ 440 NJ
load net alub[1] -attr @rip alua[1] -pin RTL_LSHIFT I0[1] -pin RTL_MUX__0 I0[1] -pin SigExt alua[1]
load net mux1out[8] -attr @rip c[8] -pin MUX1 c[8] -pin MUX2 b[8]
load net p_0_out[21] -attr @rip O[21] -pin RF wdata[21] -pin RTL_MUX O[21]
load net add1out[7] -attr @rip out[7] -pin ADD1 out[7] -pin ADD2 a[7] -pin MUX1 a[7]
load net aluout[12] -attr @rip y[12] -pin ALU1 y[12] -pin DM addr[12] -pin RTL_MUX I1[12]
load net p_0_out[10] -attr @rip O[10] -pin RF wdata[10] -pin RTL_MUX O[10]
load net p_0_out[1] -attr @rip O[1] -pin RF wdata[1] -pin RTL_MUX O[1]
load net pcin[28] -attr @rip c[28] -pin MUX2 c[28] -pin PC addrin[28]
load net shlout[22] -attr @rip addr28[22] -pin MUX2 a[22] -pin SHL addr28[22]
load net addr26[17] -attr @rip addr26[17] -pin IM addr26[17] -pin SHL addr26[17]
load net aluout[29] -attr @rip y[29] -pin ALU1 y[29] -pin DM addr[29] -pin RTL_MUX I1[29]
load net add1out[16] -attr @rip out[16] -pin ADD1 out[16] -pin ADD2 a[16] -pin MUX1 a[16]
load net addr26[3] -attr @rip addr26[3] -pin IM addr26[3] -pin SHL addr26[3]
load net dmout[19] -attr @rip rdata[19] -pin DM rdata[19] -pin RTL_MUX I0[19]
load net rdata1 -attr @rip 0 -pin ALU1 a[0] -pin RF rdata1
netloc rdata1 1 5 2 1540 210 NJ
load net rs[0] -attr @rip rs[0] -pin IM rs[0] -pin RF reg1[0]
load net addr26[20] -attr @rip addr26[20] -pin IM addr26[20] -pin SHL addr26[20]
load net add2out[19] -attr @rip out[19] -pin ADD2 out[19] -pin MUX1 b[19]
load net rdata2 -attr @rip 0 -pin DM wdata[0] -pin RF rdata2 -pin RTL_MUX__0 I1[0]
netloc rdata2 1 2 4 590 260 NJ 260 NJ 260 1480
load net RTL_LSHIFT_n_30 -attr @rip O[1] -pin ADD2 b[1] -pin RTL_LSHIFT O[1]
load net add2out[16] -attr @rip out[16] -pin ADD2 out[16] -pin MUX1 b[16]
load net addr26[0] -attr @rip addr26[0] -pin IM addr26[0] -pin SHL addr26[0]
load net add1out[23] -attr @rip out[23] -pin ADD1 out[23] -pin ADD2 a[23] -pin MUX1 a[23]
load net imm16[4] -attr @rip imm16[4] -pin IM imm16[4] -pin SigExt imm16[4]
load net mux1out[28] -attr @rip c[28] -pin MUX1 c[28] -pin MUX2 b[28]
load net p_0_out[31] -attr @rip O[31] -pin RF wdata[31] -pin RTL_MUX O[31]
load net shlout[25] -attr @rip addr28[25] -pin MUX2 a[25] -pin SHL addr28[25]
load net RTL_LSHIFT_n_31 -attr @rip O[0] -pin ADD2 b[0] -pin RTL_LSHIFT O[0]
load net alub[15] -attr @rip alua[15] -pin RTL_LSHIFT I0[15] -pin RTL_MUX__0 I0[15] -pin SigExt alua[15]
load net aluout[25] -attr @rip y[25] -pin ALU1 y[25] -pin DM addr[25] -pin RTL_MUX I1[25]
load net pcout[23] -attr @rip addrout[23] -pin ADD1 b[23] -pin IM pc[23] -pin PC addrout[23]
load net add1out[20] -attr @rip out[20] -pin ADD1 out[20] -pin ADD2 a[20] -pin MUX1 a[20]
load net dmout[23] -attr @rip rdata[23] -pin DM rdata[23] -pin RTL_MUX I0[23]
load net mux1out[3] -attr @rip c[3] -pin MUX1 c[3] -pin MUX2 b[3]
load net pcin[18] -attr @rip c[18] -pin MUX2 c[18] -pin PC addrin[18]
load net rd[2] -attr @rip rd[2] -pin IM rd[2] -pin RF reg2[2]
load net alub[22] -attr @rip alua[22] -pin RTL_LSHIFT I0[22] -pin RTL_MUX__0 I0[22] -pin SigExt alua[22]
load net pcout[14] -attr @rip addrout[14] -pin ADD1 b[14] -pin IM pc[14] -pin PC addrout[14]
load net shlout[13] -attr @rip addr28[13] -pin MUX2 a[13] -pin SHL addr28[13]
load net pcin[8] -attr @rip c[8] -pin MUX2 c[8] -pin PC addrin[8]
load net dmout[1] -attr @rip rdata[1] -pin DM rdata[1] -pin RTL_MUX I0[1]
load net shlout[8] -attr @rip addr28[8] -pin MUX2 a[8] -pin SHL addr28[8]
load net add1out[6] -attr @rip out[6] -pin ADD1 out[6] -pin ADD2 a[6] -pin MUX1 a[6]
load net aluout[3] -attr @rip y[3] -pin ALU1 y[3] -pin DM addr[3] -pin RTL_MUX I1[3]
load net imm16[0] -attr @rip imm16[0] -pin IM imm16[0] -pin SigExt imm16[0]
load net pcin[27] -attr @rip c[27] -pin MUX2 c[27] -pin PC addrin[27]
load net aluop[0] -attr @rip aluop[0] -pin ALU1 op[0] -pin ALUCU aluop[0]
load net alub[2] -attr @rip alua[2] -pin RTL_LSHIFT I0[2] -pin RTL_MUX__0 I0[2] -pin SigExt alua[2]
load net mux1out[18] -attr @rip c[18] -pin MUX1 c[18] -pin MUX2 b[18]
load net p_0_out[22] -attr @rip O[22] -pin RF wdata[22] -pin RTL_MUX O[22]
load net addr26[16] -attr @rip addr26[16] -pin IM addr26[16] -pin SHL addr26[16]
load net p_0_out[2] -attr @rip O[2] -pin RF wdata[2] -pin RTL_MUX O[2]
load net shlout[23] -attr @rip addr28[23] -pin MUX2 a[23] -pin SHL addr28[23]
load net RTL_MUX__0_n_20 -attr @rip O[11] -pin ALU1 b[11] -pin RTL_MUX__0 O[11]
load net RTL_MUX__0_n_21 -attr @rip O[10] -pin ALU1 b[10] -pin RTL_MUX__0 O[10]
load net aluout[15] -attr @rip y[15] -pin ALU1 y[15] -pin DM addr[15] -pin RTL_MUX I1[15]
load net RTL_MUX__0_n_22 -attr @rip O[9] -pin ALU1 b[9] -pin RTL_MUX__0 O[9]
load net addr26[2] -attr @rip addr26[2] -pin IM addr26[2] -pin SHL addr26[2]
load net pcout[31] -attr @rip addrout[31] -pin ADD1 b[31] -pin IM pc[31] -pin PC addrout[31]
load net RTL_MUX__0_n_23 -attr @rip O[8] -pin ALU1 b[8] -pin RTL_MUX__0 O[8]
load net add1out[17] -attr @rip out[17] -pin ADD1 out[17] -pin ADD2 a[17] -pin MUX1 a[17]
load net RTL_MUX__0_n_24 -attr @rip O[7] -pin ALU1 b[7] -pin RTL_MUX__0 O[7]
load net rs[1] -attr @rip rs[1] -pin IM rs[1] -pin RF reg1[1]
load net shlout[15] -attr @rip addr28[15] -pin MUX2 a[15] -pin SHL addr28[15]
load net RTL_MUX__0_n_25 -attr @rip O[6] -pin ALU1 b[6] -pin RTL_MUX__0 O[6]
load net addr26[21] -attr @rip addr26[21] -pin IM addr26[21] -pin SHL addr26[21]
load net RTL_LSHIFT_n_20 -attr @rip O[11] -pin ADD2 b[11] -pin RTL_LSHIFT O[11]
load net p_0_out[30] -attr @rip O[30] -pin RF wdata[30] -pin RTL_MUX O[30]
load net shlout[24] -attr @rip addr28[24] -pin MUX2 a[24] -pin SHL addr28[24]
load net RTL_MUX__0_n_26 -attr @rip O[5] -pin ALU1 b[5] -pin RTL_MUX__0 O[5]
load net RTL_LSHIFT_n_21 -attr @rip O[10] -pin ADD2 b[10] -pin RTL_LSHIFT O[10]
load net alub[14] -attr @rip alua[14] -pin RTL_LSHIFT I0[14] -pin RTL_MUX__0 I0[14] -pin SigExt alua[14]
load net pcout[22] -attr @rip addrout[22] -pin ADD1 b[22] -pin IM pc[22] -pin PC addrout[22]
load net shlout[1] -attr @rip addr28[1] -pin MUX2 a[1] -pin SHL addr28[1]
load net RTL_MUX__0_n_27 -attr @rip O[4] -pin ALU1 b[4] -pin RTL_MUX__0 O[4]
load net add2out[17] -attr @rip out[17] -pin ADD2 out[17] -pin MUX1 b[17]
load net addr26[1] -attr @rip addr26[1] -pin IM addr26[1] -pin SHL addr26[1]
load net RTL_LSHIFT_n_22 -attr @rip O[9] -pin ADD2 b[9] -pin RTL_LSHIFT O[9]
load net dmout[22] -attr @rip rdata[22] -pin DM rdata[22] -pin RTL_MUX I0[22]
load net mux1out[29] -attr @rip c[29] -pin MUX1 c[29] -pin MUX2 b[29]
load net mux1out[2] -attr @rip c[2] -pin MUX1 c[2] -pin MUX2 b[2]
load net RTL_MUX__0_n_28 -attr @rip O[3] -pin ALU1 b[3] -pin RTL_MUX__0 O[3]
load net aluout[11] -attr @rip y[11] -pin ALU1 y[11] -pin DM addr[11] -pin RTL_MUX I1[11]
load net RTL_LSHIFT_n_23 -attr @rip O[8] -pin ADD2 b[8] -pin RTL_LSHIFT O[8]
load net aluout[26] -attr @rip y[26] -pin ALU1 y[26] -pin DM addr[26] -pin RTL_MUX I1[26]
load net rd[1] -attr @rip rd[1] -pin IM rd[1] -pin RF reg2[1]
load net RTL_MUX__0_n_29 -attr @rip O[2] -pin ALU1 b[2] -pin RTL_MUX__0 O[2]
load net RTL_LSHIFT_n_24 -attr @rip O[7] -pin ADD2 b[7] -pin RTL_LSHIFT O[7]
load net shlout[12] -attr @rip addr28[12] -pin MUX2 a[12] -pin SHL addr28[12]
load net RTL_LSHIFT_n_25 -attr @rip O[6] -pin ADD2 b[6] -pin RTL_LSHIFT O[6]
load net pcin[19] -attr @rip c[19] -pin MUX2 c[19] -pin PC addrin[19]
load net pcin[7] -attr @rip c[7] -pin MUX2 c[7] -pin PC addrin[7]
load net MemtoReg -pin CU Branch -pin RTL_MUX S
netloc MemtoReg 1 2 2 510 30 NJ
load net RTL_LSHIFT_n_26 -attr @rip O[5] -pin ADD2 b[5] -pin RTL_LSHIFT O[5]
load net imm16[9] -attr @rip imm16[9] -pin IM imm16[9] -pin SigExt imm16[9]
load net pcout[15] -attr @rip addrout[15] -pin ADD1 b[15] -pin IM pc[15] -pin PC addrout[15]
load net add1out[5] -attr @rip out[5] -pin ADD1 out[5] -pin ADD2 a[5] -pin MUX1 a[5]
load net RTL_LSHIFT_n_27 -attr @rip O[4] -pin ADD2 b[4] -pin RTL_LSHIFT O[4]
load net shlout[20] -attr @rip addr28[20] -pin MUX2 a[20] -pin SHL addr28[20]
load net RTL_LSHIFT_n_28 -attr @rip O[3] -pin ADD2 b[3] -pin RTL_LSHIFT O[3]
load net dmout[2] -attr @rip rdata[2] -pin DM rdata[2] -pin RTL_MUX I0[2]
load net mux1out[17] -attr @rip c[17] -pin MUX1 c[17] -pin MUX2 b[17]
load net shlout[9] -attr @rip addr28[9] -pin MUX2 a[9] -pin SHL addr28[9]
load net addr26[15] -attr @rip addr26[15] -pin IM addr26[15] -pin SHL addr26[15]
load net RTL_LSHIFT_n_29 -attr @rip O[2] -pin ADD2 b[2] -pin RTL_LSHIFT O[2]
load net aluout[4] -attr @rip y[4] -pin ALU1 y[4] -pin DM addr[4] -pin RTL_MUX I1[4]
load net RTL_MUX__0_n_10 -attr @rip O[21] -pin ALU1 b[21] -pin RTL_MUX__0 O[21]
load net aluop[1] -attr @rip aluop[1] -pin ALU1 op[1] -pin ALUCU aluop[1]
load net p_0_out[23] -attr @rip O[23] -pin RF wdata[23] -pin RTL_MUX O[23]
load net RTL_MUX__0_n_11 -attr @rip O[20] -pin ALU1 b[20] -pin RTL_MUX__0 O[20]
load net aluout[14] -attr @rip y[14] -pin ALU1 y[14] -pin DM addr[14] -pin RTL_MUX I1[14]
load net imm16[15] -attr @rip imm16[15] -pin IM imm16[15] -pin SigExt imm16[15]
load net RTL_MUX__0_n_12 -attr @rip O[19] -pin ALU1 b[19] -pin RTL_MUX__0 O[19]
load net RTL_MUX__0_n_13 -attr @rip O[18] -pin ALU1 b[18] -pin RTL_MUX__0 O[18]
load net alub[7] -attr @rip alua[7] -pin RTL_LSHIFT I0[7] -pin RTL_MUX__0 I0[7] -pin SigExt alua[7]
load net RTL_MUX__0_n_14 -attr @rip O[17] -pin ALU1 b[17] -pin RTL_MUX__0 O[17]
load net RTL_LSHIFT_n_10 -attr @rip O[21] -pin ADD2 b[21] -pin RTL_LSHIFT O[21]
load net add1out[18] -attr @rip out[18] -pin ADD1 out[18] -pin ADD2 a[18] -pin MUX1 a[18]
load net RTL_MUX__0_n_15 -attr @rip O[16] -pin ALU1 b[16] -pin RTL_MUX__0 O[16]
load net RTL_LSHIFT_n_11 -attr @rip O[20] -pin ADD2 b[20] -pin RTL_LSHIFT O[20]
load net add2out[2] -attr @rip out[2] -pin ADD2 out[2] -pin MUX1 b[2]
load net addr26[5] -attr @rip addr26[5] -pin IM addr26[5] -pin SHL addr26[5]
load net RTL_MUX__0_n_16 -attr @rip O[15] -pin ALU1 b[15] -pin RTL_MUX__0 O[15]
load net shlout[0] -attr @rip addr28[0] -pin MUX2 a[0] -pin SHL addr28[0]
load net shlout[16] -attr @rip addr28[16] -pin MUX2 a[16] -pin SHL addr28[16]
load net RTL_LSHIFT_n_12 -attr @rip O[19] -pin ADD2 b[19] -pin RTL_LSHIFT O[19]
load net RTL_MUX__0_n_17 -attr @rip O[14] -pin ALU1 b[14] -pin RTL_MUX__0 O[14]
load net addr26[22] -attr @rip addr26[22] -pin IM addr26[22] -pin SHL addr26[22]
load net RTL_LSHIFT_n_13 -attr @rip O[18] -pin ADD2 b[18] -pin RTL_LSHIFT O[18]
load net RTL_MUX__0_n_18 -attr @rip O[13] -pin ALU1 b[13] -pin RTL_MUX__0 O[13]
load net aluout[10] -attr @rip y[10] -pin ALU1 y[10] -pin DM addr[10] -pin RTL_MUX I1[10]
load net pcin[16] -attr @rip c[16] -pin MUX2 c[16] -pin PC addrin[16]
load net alub[20] -attr @rip alua[20] -pin RTL_LSHIFT I0[20] -pin RTL_MUX__0 I0[20] -pin SigExt alua[20]
load net RTL_LSHIFT_n_14 -attr @rip O[17] -pin ADD2 b[17] -pin RTL_LSHIFT O[17]
load net RTL_MUX__0_n_19 -attr @rip O[12] -pin ALU1 b[12] -pin RTL_MUX__0 O[12]
load net add2out[18] -attr @rip out[18] -pin ADD2 out[18] -pin MUX1 b[18]
load net shlout[11] -attr @rip addr28[11] -pin MUX2 a[11] -pin SHL addr28[11]
load net RTL_LSHIFT_n_15 -attr @rip O[16] -pin ADD2 b[16] -pin RTL_LSHIFT O[16]
load net alub[17] -attr @rip alua[17] -pin RTL_LSHIFT I0[17] -pin RTL_MUX__0 I0[17] -pin SigExt alua[17]
load net RTL_LSHIFT_n_16 -attr @rip O[15] -pin ADD2 b[15] -pin RTL_LSHIFT O[15]
load net add2out[1] -attr @rip out[1] -pin ADD2 out[1] -pin MUX1 b[1]
load net dmout[25] -attr @rip rdata[25] -pin DM rdata[25] -pin RTL_MUX I0[25]
load net mux1out[5] -attr @rip c[5] -pin MUX1 c[5] -pin MUX2 b[5]
load net RTL_LSHIFT_n_17 -attr @rip O[14] -pin ADD2 b[14] -pin RTL_LSHIFT O[14]
load net add1out[4] -attr @rip out[4] -pin ADD1 out[4] -pin ADD2 a[4] -pin MUX1 a[4]
load netBundle @pcout 32 pcout[31] pcout[30] pcout[29] pcout[28] pcout[27] pcout[26] pcout[25] pcout[24] pcout[23] pcout[22] pcout[21] pcout[20] pcout[19] pcout[18] pcout[17] pcout[16] pcout[15] pcout[14] pcout[13] pcout[12] pcout[11] pcout[10] pcout[9] pcout[8] pcout[7] pcout[6] pcout[5] pcout[4] pcout[3] pcout[2] pcout[1] pcout[0] -autobundled
netbloc @pcout 1 0 12 20 620 NJ 620 NJ 620 NJ 620 NJ 620 NJ 620 NJ 620 NJ 620 NJ 620 NJ 620 NJ 620 3170
load netBundle @opcode 6 opcode[5] opcode[4] opcode[3] opcode[2] opcode[1] opcode[0] -autobundled
netbloc @opcode 1 1 5 250 240 NJ 240 NJ 160 NJ 50 NJ
load netBundle @RTL_LSHIFT_n_0,RTL_LSHIFT_n_1 32 RTL_LSHIFT_n_0 RTL_LSHIFT_n_1 RTL_LSHIFT_n_2 RTL_LSHIFT_n_3 RTL_LSHIFT_n_4 RTL_LSHIFT_n_5 RTL_LSHIFT_n_6 RTL_LSHIFT_n_7 RTL_LSHIFT_n_8 RTL_LSHIFT_n_9 RTL_LSHIFT_n_10 RTL_LSHIFT_n_11 RTL_LSHIFT_n_12 RTL_LSHIFT_n_13 RTL_LSHIFT_n_14 RTL_LSHIFT_n_15 RTL_LSHIFT_n_16 RTL_LSHIFT_n_17 RTL_LSHIFT_n_18 RTL_LSHIFT_n_19 RTL_LSHIFT_n_20 RTL_LSHIFT_n_21 RTL_LSHIFT_n_22 RTL_LSHIFT_n_23 RTL_LSHIFT_n_24 RTL_LSHIFT_n_25 RTL_LSHIFT_n_26 RTL_LSHIFT_n_27 RTL_LSHIFT_n_28 RTL_LSHIFT_n_29 RTL_LSHIFT_n_30 RTL_LSHIFT_n_31 -autobundled
netbloc @RTL_LSHIFT_n_0,RTL_LSHIFT_n_1 1 7 1 NJ
load netBundle @aluop 3 aluop[2] aluop[1] aluop[0] -autobundled
netbloc @aluop 1 6 1 1850
load netBundle @shlout 28 shlout[27] shlout[26] shlout[25] shlout[24] shlout[23] shlout[22] shlout[21] shlout[20] shlout[19] shlout[18] shlout[17] shlout[16] shlout[15] shlout[14] shlout[13] shlout[12] shlout[11] shlout[10] shlout[9] shlout[8] shlout[7] shlout[6] shlout[5] shlout[4] shlout[3] shlout[2] shlout[1] shlout[0] -autobundled
netbloc @shlout 1 9 1 2670
load netBundle @alub 32 alub[31] alub[30] alub[29] alub[28] alub[27] alub[26] alub[25] alub[24] alub[23] alub[22] alub[21] alub[20] alub[19] alub[18] alub[17] alub[16] alub[15] alub[14] alub[13] alub[12] alub[11] alub[10] alub[9] alub[8] alub[7] alub[6] alub[5] alub[4] alub[3] alub[2] alub[1] alub[0] -autobundled
netbloc @alub 1 5 2 1540 560 NJ
load netBundle @pcin 32 pcin[31] pcin[30] pcin[29] pcin[28] pcin[27] pcin[26] pcin[25] pcin[24] pcin[23] pcin[22] pcin[21] pcin[20] pcin[19] pcin[18] pcin[17] pcin[16] pcin[15] pcin[14] pcin[13] pcin[12] pcin[11] pcin[10] pcin[9] pcin[8] pcin[7] pcin[6] pcin[5] pcin[4] pcin[3] pcin[2] pcin[1] pcin[0] -autobundled
netbloc @pcin 1 10 1 2910
load netBundle @add1out 32 add1out[31] add1out[30] add1out[29] add1out[28] add1out[27] add1out[26] add1out[25] add1out[24] add1out[23] add1out[22] add1out[21] add1out[20] add1out[19] add1out[18] add1out[17] add1out[16] add1out[15] add1out[14] add1out[13] add1out[12] add1out[11] add1out[10] add1out[9] add1out[8] add1out[7] add1out[6] add1out[5] add1out[4] add1out[3] add1out[2] add1out[1] add1out[0] -autobundled
netbloc @add1out 1 7 6 2140 480 2410 480 2670 520 NJ 520 NJ 520 3460
load netBundle @dmout 32 dmout[31] dmout[30] dmout[29] dmout[28] dmout[27] dmout[26] dmout[25] dmout[24] dmout[23] dmout[22] dmout[21] dmout[20] dmout[19] dmout[18] dmout[17] dmout[16] dmout[15] dmout[14] dmout[13] dmout[12] dmout[11] dmout[10] dmout[9] dmout[8] dmout[7] dmout[6] dmout[5] dmout[4] dmout[3] dmout[2] dmout[1] dmout[0] -autobundled
netbloc @dmout 1 3 1 850
load netBundle @rd 5 rd[4] rd[3] rd[2] rd[1] rd[0] -autobundled
netbloc @rd 1 1 4 NJ 400 NJ 400 NJ 400 1180
load netBundle @addr26 26 addr26[25] addr26[24] addr26[23] addr26[22] addr26[21] addr26[20] addr26[19] addr26[18] addr26[17] addr26[16] addr26[15] addr26[14] addr26[13] addr26[12] addr26[11] addr26[10] addr26[9] addr26[8] addr26[7] addr26[6] addr26[5] addr26[4] addr26[3] addr26[2] addr26[1] addr26[0] -autobundled
netbloc @addr26 1 1 8 NJ 340 NJ 340 NJ 340 NJ 340 NJ 350 NJ 350 NJ 350 NJ
load netBundle @imm16 16 imm16[15] imm16[14] imm16[13] imm16[12] imm16[11] imm16[10] imm16[9] imm16[8] imm16[7] imm16[6] imm16[5] imm16[4] imm16[3] imm16[2] imm16[1] imm16[0] -autobundled
netbloc @imm16 1 1 4 NJ 380 NJ 380 NJ 380 NJ
load netBundle @add2out 32 add2out[31] add2out[30] add2out[29] add2out[28] add2out[27] add2out[26] add2out[25] add2out[24] add2out[23] add2out[22] add2out[21] add2out[20] add2out[19] add2out[18] add2out[17] add2out[16] add2out[15] add2out[14] add2out[13] add2out[12] add2out[11] add2out[10] add2out[9] add2out[8] add2out[7] add2out[6] add2out[5] add2out[4] add2out[3] add2out[2] add2out[1] add2out[0] -autobundled
netbloc @add2out 1 8 1 2370
load netBundle @RTL_MUX__0_n_0,RTL_MUX__0_n_1 32 RTL_MUX__0_n_0 RTL_MUX__0_n_1 RTL_MUX__0_n_2 RTL_MUX__0_n_3 RTL_MUX__0_n_4 RTL_MUX__0_n_5 RTL_MUX__0_n_6 RTL_MUX__0_n_7 RTL_MUX__0_n_8 RTL_MUX__0_n_9 RTL_MUX__0_n_10 RTL_MUX__0_n_11 RTL_MUX__0_n_12 RTL_MUX__0_n_13 RTL_MUX__0_n_14 RTL_MUX__0_n_15 RTL_MUX__0_n_16 RTL_MUX__0_n_17 RTL_MUX__0_n_18 RTL_MUX__0_n_19 RTL_MUX__0_n_20 RTL_MUX__0_n_21 RTL_MUX__0_n_22 RTL_MUX__0_n_23 RTL_MUX__0_n_24 RTL_MUX__0_n_25 RTL_MUX__0_n_26 RTL_MUX__0_n_27 RTL_MUX__0_n_28 RTL_MUX__0_n_29 RTL_MUX__0_n_30 RTL_MUX__0_n_31 -autobundled
netbloc @RTL_MUX__0_n_0,RTL_MUX__0_n_1 1 6 1 N
load netBundle @rs 5 rs[4] rs[3] rs[2] rs[1] rs[0] -autobundled
netbloc @rs 1 1 4 NJ 420 NJ 420 NJ 420 1220
load netBundle @mux1out 32 mux1out[31] mux1out[30] mux1out[29] mux1out[28] mux1out[27] mux1out[26] mux1out[25] mux1out[24] mux1out[23] mux1out[22] mux1out[21] mux1out[20] mux1out[19] mux1out[18] mux1out[17] mux1out[16] mux1out[15] mux1out[14] mux1out[13] mux1out[12] mux1out[11] mux1out[10] mux1out[9] mux1out[8] mux1out[7] mux1out[6] mux1out[5] mux1out[4] mux1out[3] mux1out[2] mux1out[1] mux1out[0] -autobundled
netbloc @mux1out 1 9 1 2710
load netBundle @aluout 32 aluout[31] aluout[30] aluout[29] aluout[28] aluout[27] aluout[26] aluout[25] aluout[24] aluout[23] aluout[22] aluout[21] aluout[20] aluout[19] aluout[18] aluout[17] aluout[16] aluout[15] aluout[14] aluout[13] aluout[12] aluout[11] aluout[10] aluout[9] aluout[8] aluout[7] aluout[6] aluout[5] aluout[4] aluout[3] aluout[2] aluout[1] aluout[0] -autobundled
netbloc @aluout 1 2 6 570 220 890 300 NJ 300 NJ 190 NJ 190 2140
load netBundle @p_0_out 32 p_0_out[31] p_0_out[30] p_0_out[29] p_0_out[28] p_0_out[27] p_0_out[26] p_0_out[25] p_0_out[24] p_0_out[23] p_0_out[22] p_0_out[21] p_0_out[20] p_0_out[19] p_0_out[18] p_0_out[17] p_0_out[16] p_0_out[15] p_0_out[14] p_0_out[13] p_0_out[12] p_0_out[11] p_0_out[10] p_0_out[9] p_0_out[8] p_0_out[7] p_0_out[6] p_0_out[5] p_0_out[4] p_0_out[3] p_0_out[2] p_0_out[1] p_0_out[0] -autobundled
netbloc @p_0_out 1 4 1 1200
levelinfo -pg 1 0 90 360 700 1050 1330 1680 2010 2230 2510 2780 3010 3320 3480 -top -10 -bot 630
show
fullfit
#
# initialize ictrl to current module top work:top:NOFILE
ictrl init topinfo |
ictrl layer glayer install
ictrl layer glayer config ibundle 1
ictrl layer glayer config nbundle 0
ictrl layer glayer config pbundle 0
ictrl layer glayer config cache 1
