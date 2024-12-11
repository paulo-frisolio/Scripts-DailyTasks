Connect-MgGraph -Scopes "AuditLog.Read.All", "Directory.Read.All"

Get-MgUser -All -Property Id, UserPrincipalName, DisplayName, SignInActivity | Select Id, UserPrincipalName, DisplayName, @{n="LastSignInDateTime";e={$_.SignInActivity.LastSignInDateTime}}, @{n="LastNonInteractiveSignInDateTime";e={$_.SignInActivity.LastNonInteractiveSignInDateTime}} | Export-Csv -Path "C:\ScriptsResult\File.csv"
