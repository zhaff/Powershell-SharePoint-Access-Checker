# Powershell-SharePoint-Access-Checker
Powershell script to generate all access permissions in a given SharePoint site.

## Step to run the script

1) Unzip the zip file to folder "C:\sp-checker"

2) Install PowerShell SharePoint module accoding to your SharePoint version here: 
https://github.com/sharepoint/pnp-powershell/releases

3) Open file "sp-checker.ps1" using Notepad

4) Modify the existing settings

```sh
# Enter your username here
$Username = "username"

# Enter your password here 
$Password = "password"

# Enter folder path to save the logs files 
$LogsFolder = "C:\sp-checker\logs" 

# Enter excel file path that contains the URLs
$URLsFile = "C:\sp-checker\SiteCollectionList.csv" 
```

4) Save

5) Right-click the file "get-sp-access.ps1" and click Run with PowerShell

* Enter 'Y' if it asks for Execution policy change

* If you need to stop it, press CTRL + C

6) All logs files can be found in folder "C:\sp-checker\logs"

* You may update URLs to execute in excel file: "SiteCollectionList.csv" using Notepad

