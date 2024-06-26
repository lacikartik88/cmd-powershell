
#GetActiveDirectoryUsers
Import-Module ActiveDirectory
###################################################################################################
# Powershell to grab all active directory users incrementally
#inserting or updating them into a SQL table.
###################################################################################################
function Get-String ($obj){
    if ([string]::IsNullOrEmpty($obj))
    {
        return ""
    }
    else
    {
        return $obj.ToString();
    }
}

###################################################################################################
#SQL Connection Setup
###################################################################################################
$SQLServer = "Gépnév\SQLEXPRESS";
$SQLDBName = "AD_DB";
$SqlQuery = @"
UPDATE [AD_DB].[dbo].[GetActiveDirectoryUsers]
SET 
[OperationalUnit]     = @OperationalUnit,
[FirstName]           = @FirstName,
[LastName]            = @LastName,
[DisplayName]         = @DisplayName,
[email]               = @email,
[EmailAddress]        = @EmailAddress,
[StreetAddress]       = @StreetAddress,
[City]                = @City,
[State]               = @State,
[PostalCode]          = @PostalCode,
[HomePhone]           = @HomePhone,
[MobilePhone]         = @MobilePhone,
[OfficePhone]         = @OfficePhone,
[Fax]                 = @Fax,
[Company]             = @Company,
[Organization]        = @Organization,
[Department]          = @Department,
[Title]               = @Title,
[Description]         = @Description,
[Office]              = @Office,
[extensionAttribute1] = @extensionAttribute1,
[extensionAttribute2] = @extensionAttribute2,
[extensionAttribute3] = @extensionAttribute3,
[extensionAttribute4] = @extensionAttribute4,
[extensionAttribute5] = @extensionAttribute5,
[AccountExpires]      = @AccountExpires,
[AccountIsEnabled]    = @AccountIsEnabled,
[PasswordLastSet]     = @PasswordLastSet,
[PasswordExpires]     = @PasswordExpires,
[PasswordNeverExpires]= @PasswordNeverExpires,
[PasswordIsExpired]   = @PasswordIsExpired,
[LastLogonTimestamp]  = @LastLogonTimestamp,
[CreatedDate]         = @CreatedDate,
[DWUpdatedDate]       = getdate()
WHERE[sAMAccountName] = @sAMAccountName 
AND [CanonicalName]   = @CanonicalName

IF @@ROWCOUNT = 0
BEGIN
  INSERT INTO [AD_DB].[dbo].[GetActiveDirectoryUsers] 
          (CanonicalName,[sAMAccountName],[OperationalUnit],[FirstName],[LastName],[DisplayName],[email],[EmailAddress],[StreetAddress],[City],[State],[PostalCode],[HomePhone],[MobilePhone],[OfficePhone],[Office],[Fax],[Company],[Organization],[Department],[Title],[Description],[extensionAttribute1],[extensionAttribute2],[extensionAttribute3],[extensionAttribute4],[extensionAttribute5],[AccountExpires],[AccountIsEnabled],[PasswordLastSet],[PasswordExpires],[PasswordNeverExpires],[PasswordIsExpired],[LastLogonTimestamp])
    SELECT @CanonicalName,@sAMAccountName ,@OperationalUnit ,@FirstName ,@LastName ,@DisplayName ,@email ,@EmailAddress ,@StreetAddress ,@City ,@State ,@PostalCode ,@HomePhone ,@MobilePhone ,@OfficePhone ,@Office ,@Fax ,@Company ,@Organization ,@Department ,@Title ,@Description ,@extensionAttribute1 ,@extensionAttribute2 ,@extensionAttribute3 ,@extensionAttribute4 ,@extensionAttribute5 ,@AccountExpires ,@AccountIsEnabled ,@PasswordLastSet ,@PasswordExpires ,@PasswordNeverExpires ,@PasswordIsExpired ,@LastLogonTimestamp
END

"@
$SqlConnection = New-Object System.Data.SqlClient.SqlConnection;
$SqlConnection.ConnectionString = "Server = $SQLServer; Database = $SQLDBName; Integrated Security = True";
$SqlConnection.Open();
$SqlCmd = New-Object System.Data.SqlClient.SqlCommand;
$SqlCmd.Connection = $SqlConnection;
$SqlCmd.CommandType = [System.Data.CommandType]::Text ;

##$SqlCmd.CommandText = "SELECT COUNT(*) FROM [AD_DB].[dbo].[ActiveDirectoryUsers]";
##$RecordCount = $SqlCmd.ExecuteScalar();

$SqlCmd.CommandText = $SqlQuery;

$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@CanonicalName",       [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@sAMAccountName",      [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@OperationalUnit",     [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@FirstName",           [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@LastName",            [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@DisplayName",         [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@email",               [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@EmailAddress",        [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@StreetAddress",       [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@City",                [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@State",               [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@PostalCode",          [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@HomePhone",           [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@MobilePhone",         [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@OfficePhone",         [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@Fax",                 [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@Company",             [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@Organization",        [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@Department",          [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@Title",               [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@Description",         [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@Office",              [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@extensionAttribute1", [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@extensionAttribute2", [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@extensionAttribute3", [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@extensionAttribute4", [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@extensionAttribute5", [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@AccountExpires",      [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@AccountIsEnabled",    [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@PasswordLastSet",     [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@PasswordExpires",     [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@PasswordNeverExpires",[Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@PasswordIsExpired",   [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@LastLogonTimestamp",  [Data.SQLDBType]::VarChar, 128))) | Out-Null
$SqlCmd.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@CreatedDate",         [Data.SQLDBType]::VarChar, 128))) | Out-Null

###################################################################################################
#Get the Results From AD
###################################################################################################
#$Results = Get-ADUser -Filter * -Server "Contosso.dom" -ResultSetSize 10  -Properties * | select -property sAMAccountName,ou,
$Results = Get-ADUser -Filter *  -Properties * | select -property CanonicalName,sAMAccountName,ou,
  GivenName,SurName,DisplayName,email,emailaddress,
  StreetAddress,City,State,PostalCode,
  HomePhone,MobilePhone,OfficePhone,Fax,
  Company,Organization,Department,Title,Description,Office,
  extensionAttribute1,extensionAttribute2,extensionAttribute3,extensionAttribute4,extensionAttribute5,
  @{Name='AccountExpires';Expression={[DATETIME]::fromFileTime($_.accountExpires)}},Enabled,PasswordLastSet,
  @{n="PasswordExpirationDate";e={$_.PasswordLastSet.AddDays($maxPasswordAge)}},PasswordNeverExpires,PasswordExpired,
  LastLogonDate,whenCreated

   foreach ($item in $Results) {
    $SqlCmd.Parameters[0].Value  = Get-String($item.CanonicalName)
    $SqlCmd.Parameters[1].Value  = Get-String($item.sAMAccountName)
    $SqlCmd.Parameters[2].Value  = Get-String($item.ou)
    $SqlCmd.Parameters[3].Value  = Get-String($item.GivenName)
    $SqlCmd.Parameters[4].Value  = Get-String($item.SurName)
    $SqlCmd.Parameters[5].Value  = Get-String($item.DisplayName)
    $SqlCmd.Parameters[6].Value  = Get-String($item.email)
    $SqlCmd.Parameters[7].Value  = Get-String($item.emailaddress)
    $SqlCmd.Parameters[8].Value  = Get-String($item.StreetAddress)
    $SqlCmd.Parameters[9].Value  = Get-String($item.City)
    $SqlCmd.Parameters[10].Value = Get-String($item.State)
    $SqlCmd.Parameters[11].Value = Get-String($item.PostalCode)
    $SqlCmd.Parameters[12].Value = Get-String($item.HomePhone)
    $SqlCmd.Parameters[13].Value = Get-String($item.MobilePhone)
    $SqlCmd.Parameters[14].Value = Get-String($item.OfficePhone)
    $SqlCmd.Parameters[15].Value = Get-String($item.Fax)
    $SqlCmd.Parameters[16].Value = Get-String($item.Company)
    $SqlCmd.Parameters[17].Value = Get-String($item.Organization)
    $SqlCmd.Parameters[18].Value = Get-String($item.Department)
    $SqlCmd.Parameters[19].Value = Get-String($item.Title)
    $SqlCmd.Parameters[20].Value = Get-String($item.Description)
    $SqlCmd.Parameters[21].Value = Get-String($item.Office)
    $SqlCmd.Parameters[22].Value = Get-String($item.extensionAttribute1)
    $SqlCmd.Parameters[23].Value = Get-String($item.extensionAttribute2)
    $SqlCmd.Parameters[24].Value = Get-String($item.extensionAttribute3)
    $SqlCmd.Parameters[25].Value = Get-String($item.extensionAttribute4)
    $SqlCmd.Parameters[26].Value = Get-String($item.extensionAttribute5)
    $SqlCmd.Parameters[27].Value = Get-String($item.AccountExpires)
    $SqlCmd.Parameters[28].Value = Get-String($item.Enabled)
    $SqlCmd.Parameters[29].Value = Get-String($item.PasswordLastSet)
    $SqlCmd.Parameters[30].Value = Get-String($item.PasswordExpirationDate)
    $SqlCmd.Parameters[31].Value = Get-String($item.PasswordNeverExpires)
    $SqlCmd.Parameters[32].Value = Get-String($item.PasswordExpired)
    $SqlCmd.Parameters[33].Value = Get-String($item.LastLogonDate)
    $SqlCmd.Parameters[34].Value = Get-String($item.whenCreated)
$SqlCmd.ExecuteNonQuery();
    }
        if ($SqlConnection.State -eq "Open") {$SqlConnection.Close()}
      