<#
    Hello everyone! This script was originally created by alitajran. I have only redistributed it on my repository to help others.
    All rights reserved to alitajran

    .SYNOPSIS
    Get-AuthenticationMethods.ps1

    .DESCRIPTION
    Export users authentication methods report from Micrososoft Graph and know which MFA method
    is set as default for each user and what MFA methods are registered for each user.

    .LINK
    www.alitajran.com/get-mfa-status-entra/

    .NOTES
    Written by: ALI TAJRAN
    Website:    www.alitajran.com
    LinkedIn:   linkedin.com/in/alitajran

    .CHANGELOG
    V1.00, 10/12/2023 - Initial version
#>

# Export path for CSV file
$csvPath = "C:\Temp\AuthenticationReport.csv"

# Connect to Microsoft Graph
Connect-MgGraph -Scopes "User.Read.All", "Group.Read.All", "UserAuthenticationMethod.Read.All", "AuditLog.Read.All"

try {
    # Fetch user registration detail report from Microsoft Graph
    $Users = Get-MgBetaReportAuthenticationMethodUserRegistrationDetail -All

    # Create custom PowerShell object and populate it with the desired properties
    $Report = foreach ($User in $Users) {
        [pscustomobject]@{
            Id                                           = $User.Id
            UserPrincipalName                            = $User.UserPrincipalName
            UserDisplayName                              = $User.UserDisplayName
            IsAdmin                                      = $User.IsAdmin
            DefaultMfaMethod                             = $User.DefaultMfaMethod
            MethodsRegistered                            = $User.MethodsRegistered -join ','
            IsMfaCapable                                 = $User.IsMfaCapable
            IsMfaRegistered                              = $User.IsMfaRegistered
            IsPasswordlessCapable                        = $User.IsPasswordlessCapable
            IsSsprCapable                                = $User.IsSsprCapable
            IsSsprEnabled                                = $User.IsSsprEnabled
            IsSsprRegistered                             = $User.IsSsprRegistered
            IsSystemPreferredAuthenticationMethodEnabled = $User.IsSystemPreferredAuthenticationMethodEnabled
            LastUpdatedDateTime                          = $User.LastUpdatedDateTime
        }
    }
    # Output custom object to GridView
    $Report | Out-GridView -Title "Authentication Methods Report"

    # Export custom object to CSV file
    $Report | Export-Csv -Path $csvPath -NoTypeInformation -Encoding utf8

    Write-Host "Script completed. Report exported successfully to $csvPath" -ForegroundColor Green
}
catch {
    # Catch errors
    Write-Host "An error occurred: $_" -ForegroundColor Red
}