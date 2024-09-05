#Set policy to make this script executable on the system (if you have policy block rule)
           
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

#Preparing content

$username = [System.Environment]::UserName

#Initialize the baloon notification

Add-Type -AssemblyName System.Windows.Forms 
$global:balloon = New-Object System.Windows.Forms.NotifyIcon
$path = (Get-Process -id $pid).Path
$balloon.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path) 
$balloon.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Warning 
$balloon.BalloonTipText = 'I''m working to optimize the system.'
$balloon.BalloonTipTitle = "Hello $username" 
$balloon.Visible = $true 
$balloon.ShowBalloonTip(10000) 

#I need to fix this and show the message to user
Write-Host "Hello $username! Hope you're fine. This script is designed to remove automatically all the Windows bloatware app pre-installed. Do you need Xbox Suite?"

$input = read-host "Enter Yes or No"
if ($input -eq 'yes'){
Write-Output "Proceed!"
}
[else if ($input -eq 'no') {
Write-Output "Ok I'll keep it!"
}
[else {
Write-Output "I don't understand / Please only type 'yes' or 'no'."
}

# Remove Xbox Services

Get-AppxPackage Microsoft.XboxApp | Remove-AppxPackage
Get-AppxPackage Microsoft.XboxGamingOverlay | Remove-AppxPackage
Get-AppxPackage Microsoft.XboxGameOverlay | Remove-AppxPackage
Get-AppxPackage Microsoft.XboxIdentityProvider | Remove-AppxPackage
Get-AppxPackage Microsoft.XboxGameCallableUI | Remove-AppxPackage
Get-AppxPackage Microsoft.XboxSpeechToTextOverlay | Remove-AppxPackage
Get-AppxPackage Microsoft.Xbox.TCUI | Remove-AppxPackage

# Remove Microsoft Maps

Get-AppxPackage Microsoft.WindowsMaps | Remove-AppxPackage

# Remove Microsoft News

Get-AppxPackage Microsoft.BingNews | Remove-AppxPackage

# Remove Microsoft MRPortal

Get-AppxPackage Microsoft.MixedReality.Portal |Remove-AppPackage
Get-AppxPackage Microsoft.3DViewer | Remove-AppxPackage

# Remove Microsoft People

Get-AppxPackage Microsoft.People | Remove-AppxPackage
Get-AppxPackage Microsoft.PeopleExperienceHost | Remove-AppxPackage

#Remove Clipchamp

Get-AppxPackage Clipchamp.Clipchamp | Remove-AppPackage

#Remove Skype

Get-AppxPackage Microsoft.SkypeApp | Remove-AppPackage

–WhatIf