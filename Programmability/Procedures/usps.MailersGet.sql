SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailersGet]
	
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		[Id] 
		, [ClientId]
		, [IsDefaultTrackingId]
		, [IsManaged]
		, [IsTrackingRegistered]
		, [MailerId]
		
		, RowVersion
		, [ClientId] AS MAILER_CLIENTID
		, [IsDefaultTrackingId] AS MAILER_ISDEFAULTTRACKINGID
		
		, [IsTrackingRegistered] AS MAILER_ISTRACKINGREGISTERED
		, CONVERT(INT, [MailerId]) AS MAILER_ID
	FROM
		[usps].[Mailers];	
END


GO