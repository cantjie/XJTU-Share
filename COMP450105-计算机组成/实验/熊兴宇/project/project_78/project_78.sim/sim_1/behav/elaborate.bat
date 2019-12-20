@echo off
set xv_path=C:\\Xilinx\\xuchen\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto 4c388791a4e240948a5554cd0b3617d7 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot Sim_Reg_group_behav xil_defaultlib.Sim_Reg_group xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
