icm -ComputerName serverA.acme.com,serverB.acme.com -ScriptBlock{ 


Add-Type -assembly "system.io.compression.filesystem"; 
$webApps = gc -Path "C:\temp\applications.txt"

foreach($app in $webApps)
        {
            Write-Output "Creating zip files from application: $app"
            [io.compression.zipfile]::CreateFromDirectory("D:\WebApplications\$app",".D:\BackUp\$app.zip")
        } 
}
