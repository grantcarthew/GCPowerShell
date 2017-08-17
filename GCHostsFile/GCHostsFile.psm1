# Get module script files
$scripts = @( Get-ChildItem -Path $PSScriptRoot\*.ps1 -ErrorAction SilentlyContinue )

#Dot source the script files
$scripts
Foreach($import in $scripts)
{
    Try
    {
        $import.Fullname
        . $import.Fullname
    }
    Catch
    {
        Write-Error -Message "Failed to import function $($import.fullname): $_"
    }
}

# Export the Public modules
Export-ModuleMember -Function $scripts.Basename
