@echo off
set xv_path=D:\\Xilinx\\Vivado\\2016.3\\bin
call %xv_path%/xsim CPU_tb_behav -key {Behavioral:sim_1:Functional:CPU_tb} -tclbatch CPU_tb.tcl -view D:/Users/James/Box Sync/School/CMPEN 331/frazier_lab7/Lab6Waveform.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
