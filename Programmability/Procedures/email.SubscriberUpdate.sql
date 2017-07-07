SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[SubscriberUpdate]
	@ID					int
	, @Active			int 
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
	, @Version			timestamp
AS
BEGIN
	
	SET NOCOUNT ON;

	UPDATE [email].[Subscribers]
	SET
		[Active]			= @Active
		, ClientId		= @ClientID				
		, CustomField1	= @CustomField1
		, CustomField2	= @CustomField2
		, CustomField3	= @CustomField3
		, CustomField4	= @CustomField4
		, CustomField5	= @CustomField5
		, EmailAddress	= @EmailAddress
		, FirstName		= @FirstName
		, LastName		= @LastName
		, Subscribed		= @Subscribed	
	OUTPUT
		inserted.Id AS ID, inserted.[RowVersion] AS [VERSION]	
	WHERE 
		(Id = @ID)
		AND ([RowVersion] = @Version);	
END
GO