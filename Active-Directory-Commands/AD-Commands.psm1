function Search-Group {
    param(
        [String] $like
    )
    Write-Output $description
    try {
        $print = Get-ADGroup -Filter "Name -like '*$like*'" | Select-Object Name
        Write-Output $print
    }
    catch {
        Write-Error "Error occurred: $_"
    }
}

function Get-Group-ByD {
    param(
        [String] $description
    )
    Write-Output $description
    try {
        $print = Get-ADGroup -Filter "Description -like '*$description*'" | Select-Object Name
        Write-Output $print
    }
    catch {
        Write-Error "Error occurred: $_"
    }
}

function Get-Users-InGroup {
    param(
        [String] $name
    )
    try {
        # Check if the group exists
        $group = Get-ADGroup -Identity $name -ErrorAction Stop
        if ($group) {
            # Get members of the group
            Get-ADGroupMember -Identity $name -ErrorAction Stop | Select-Object Name, SamAccountName, ObjectClass
        }
        else {
            Write-Output "Group '$name' not found."
        }
    }
    catch {
        Write-Error "Error occurred: $_"
    }
}


Export-ModuleMember -Function *
