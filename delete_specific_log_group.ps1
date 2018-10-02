$log_group_name_to_search = "/aws/lambda/"
$log_group_name_not_to_delete = "/aws/lambda/DEV*"

aws logs describe-log-groups --log-group-name-prefix $log_group_name_to_search --query logGroups --output json | ConvertFrom-json |
  ForEach-Object {$_.logGroupName} | ForEach-Object {
   if ($_ -like $log_group_name_not_to_delete) {write-host $_ " :NOT Deleted"}` else {write-host $_ " : Deleted"}}
