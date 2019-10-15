@echo off
set xv_path=C:\\Xilinx\\xuchen\\Vivado\\2016.2\\bin
call %xv_path%/xsim decoder_behav -key {Behavioral:sim_1:Functional:decoder} -tclbatch decoder.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
