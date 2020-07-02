REM ### Copia arquivos de senhas do KeePass
robocopy "D:\lopfer\Password databases" "D:\lopfer\BKP\Password databases" /E /PURGE

REM ### Copia arquivos do Remote Desktop Connection Manager
robocopy "D:\lopfer\Remote Desktop Connection Manager" "D:\lopfer\BKP\Remote Desktop Connection Manager" /E /PURGE

REM ### Copia configirações do SuperPuTTY
robocopy "C:\Users\lopfer\Documents\SuperPuTTY" "D:\lopfer\BKP\SuperPuTTY" /E /PURGE
xcopy /z /f /y "C:\Users\lopfer\SuperPuTTY.settings" "D:\lopfer\BKP\"

REM ### Copia os favoritos do Internet Explorer
robocopy "C:\Users\lopfer\Favorites" "D:\lopfer\BKP\Favorites" /E /PURGE

REM ### Exporta as chaves SSH do PuTTY
regedit /e D:\lopfer\BKP\PuTTY_SshHostKeys.reg HKEY_CURRENT_USER\Software\SimonTatham

REM ###  Copia o backup para o drive de rede pessoal
robocopy "D:\lopfer\BKP" "M:\BKP" /E /PURGE