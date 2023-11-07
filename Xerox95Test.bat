@echo off
powershell.exe -command

$Folder = "c:\temp\print"

Write-Host "Checking if Temp folder exists" -ForegroundColor Green
if (Test-Path -Path $Folder) 
{
    Write-host "folder exists"
}
else
{
    Write-Host "Creating Folder"
    New-Item -Path "c:\temp\" -Name "print" -ItemType "directory"
}


#Log File Path
$LogPath = 'c:\temp\PrinterInstallLog.txt'

#Start Logging to a Text File
$ErrorActionPreference="SilentlyContinue"
Stop-Transcript | out-null
$ErrorActionPreference = "Continue"
Start-Transcript -path $LogPath -Append:$false


$outpath = "c:\Temp\Print"
$siteUrl = “https://vjtek.sharepoint.com/sites/ITSupport”
$fileUrl = “/sites/ITSupport/Printers/Scripts/Install_Xerox95_IP_SharePointTest.ps1”
$localPath = “C:\temp\print\”

#downloads the file from the URL
Import-Module SharePointPnPPowerShellOnline
Connect-PnPOnline -Url $siteUrl -UseWebLogin
Get-PnPFile -Url $fileUrl -Path $localPath -AsFile))"