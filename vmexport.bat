@echo off


type nul > vmx.txt

: Set Directories :
set "cdir=%cd%"
set "pdir=C:\Program Files (x86)\VmWare\Vmware Workstation\OVFTool"

set /p folder1=[Please enter your Virtual Machine directory]
set /p folder2=[Please enter the directory you want the OVFs to export to]

cd %folder1%


:Checks each folder (and their subfolders) for vmx files and outputs them to vmx.txt:


dir /s /b *.vmx | findstr .vmx$ >> %cdir%\vmx.txt

cd %pdir%

for /f %%x in (%cdir%\vmx.txt) do ovftool "%%x" "%folder2%"

cd %cdir%
del vmx.txt

echo PROCESS COMPLETE.