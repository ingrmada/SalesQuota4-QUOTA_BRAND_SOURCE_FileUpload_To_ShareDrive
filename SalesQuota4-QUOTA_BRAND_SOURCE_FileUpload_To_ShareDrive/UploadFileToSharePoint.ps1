#Install-Module SharePointPnPPowerShellOnline

Import-Module SharePointPnPPowerShellOnline

$userName = '_svcPriceBooks@rndc.onmicrosoft.com'
$pass = 'Pa$$word'
$password=$pass|ConvertTo-SecureString -AsPlainText -Force

$credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList ($userName,$password)

Connect-PnPOnline -Url "https://rndc.sharepoint.com/sites/CaliforniaDocuments" -Credentials $credential -WarningAction Ignore  # -UseWebLogin  #

$Files = Get-ChildItem  "\\ymcucdc03.youngsmarket.com\depts\SHARED\Applications-UCIT\SalesQuota\QUOTA_BRAND_SOURCE" #C:\SalesQuota4\QUOTA_BRAND_SOURCE\"   #
$FileCount = $Files.Count

foreach($File in $Files) {

    $File = $Files[1]

 Add-PnpFile -Path $File.FullName -Folder "/Shared Documents/Portfolio Management CA/Quota Data" 

}
