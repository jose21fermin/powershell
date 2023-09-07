function EditRegistry{

    if (Test-Path -Path $registryPath) {
        # if key exists,  set the values
        foreach ($entry in $registryEntries) {
            Set-ItemProperty -Path $registryPath -Name $entry.Name -Value $entry.Value -Type $entry.Type
            Write-Host "Registry value set for $($env:USERNAME) - $($entry.Name)."
        }
    } else {
        # The key does not exist
        Write-Host "$registrypath key does not exist for $($env:USERNAME)."
    }
}

#AUTODESK
$registryPath = "HKCU:\SOFTWARE\Autodesk\ODIS"
$registryEntries = @(
    @{
        Name = "DisableManualUpdateInstall"
        Value = "1"
        Type = 'DWORD'
    }
)
EditRegistry


#ENSCAPE
$registryPath = "HKCU:\SOFTWARE\Enscape"
$registryEntries = @(
    @{
        Name = "SuppressUpdateNotifications"
        Value = "1"
        Type = 'String'
    },
    @{
        Name = "SuppressGraphicsDriverWarning"
        Value = "1"
        Type = 'String'
    },
    @{
        Name = "SuppressFirstStepsWindow"
        Value = "1"
        Type = 'String'
    }
)
EditRegistry


#BlueBeam
Set-ItemProperty -Path "HKLM:\SOFTWARE\Bluebeam Software\21\Revu" -Name "DisableInAppUpdates" -Value 1 -Type String