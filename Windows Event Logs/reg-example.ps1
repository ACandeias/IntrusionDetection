$user="starbuck"
$password="cyl0n"

$array = @("192.168.1.1", "192.168.1.2")
foreach ($ip in $array) {
  net use \\$ip $password /u:$user | out-null
  $ip
  reg query \\$ip\HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
  reg query \\$ip\HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce
  reg query \\$ip\HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Run
  reg query \\$ip\HKLM\SOFTWARE\Wow6432node\Microsoft\Windows\CurrentVersion\Run 2> $null
  reg query \\$ip\HKLM\SOFTWARE\Wow6432node\Microsoft\Windows\CurrentVersion\RunOnce 2> $null
  net use \\$ip del
}

