SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[UserGetByVersionIDByURLByCode] 
	@ID		int
	, @URL	nvarchar(100)
	, @Code nvarchar(20)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		u.[USER_ID] 
		, u.USER_ABANDONED
		, c.City
		, u.USER_CODE
		, c.CompanyName
		, c.Country		
		, c.EmailAddress
		, c.FirstName
		, u.USER_ISGENERIC
		, c.LastName
		, c.Phone
		, c.PostalCode
		, c.Region
		, c.IsSignoff
		, c.StreetAddress1
		, c.StreetAddress2
		, u.USER_TARGETID
		, c.Title
		, u.USER_TYPE
		, u.USER_URL
		, u.USER_VERSIONID
		, u.USER_ROWVERSION
	FROM
		[web].[Users] AS u
		INNER JOIN [dbo].[CampaignUsers] AS c
			ON u.[USER_TARGETID] = c.[Id]
	WHERE
		(USER_VERSIONID = @ID)
		AND (USER_URL = @URL)
		AND (USER_CODE = @Code);
END
GO