Get-GPO -Name "Service" | Select-Object DisplayName,Id

Get-GPOReport -Name "Service" -ReportType Html -Path C:\Users\offsec\Desktop\Service.html

Get-GPOReport -Name "Default Domain Policy" -ReportType Html -Path C:\Users\offsec\Desktop\DefaultDomainPolicy.html
