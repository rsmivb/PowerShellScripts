#Scripts to send an email 

Function Mailer ()
{
   $message = @"
	Team,

	This is a test to send an email.
	
	Thanks,
	The User
	acme.com
"@       

$emailTo = "user_name@acme.com"
$emailFrom = "noreply@adme.com"
$subject="Test to send email"
$smtpserver="my-smtp.us.acme.com"

$smtp=new-object Net.Mail.SmtpClient($smtpServer)
$smtp.Send($emailFrom, $emailTo, $subject, $message)
Write-Output "Email has been sent."
}

Mailer 
