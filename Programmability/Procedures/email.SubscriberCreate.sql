SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[SubscriberCreate] 
	@Active				bit
	, @ClientID			int	
	, @CustomField1		sql_variant = NULL
	, @CustomField2		sql_variant = NULL
	, @CustomField3		sql_variant = NULL
	, @CustomField4		sql_variant = NULL
	, @CustomField5		sql_variant = NULL
	, @EmailAddress		nvarchar(320)
	, @FirstName		nvarchar(50) = NULL
	, @LastName			nvarchar(50) = NULL	
	, @Subscribed		datetime
AS
BEGIN
	
	SET NOCOUNT ON;

	INSERT [email].[Subscribers]
	(
		[Active]
		, ClientId		
		, CustomField1
		, CustomField2
		, CustomField3
		, CustomField4
		, CustomField5
		, EmailAddress
		, FirstName
		, LastName
		, Subscribed
	)
	OUTPUT
		inserted.Id AS ID, inserted.[RowVersion] AS [VERSION]
	VALUES
	(
		@Active
		, @ClientID		
		, @CustomField1
		, @CustomField2
		, @CustomField3
		, @CustomField4
		, @CustomField5
		, @EmailAddress
		, @FirstName
		, @LastName
		, @Subscribed
	);	
END
GO