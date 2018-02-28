
$apps = gc -Path "C:\temp\applicationName"

#Connect to each server on -ComputerName and execute ScriptBlock for each one
Invoke-Command -ComputerName serverA.acme.com, serverB.acme.com -ScriptBlock{
    #Go through all web applications and stop each one
    foreach ($app in $apps){
        Import-Module WebAdministration
        #Start / Stop web application
        Stop-WebAppPool -Name $app  -Passthru
        #Start-WebAppPool -Name $app -Passthru

        #Get an application pool
        #Get-WebApplication -Name MyAppPool
    }
}