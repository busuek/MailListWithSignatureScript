$SmtpServer = ""
$smtpFrom = "System@gmail.com"
$smtpTo = "User@gmail.com"
$isHTML = $true
$Num = "1"
$SystemName = "System"
$StartTime = "01:00"
$EndTime = "07:00"
$Days = "0"

$encoding = [System.Text.Encoding]::UTF8

$messageFrom = @{
            'BillGates@gmail.com' = 
                      '<b>Bill Gates<b><br>
                      Specialist<br>
                      Google<br>
                      USA, 1600 Amphitheatre Parkway Mountain View, CA 94043
                      email: BillGates@gmail.com<br>';
              
            'SteveJobs@gmail.com' = 
                      '<b>Steve Jobs<b><br>
                      Specialist<br>
                      Google<br>
                      USA, 1600 Amphitheatre Parkway Mountain View, CA 94043
                      email: SteveJobs@gmail.com<br>';
            
            'LinusTorvalds@gmail.com' = 
                      '<b>Linus Torvalds<b><br>
                      Specialist<br>
                      Google<br>
                      USA, 1600 Amphitheatre Parkway Mountain View, CA 94043
                      email: LinusTorvalds@gmail.com<br>';
}

$StartDate = Get-Date -UFormat "%d.%m.%Y"
$EndDate = Get-Date (Get-Date).AddDays($Days) -UFormat "%d.%m.%Y"
$Hello = "Good day!"
$MessageAuthor = $messageFrom[@($smtpFrom)]

$Subject = "$SystemName.Planned Work" -f $Num, $SystemName
$Body = "<font color=#1F497D>$Hello.<br><br>
Planned work ($Num) is planned to be carried out on the '"$SystemName'" portal. During the work, the portals may be unavailable.<br> 
Scheduled work time: $StartTime - $EndTime.<br><br>
Completion of work will be announced later.</front><br><br>
<BODY bgcolor=""#FFFFF"" style=""font-size:9.0pt; font-family: Arial; color: black""><P>

<font color=#1F497D> Yours sincerely, <br><br>$MessageAuthor"

-f $SystemName, $Num, $StartDate, $StartTime, EndDate, $EndTime
Send-MailMessage -SmtpServer $SmtpServer -From $smtpFrom -To $smtpTo -Subject $Subject -Body $Body -Encoding $Encoding -BodyAsHtml:$true
