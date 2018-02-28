#Script to create web application pool
#https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/ee790599(v=technet.10)
#https://www.softwire.com/blog/2014/09/29/configuring-iis-with-powershell/index.html
param (
    [string] $applicationPoolName,
    [string] $applicationPath, 
    [string] $webSite
)

function CreateWebAppPool ($applicationPoolName, $applicationPath, $webSite)
{
Import-Module WebAdministration

#Create web application 
$appPool = New-WebAppPool -Name $applicationPoolName
$appPool.managedRuntimeVersion = '' ## values could be v4.0, v2.0 and ""
$appPool.autoStart = 'true'
$appPool.startmode = 'alwaysrunning'
$appPool.managedPipelineMode = "Integrated"

$website = New-Website -Name "Default Web Site" -PhysicalPath $applicationPath -ApplicationPool ($appPool.Name)

$appPool | Set-Item
}
CreateWebAppPool $applicationPoolName $applicationPath $webSite