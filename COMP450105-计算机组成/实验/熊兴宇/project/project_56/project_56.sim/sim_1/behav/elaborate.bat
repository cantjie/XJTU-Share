@echo off
set xv_path=J:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto 94c4ce6dbfa34ab6befa86b4e0c5c1c3 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot sim_checker_behav xil_defaultlib.sim_checker xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
