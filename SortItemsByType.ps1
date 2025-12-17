<#
 * Project Name : Sort Items by Type
 * File Name    : SortItemsByType.ps1
 * Author       : Sydnie Barnes
 * Created Date : 2024-11-12
 * Last Updated : 2025-12-17
 * Version      : v1.2.0
 * Description  : Sorts items by file type into designated folders
 * Dependencies : None
 * Notes        : None
#>

# Define the paths

function Move-ItemsByType {
    param (
        [Parameter(Mandatory = $true)]
        [string]$SourcePath,

        [string]$PicturesPath,

        [string]$DocumentsPath,

        [string]$SpreadsheetsPath,

        [string]$InstallersPath
    )

    $pictureFileTypes = @(
        "*.png", 
        "*.jpg", 
        "*.gif", 
        "*.jpeg", 
        "*.heic", 
        "*.svg", 
        "*.webp"
        "*.ico", 
        "*.tiff"
        "*.bmp"
        "*.raw"
        "*.psd"
        "*.xcf")

    $documentFileTypes = @(
        "*.docx", 
        "*.doc", 
        "*.txt", 
        "*.pdf"
        "*.odt", 
        "*.rtf"
        "*.md")

    $spreadsheetFileTypes = @(
        "*.csv", 
        "*.xlsx"
        "*.xls")

    $installerFileTypes = @(
        "*.exe", 
        "*.msi", 
        "*.zip", 
        "*.7z", 
        "*.rar",
        "*.dmg",
        "*.tar",
        "*.gz")
    
    # Change to source directory
    Set-Location $sourcePath

    # Move pictures
    foreach ($type in $pictureFileTypes) {
        Get-ChildItem -Name $type -Recurse | Move-Item -Destination $picturesPath -Force
        Write-Host "Pictures of type $type have been moved to $picturesPath." -ForegroundColor Magenta
    }

    # Move documents
    foreach ($type in $documentFileTypes) {
        Get-ChildItem -Name $type -Recurse | Move-Item -Destination $documentsPath -Force
        Write-Host "Documents of type $type have been moved to $documentsPath." -ForegroundColor Blue
    }

    # Move spreadhseets
    foreach ($type in $spreadsheetFileTypes) {
        Get-ChildItem -Name $type -Recurse | Move-Item -Destination $spreadsheetsPath -Force
        Write-Host "Spreadsheets of type $type have been moved to $spreadsheetsPath." -ForegroundColor Green
    }

    # Move installers
    foreach ($type in $installerFileTypes) {
        Get-ChildItem -Name $type -Recurse | Move-Item -Destination $installersPath -Force
        Write-Host "Installers of type $type have been moved to $installersPath." -ForegroundColor Yellow
    }

}

# Move files
$SourcePath = Read-Host "Enter the source path (where files are currently located)"
$PicturesPath = Read-Host "Enter the destination path for pictures"
$DocumentsPath = Read-Host "Enter the destination path for documents"
$SpreadsheetsPath = Read-Host "Enter the destination path for spreadsheets"
$InstallersPath = Read-Host "Enter the destination path for installers"

# Define user
$user = [System.Environment]::UserName

# Move files with defaults - set to preferred path
if ([string]::IsNullOrWhiteSpace($SourcePath)) {
    $SourcePath = "C:\Users\$user\Downloads"
}

# Move pictures files with defaults
if ([string]::IsNullOrWhiteSpace($PicturesPath)) {
    $PicturesPath = "C:\Users\$user\OneDrive\Pictures"
}

# Move document files with defaults
if ([string]::IsNullOrWhiteSpace($DocumentsPath)) {
    $DocumentsPath = "C:\Users\$user\OneDrive\Documents"
}

# Move spreadsheet files with defaults
if ([string]::IsNullOrWhiteSpace($SpreadsheetsPath)) {
    $SpreadsheetsPath = "C:\Users\$user\OneDrive\Documents\Spreadsheets"
}

# Move installer files with defaults
if ([string]::IsNullOrWhiteSpace($InstallersPath)) {
    $InstallersPath = "C:\Users\$user\OneDrive\Documents\Installers"
}

# Move files
Move-ItemsByType -SourcePath $SourcePath -PicturesPath $PicturesPath -DocumentsPath $DocumentsPath -SpreadsheetsPath $SpreadsheetsPath -InstallersPath $InstallersPath