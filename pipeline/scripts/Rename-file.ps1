#.\Rename-File.ps1 -CurrentFilename $RelativePath\resource\plugins\lv_icon.lvlibp -NewFilename $lv_icon_x64.lvlibp
param(
    [string]$CurrentFilename,
    [string]$NewFilename
)

# Function to rename the file
function Rename-File {
    param(
        [string]$CurrentFilename,
        [string]$NewFilename
    )
    
    # Check if the file exists
    if (-Not (Test-Path -Path $CurrentFilename)) {
        Write-Host "Error: File '$CurrentFilename' does not exist." -ForegroundColor Red
        return
    }

    # Attempt to rename the file
    try {
        Rename-Item -Path $CurrentFilename -NewName $NewFilename
        Write-Host "File renamed successfully from '$CurrentFilename' to '$NewFilename'." -ForegroundColor Green
    } catch {
        Write-Host "Error: Could not rename the file. $_" -ForegroundColor Red
    }
}

# Call the function
Rename-File -CurrentFilename $CurrentFilename -NewFilename $NewFilename
