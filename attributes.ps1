# Set the path to your .csv file
$csvFilePath = "C:\MalhirUserupdat.csv"

# Import the user information from the .csv file
$userInfo = Import-Csv -Path $csvFilePath

# Loop through each user in the .csv file
foreach ($user in $userInfo) {

    # Get the user's SAMAccountName
    $samAccountName = $user.SAMAccountName

    # Set the values for the attributes you want to modify
    $employeeID = $user.employeeID
    $employeeNumber = $user.employeeNumber
    $extensionAttribute8 = $user.extensionAttribute8
    $extensionAttribute9 = $user.extensionAttribute9
    $extensionAttribute10 = $user.extensionAttribute10

    # Modify the user attributes in Active Directory
    Set-ADUser -Identity $samAccountName -EmployeeID $employeeID -EmployeeNumber $employeeNumber -Replace @{extensionAttribute8=$extensionAttribute8; extensionAttribute9=$extensionAttribute9; extensionAttribute10=$extensionAttribute10}
}
