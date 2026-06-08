Get-ADGroup "Remote Desktop Users" -Properties Description | Select-Object Name,Description

Get-ADGroupMember "Remote Desktop Users" | Select-Object Name,SamAccountName,ObjectClass

Get-ADGroupMember "ServerAdmins" | Select-Object Name,SamAccountName,ObjectClass
Get-ADGroupMember "ServerAdmins" -Recursive | Select-Object Name,SamAccountName,ObjectClass
