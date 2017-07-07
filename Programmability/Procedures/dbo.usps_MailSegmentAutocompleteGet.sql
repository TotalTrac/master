SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usps_MailSegmentAutocompleteGet]
	@ID				int
	, @Substring	nvarchar(255)
	, @MaxItems		int = 100
AS
BEGIN
			
	SET NOCOUNT ON;

	SELECT TOP (@MaxItems)
		c.CLIENT_NAME					AS [ClientName]
		, c.CLIENT_SHORTNAME			AS [ClientShortName]
		, j.JOB_ID						AS [JobId]
		, m.JOB_NAME					AS [MailingName]
		, s.MAILSEGMENT_ID				AS [Id]
		, s.MAILSEGMENT_DROPDATE		AS [MailDate]
		, s.MAILSEGMENT_ESTQTY			AS [EstimatedQuantity]
		, s.MAILSEGMENT_NAME			AS [Name]
		--, s.MAILSEGMENT_NONPROFIT	
		--, s.MAILSEGMENT_OUTGOING		
		--, s.MAILSEGMENT_PIECEHEIGHT
		--, s.MAILSEGMENT_PIECELENGTH
		--, s.MAILSEGMENT_PIECETHICKNESS
		--, s.MAILSEGMENT_PIECETYPEID
		--, s.MAILSEGMENT_PIECEWEIGHT		
		--, s.MAILSEGMENT_POSTAGEAPPLIEDID
		--, s.MAILSEGMENT_POSTALCLASSID			
		--, s.MAILSEGMENT_PERMITID
		--, s.MAILSEGMENT_PRESORTED
		--, s.MAILSEGMENT_MAILSTREAMID
		--, s.MAILSEGMENT_SEGMENTTYPEID		
		--, s.MAILSEGMENT_SPECIALPREPARATION
		--, s.MAILSEGMENT_TARGETDATE
		--, s.MAILSEGMENT_TRACKINGTYPEID
		--, ( SELECT SUM(DISTINCT VERSION_TRIGGEREVENT) 
		--	FROM [usps].[MailSegmentEmailVersions] 
		--	WHERE VERSION_SEGMENTID = s.MAILSEGMENT_ID
		--  ) 
		--  AS MAILSEGMENT_TRIGGEREVENTS				
		--, s.MAILSEGMENT_ROWVERSION	
	FROM		 
		[dbo].[MailSegments] AS s
		INNER JOIN [dbo].[Jobs] As m
			ON s.MAILSEGMENT_JOBID = m.JOB_JOBID
		INNER JOIN [job].Jobs AS j
			ON m.JOB_JOBID = j.JOB_ID		
		INNER JOIN [dbo].[Clients] AS c
			ON j.JOB_CLIENTID = c.CLIENT_ID
		INNER JOIN [dbo].[Relationships] AS r
			ON c.CLIENT_ID = r.RELATIONSHIP_CLIENTID
				AND r.RELATIONSHIP_USERID = @ID
	WHERE
		(s.MAILSEGMENT_NAME LIKE '%' + @Substring + '%')
		OR (m.JOB_NAME LIKE '%' + @Substring + '%')
		OR (j.JOB_NAME LIKE '%' + @Substring + '%')
		OR (CONVERT(char, j.JOB_ID) LIKE '%' + @Substring + '%')
		OR (CLIENT_NAME LIKE '%' + @Substring + '%')
		OR (CLIENT_SHORTNAME LIKE '%' + @Substring + '%')
END
GO