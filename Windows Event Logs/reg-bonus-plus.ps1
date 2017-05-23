# THIS SCRIPT IS PROVIDED "AS IS" WITH NO WARRANTIES OR GUARANTEES OF ANY
# KIND, INCLUDING BUT NOT LIMITED TO MERCHANTABILITY AND/OR FITNESS FOR A
# PARTICULAR PURPOSE. ALL RISKS OF DAMAGE REMAINS WITH THE USER, EVEN IF THE
# AUTHOR, SUPPLIER OR DISTRIBUTOR HAS BEEN ADVISED OF THE POSSIBILITY OF ANY
# SUCH DAMAGE. IF YOUR STATE DOES NOT PERMIT THE COMPLETE LIMITATION OF
# LIABILITY, THEN DO NOT DOWNLOAD OR USE THE SCRIPT. NO TECHNICAL SUPPORT
# WILL BE PROVIDED.
#
# Ignore these keys
$whitelist="iTunesHelper","SunJavaUpdateSched","Adobe ARM","QuickTime Task"
# Initialize the $count HashTable (associative array)
$count=@{} 
# Read file, find lines with �REG_SZ�
$keynames=Get-Content \labs\reg.txt|select-string "REG_SZ"
# Iterate through $keynames one key at a time
foreach ( $key in $keynames ) {
  # Remove � REG_SZ� to the end of the line. 
  # Same as this regex: s/ REG_SZ.*//g 
  $key=$key -replace " *REG_SZ.*", ""
  # Remove extra spaces
  $key=$key.trim()
  # If it�s not whitelisted
  if (-not ($whitelist -contains $key)){
    # Increment count for that key by 1
    $count[$key]++ 
  }
}
# print each key and its count, sorted from highest to lowest
$count.GetEnumerator() | sort value -Descending    
