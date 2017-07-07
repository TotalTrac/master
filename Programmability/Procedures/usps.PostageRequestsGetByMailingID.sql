SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[PostageRequestsGetByMailingID]
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT
		ID
		, AMOUNTREQUESTED
		, CLIENTID
		, EXPECTED		
		, MAILINGID
		, NOTES
		, REQUESTED
		, REQUESTEDBYID
		, [RowVersion]
	FROM 
		[usps].[PostageRequests] 
	WHERE 
		MAILINGID = @ID
	ORDER BY
		ID;
END
GO