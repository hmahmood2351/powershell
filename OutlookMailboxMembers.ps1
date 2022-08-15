#first parameter supplied to script is mailbox to lookup

$inbox = $args[0]

Get-Mailbox -Identity "$($inbox)"

$perms = Get-MailboxPermission -Identity "$($inbox)" | Format-List -Property AccessRights, User

$perms