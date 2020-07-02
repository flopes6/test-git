REM ### Copia arquivos de senhas do KeePass
robocopy "\\vbrp-s3000.camshafts.local\home$\lopfer\BKP\Password databases" "%USERPROFILE%\Documents\Password databases" /E /PURGE

REM ### Copia arquivos do Remote Desktop Connection Manager
robocopy "\\vbrp-s3000.camshafts.local\home$\lopfer\BKP\Remote Desktop Connection Manager" "%USERPROFILE%\Documents\Remote Desktop Connection Manager" /E /PURGE

REM ### Copia configurações do SuperPuTTY
robocopy "\\vbrp-s3000.camshafts.local\home$\lopfer\BKP\SuperPuTTY" "%USERPROFILE%\Documents\SuperPuTTY" /E /PURGE
xcopy /z /f /y "\\vbrp-s3000.camshafts.local\home$\lopfer\BKP\SuperPuTTY.settings" "%USERPROFILE%"

REM ### Copia os favoritos do Internet Explorer
robocopy "\\vbrp-s3000.camshafts.local\home$\lopfer\BKP\Favorites" "%USERPROFILE%\Favorites" /E /PURGE

REM ### Exporta as chaves SSH do PuTTY
reg.exe import \\vbrp-s3000.camshafts.local\home$\lopfer\BKP\PuTTY_SshHostKeys.reg

REM ### Procurar por lopfer e alterar para o usuário que está restaurando as configurações
"C:\Program Files\Notepad++\notepad++.exe" %USERPROFILE%\SuperPuTTY.settings