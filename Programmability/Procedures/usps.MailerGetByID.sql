SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailerGetByID]
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
		[Id] = @ID;
	
END
GO