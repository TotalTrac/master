﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[SubscriberGetByClientIDByEmailAddress]
	@ID				int
	, @EmailAddress	nvarchar(320)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		s.[Active]
		, s.Id
		, s.ClientId		
		, s.CustomField1
		, s.CustomField2
		, s.CustomField3
		, s.CustomField4
		, s.CustomField5
		, s.EmailAddress
		, s.FirstName
		, s.LastName
		, s.Subscribed
		, s.[RowVersion] 
	FROM 
		[email].[Subscribers] AS s
	WHERE				
		(s.ClientId = @ID)
		AND (s.EmailAddress = @EmailAddress);
END
GO