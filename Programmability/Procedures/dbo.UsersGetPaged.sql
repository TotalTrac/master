SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UsersGetPaged] 
	@Page int,
	@RowsPerPage int
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @StartRow int,
			@EndRow int

	SET @StartRow = ((@Page - 1) * @RowsPerPage) + 1;
	SET @EndRow = @StartRow + @RowsPerPage - 1;

	SELECT * FROM (
		SELECT ROW_NUMBER() OVER (ORDER BY USER_USERID) AS ResultNum, 
			USER_USERID
			, USER_ADDRESS1
			, USER_ADDRESS2
			, USER_CITY
			, USER_CLIENT_ID
			, USER_CREATED
			, USER_CREATEDBY_ID
			, USER_DEFAULTURL
			, USER_FAX
		, USER_FIRSTNAME
		, USER_INACTIVELOGOUT
		, USER_LASTNAME
			, USER_LOCKEDOUT		
			, USER_PHONE
			, USER_POSTALCODE
			, USER_REGION
			, USER_ROLES
			, USER_SECONDARY_EMAIL
			, USER_USERNAME
			, USER_ROWVERSION
		FROM 
			[dbo].[Users]
		) as NumberResults
	WHERE ResultNum BETWEEN @StartRow AND @EndRow;
	
END
GO