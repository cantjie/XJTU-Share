@echo off
set xv_path=C:\\Xilinx\\xuchen\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto 010d18d9020648f0b55f39a676f758e4 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot decoder_behav xil_defaultlib.decoder xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
