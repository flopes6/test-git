REM ### Instala o KeePass
xcopy /s /z /f /y "\\vbrp-s3700\scripts$\Admin-Tools\KeePass-2.45-Setup.exe" "C:\Temp\"
C:\Temp\KeePass-2.45-Setup.exe /verysilent /norestart
del C:\Temp\KeePass-2.45-Setup.exe

REM ### Instala o PuTTY
xcopy /s /z /f /y "\\vbrp-s3700\scripts$\Admin-Tools\putty-64bit-0.70-installer.msi" "C:\Temp\"
msiexec.exe /i "C:\Temp\putty-64bit-0.70-installer.msi" ALLUSERS=1 /qn /norestart
del "C:\Temp\putty-64bit-0.70-installer.msi"

REM ### Instala o Remote Desktop Connection Manager
xcopy /s /z /f /y "\\vbrp-s3700\scripts$\Admin-Tools\RDCMan2.7.msi" "C:\Temp\"
msiexec.exe /i "C:\Temp\RDCMan2.7.msi" ALLUSERS=1 /qn /norestart
del "C:\Temp\RDCMan2.7.msi"

REM ### Instala o SuperPuTTY
xcopy /s /z /f /y "\\vbrp-s3700\scripts$\Admin-Tools\SuperPuttySetup-v1.4.0.8.msi" "C:\Temp\"
msiexec.exe /i "C:\Temp\SuperPuttySetup-v1.4.0.8.msi" ALLUSERS=1 /qn /norestart
del "C:\Temp\SuperPuttySetup-v1.4.0.8.msi"

REM ### Instala o Microsoft Edge
xcopy /s /z /f /y "\\vbrp-s3700\scripts$\Microsoft-Edge\MicrosoftEdgeEnterpriseX64.msi" "C:\Temp\"
msiexec.exe /i "C:\Temp\MicrosoftEdgeEnterpriseX64.msi" ALLUSERS=1 /qn /norestart
del "C:\Temp\MicrosoftEdgeEnterpriseX64.msi"

REM ### Instala o VMware Remote Console
xcopy /s /z /f /y "\\vbrp-s3700\scripts$\VMware-VMRC\VMware-VMRC-10.0.6-14247266.exe" "C:\Temp\"
C:\Temp\VMware-VMRC-10.0.6-14247266.exe /s /v "/qn EULAS_AGREED=1 AUTOSOFTWAREUPDATE=0 DATACOLLECTION=0"
del "C:\Temp\VMware-VMRC-10.0.6-14247266.exe"

REM ### Instala o Notepad++
xcopy /s /z /f /y "\\vbrp-s3700\scripts$\Notepad++\npp.7.8.5.installer.x64.en-us.msi" "C:\Temp\"
msiexec.exe /i "C:\Temp\npp.7.8.5.installer.x64.en-us.msi" ALLUSERS=1 /qn /norestart
del "C:\Temp\npp.7.8.5.installer.x64.en-us.msi"