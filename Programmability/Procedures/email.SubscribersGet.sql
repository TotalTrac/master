SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[SubscribersGet]
	
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		[Active] 
		, Id
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
		, [RowVersion] 
	FROM 
		[email].[Subscribers]
	ORDER BY 
		Id;
END
GO