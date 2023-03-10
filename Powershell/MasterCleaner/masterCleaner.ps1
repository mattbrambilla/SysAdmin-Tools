                                                                                                                                                                                                                                                                                    
#Write-Host –NoNewLine "Hello Comander! Take a seat while I'm working to optimize the system" BackgroundColor White

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

Add-Type -AssemblyName System.Windows.Forms 
$global:balloon = New-Object System.Windows.Forms.NotifyIcon
$path = (Get-Process -id $pid).Path
$balloon.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path) 
$balloon.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Warning 
$balloon.BalloonTipText = 'Take a seat while I''m working to optimize the system (removing shit Apps and lot of other things...).'
$balloon.BalloonTipTitle = "Hello Commander" 
$balloon.Visible = $true 
$balloon.ShowBalloonTip(10000) 

Write-Host "Hello Commander! Hope you're fine, do you need Xbox Suite into your machine?" | Do-Something

$input = read-host "Enter Yes or No"
if ($input -eq 'yes' -or $input -eq 'no'){
Write-Output "Proceed!"
}else{
Write-Output "I don't understand :( / Please only type 'yes' or 'no'."
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