@echo off
set xv_path=J:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xsim sim_checker_behav -key {Behavioral:sim_1:Functional:sim_checker} -tclbatch sim_checker.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
