# Powershell-SharePoint-Access-Checker
Powershell script to generate a list of all access permissions in a given SharePoint site.

## Step to run the script

1) Clone this repo to a new folder. Example: "C:\sp-checker"

2) Install PowerShell SharePoint module according to your SharePoint version here: 
https://github.com/sharepoint/pnp-powershell/releases

3) Add your SharePoint URLS in file "SiteCollectionList.csv" (you can use Notepad)

4) Open file "sp-checker.ps1" using Notepad

5) Modify the existing settings

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

6) Save your settings

7) Right-click the file "get-sp-access.ps1" and click Run with PowerShell
    - Enter 'Y' if it asks for Execution policy change
    - If you need to stop it, press CTRL + C

8) All generated logs files can be found in folder defined in step 1. Example: "C:\sp-checker\logs"
