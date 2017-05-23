# THIS SCRIPT IS PROVIDED "AS IS" WITH NO WARRANTIES OR GUARANTEES OF ANY
# KIND, INCLUDING BUT NOT LIMITED TO MERCHANTABILITY AND/OR FITNESS FOR A
# PARTICULAR PURPOSE. ALL RISKS OF DAMAGE REMAINS WITH THE USER, EVEN IF THE
# AUTHOR, SUPPLIER OR DISTRIBUTOR HAS BEEN ADVISED OF THE POSSIBILITY OF ANY
# SUCH DAMAGE. IF YOUR STATE DOES NOT PERMIT THE COMPLETE LIMITATION OF
# LIABILITY, THEN DO NOT DOWNLOAD OR USE THE SCRIPT. NO TECHNICAL SUPPORT
# WILL BE PROVIDED.
#
# Initialize the $count HashTable (associative array)
$count=@{} 
# Read file, find lines with ÒREG_SZÓ
$keynames=Get-Content \labs\reg.txt|select-string "REG_SZ"
# Iterate through $keynames one key at a time
foreach ( $key in $keynames ) {
  # Remove Ò REG_SZÓ to the end of the line. 
  # Same as this regex: s/ REG_SZ.*//g 
  $key=$key -replace " *REG_SZ.*", ""
  # Remove extra spaces
  $key=$key.trim()
  # Increment count for this key by 1
  $count[$key]++ 
}
# print each key and its count, sorted from highest to lowest
$count.GetEnumerator() | sort value -Descending    
