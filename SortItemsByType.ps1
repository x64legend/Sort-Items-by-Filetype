# Define the paths
$sourcePath = ""
$picturesPath = ""
$documentsPath = ""
$spreadsheetsPath = ""
$installersPath = ""


Set-Location $sourcePath

# Move pictures
Get-ChildItem -Name "*.png","*.jpg","*.gif","*.jpeg","*.heic","*.svg","*.webp" -Recurse | Move-Item -Destination $picturesPath
Write-Host "Pictures have been moved."

# Move documents
Get-ChildItem -Name "*.docx","*.doc","*.txt","*.pdf" -Recurse | Move-Item -Destination $documentsPath
Write-Host "Documents have been moved."

# Move spreadhseets
Get-ChildItem -Name "*.csv","*.docx" -Recurse | Move-Item -Destination $spreadsheetsPath
Write-Host "Spreadsheets have been moved."

# Move installers
Get-ChildItem -name "*.exe","*.msi","*.zip" -Recurse | Move-item -Destination $installersPath
Write-Host "Installers have been moved."
