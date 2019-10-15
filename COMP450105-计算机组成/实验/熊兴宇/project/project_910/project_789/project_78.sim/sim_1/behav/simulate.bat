@echo off
set xv_path=J:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xsim top_behav -key {Behavioral:sim_1:Functional:top} -tclbatch top.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
