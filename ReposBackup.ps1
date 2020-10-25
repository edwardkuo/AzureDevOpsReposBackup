$PATToken="PAT"
$base64AuthInfo= [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes(":$($PATToken)"))
$AzureDevopsOrg="Organization Name"
$AzureDevOpsProject="Project Name"
$LocalfilePath="Backup File Path"


$ProjectUrlAPI = "https://dev.azure.com/$($AzureDevopsOrg)/$($AzureDevOpsProject)/_apis/git/repositories?api-version=6.1-preview.1" 


$Repo = (Invoke-RestMethod -Uri $ProjectUrlAPI -Method Get -UseDefaultCredential -Headers @{Authorization=("Basic {0}" -f $base64AuthInfo)})
$RepoName= $Repo.value.name

ForEach ($name in $RepoName)
{
    $ReposUrl="https://anything:$($PATToken)@dev.azure.com/$($AzureDevopsOrg)/$($AzureDevOpsProject.Replace(" ","%20"))/_git/$($name.replace(" ","%20"))"
    $FilePath="$($LocalfilePath)\$($name)"
    
    if(Test-Path $FilePath)
    {
        cd  $FilePath
        write $ReposUrl
        git pull origin QAS
        git pull origin master
        }
    else {
        write $ReposUrl
        git clone $ReposUrl $FilePath -b master
    }
  }
