SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ForwardsGetByVersionID] 
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		f.Id,
		f.VersionId,
		f.EmailAddress,
		f.Forwarded,
		f.ForwarderId,
		f.IpAddress,
		f.SendStatus,
		f.[Sent],
		f.[RowVersion]
	FROM 
		[email].[Forwards] as f
		INNER JOIN [email].[Versions] AS v
			ON f.VersionId = v.Id
	WHERE
		v.Id = @ID
	ORDER BY 
		f.Id;
END
GO