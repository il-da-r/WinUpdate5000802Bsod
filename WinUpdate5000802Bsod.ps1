#Установка модуля управления обновлениями PSWindowsUpdate
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
install-module -name PSWindowsUpdate
#Временно разрешим выполнение любых скриптов
Set-ExecutionPolicy Unrestricted -Force
Import-module PSWindowsUpdate
#Удалим обновления если есть
Remove-WindowsUpdate -KBArticleID KB5000808
Remove-WindowsUpdate -KBArticleID KB5000822
Remove-WindowsUpdate -KBArticleID KB5000802
#Скроем обновления
$HideList  = "KB5000808", "KB5000822", "KB5000802"
Get-WindowsUpdate -KBArticleID $HideList -Hide
#Закроем выполнение скриптов
Set-ExecutionPolicy Restricted -Force