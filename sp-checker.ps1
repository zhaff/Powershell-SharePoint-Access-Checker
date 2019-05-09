#region Settings - UPDATE YOUR SETTINGS HERE

# Enter your username here
$Username = "username"

# Enter your password here 
$Password = "password"

# Enter folder to save the logs files 
$LogsFolder = "C:\sp-checker\logs" 

# Enter excel file that contains the URLs
$URLsFile = "C:\sp-checker\SiteCollectionList.csv" 

#endregion Variables

#region Credentials 
[SecureString]$SecurePass = ConvertTo-SecureString $Password -AsPlainText -Force 
[System.Management.Automation.PSCredential]$PSCredentials = New-Object System.Management.Automation.PSCredential($Username, $SecurePass) 
#endregion Credentials

$siteUrls = New-Object System.Collections.ArrayList
Import-Csv "$URLsFile" |
ForEach-Object {
    $siteUrls.Add($_.SiteUrl);
}

$dt = Get-Date

foreach($siteUrl in $siteUrls){

    $filename = $siteUrl.replace("/","_").replace(":","_")

    Start-Transcript -Path "$LogsFolder\$filename.txt"

    write-host

    write-host "DateTime: $dt.ToUniversalTime()"
    write-host "URL: $siteUrl"
    write-host

    #$cred = get-credential
    Connect-PnPOnline -Url $siteUrl -Credentials $PSCredentials


    $web = Get-PnPWeb -Includes RoleAssignments

    write-host	"#################################"
    write-host	"## Site Permission List:"
    write-host	"#################################"
    write-host

    $no = 1

    foreach($ra in $web.RoleAssignments) {
        $member = $ra.Member
        $loginName = get-pnpproperty -ClientObject $member -Property LoginName
        $rolebindings = get-pnpproperty -ClientObject $ra -Property RoleDefinitionBindings
    
        write-host "$no. $($loginName) - $($rolebindings.Name)"

        $no = $no + 1;

        #write-host $members

        $members = get-pnpproperty -ClientObject $ra -Property Member
        
        if ($($ra.Member.PrincipalType)) {

            if ($($ra.Member.PrincipalType.ToString()) -eq "SharePointGroup") {
                write-host
                Get-PnPGroupMembers -Identity "$loginName"
                write-host
           }
        }

    }

    write-host	"#################################"
    write-host	"## Site Collection Admin:"
    write-host	"#################################"
    write-host
    Get-PnPSiteCollectionAdmin

    Stop-Transcript
}