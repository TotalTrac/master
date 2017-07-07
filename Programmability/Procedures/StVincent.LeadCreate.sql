SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [StVincent].[LeadCreate]
	    @PrefixTtl			varchar(4)
        ,@IndividualName	varchar(70)
        ,@FirstName			varchar(35)
        ,@MiddleName		varchar(1)
        ,@LastName			varchar(35)
        ,@Address			varchar(50)
        ,@Address2Line		varchar(35)
        ,@City				varchar(30)
        ,@State				varchar(2)
        ,@Zip				varchar(5)
        ,@Zip4				varchar(4)
        ,@Dpbc				varchar(3)
        ,@ConfidenceCode	varchar(1)
        ,@PostSuppPhone		varchar(10)
        ,@Religon			varchar(1)
        ,@SecPhoneFlag		varchar(1)
        ,@Crrt				varchar(4)
        ,@DsfWalkSequence	varchar(4)
        ,@County			varchar(3)


AS
BEGIN
	SET NOCOUNT ON;
	    
	INSERT [StVincent].[Leads]
	(
	  [RECORD_PREFIXTTL]
      ,[RECORD_INDIVIDUALNAME]
      ,[RECORD_FIRSTNAME]
      ,[RECORD_MIDDLENAME]
      ,[RECORD_LASTNAME]
      ,[RECORD_ADDRESS]
      ,[RECORD_ADDRESS2LINE]
      ,[RECORD_CITY]
      ,[RECORD_STATE]
      ,[RECORD_ZIP]
      ,[RECORD_ZIP4]
      ,[RECORD_DPBC]
      ,[RECORD_CONFIDENCECODE]
      ,[RECORD_POSTSUPPPHONE]
      ,[RECORD_RELIGION]
      ,[RECORD_SECPHONEFLAG]
      ,[RECORD_CRRT]
      ,[RECORD_DSFWALKSEQUENCE]
      ,[RECORD_COUNTY]
	)
	OUTPUT inserted.RECORD_ID AS [ID], NULL AS [Version]
	VALUES
	(
		@PrefixTtl
        ,@IndividualName
        ,@FirstName
        ,@MiddleName
        ,@LastName
        ,@Address
        ,@Address2Line
        ,@City
        ,@State
        ,@Zip
        ,@Zip4
        ,@Dpbc
        ,@ConfidenceCode
        ,@PostSuppPhone
        ,@Religon
        ,@SecPhoneFlag
        ,@Crrt
        ,@DsfWalkSequence
        ,@County		
	);
END
GO