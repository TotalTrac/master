SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[PageRequestsGetCountByPageID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @TrackAnonymous bit;
	SET @TrackAnonymous = 
	(
		SELECT 
			v.TrackAnonymousEvents
		FROM 			
			[web].[Versions] AS v				
			INNER JOIN [web].[Pages] AS p
				ON v.Id = p.PAGE_VERSIONID
		WHERE 
			p.PAGE_ID = @ID
	);
	
	IF @TrackAnonymous = 1
		SELECT 
			COUNT(r.Id)    
		FROM
			[web].[PageRequests] AS r
			INNER JOIN [web].[Pages] AS p
				ON r.PageId = p.PAGE_ID
		WHERE
			p.PAGE_ID = @ID;
	ELSE	
		SELECT 
			COUNT(DISTINCT r.UserId)    
		FROM
			[web].[PageRequests] AS r
			INNER JOIN [web].[Pages] AS p
				ON r.PageId = p.PAGE_ID
		WHERE
			p.PAGE_ID = @ID
			--AND r.PageId IN
			--(
			--	SELECT DISTINCT USERPAGEREQUEST_PAGEREQUESTID FROM [web].[UserPageRequests]
			--)
END
GO