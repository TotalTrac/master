SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailersGetByClientID]
	@ID		int
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
	FROM
		[usps].[Mailers]
	WHERE
		[ClientId] = @ID;
	
END
GO