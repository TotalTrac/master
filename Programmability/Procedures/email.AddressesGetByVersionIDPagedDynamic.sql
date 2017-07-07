SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[AddressesGetByVersionIDPagedDynamic]
	@ID				int
	, @Page			int
	, @RowsPerPage	int
	, @SearchText	nvarchar(320)
	, @OrderBy		nvarchar(100)
AS
BEGIN
		
	SET NOCOUNT ON;
	
	DECLARE @StartRow int,
			@EndRow int,
			@order AS varchar(50),
			@SQLQuery AS NVarchar(4000)

	SET @StartRow = ((@Page - 1) * @RowsPerPage) + 1;
	SET @EndRow = @StartRow + @RowsPerPage - 1;

	IF @OrderBy IS NOT NULL
		SET @order = @OrderBy
	ELSE 
		SET @order = 'Id'
			
	SET @SQLQuery = '
	SELECT
		Id		
		, CompanyName
		, CustomField1
		, CustomField2
		, CustomField3
		, CustomField4
		, CustomField5
		, EmailAddress
		, FirstName
		, LastName
		, MarkupText
		, Salt
		, SignOff
		, [Type]
		, VersionId
		, [Rowversion]
	FROM (
		SELECT 
			ROW_NUMBER() OVER (ORDER BY a.' + @order + ') AS ResultNum 
			, a.Id						
			, a.[CompanyName]
			, a.[CustomField1]
			, a.[CustomField2]
			, a.[CustomField3]
			, a.[CustomField4]
			, a.[CustomField5]
			, a.[EmailAddress]
			, a.[FirstName]
			, a.[LastName]					
			, a.[MarkupText]	
			, a.[Salt]
			, a.[Signoff]			
			, a.[Type]		
			, a.[VersionId]
			, a.[Rowversion]
		FROM 
			[email].[Addresses] AS a			
		WHERE 
			a.VersionId = ' + CONVERT(varchar(10), @ID)

	IF @SearchText IS NOT NULL
		SET @SQLQuery = @SQLQuery + ' AND (EmailAddress LIKE ''%' + @SearchText + '%''
		OR FirstName LIKE ''%' + @SearchText + '%''
		OR LastName LIKE ''%' + @SearchText + '%''
		)'

	SET @SQLQuery = @SQLQuery +'
	) AS NumberResults
	WHERE [NumberResults].[ResultNum] BETWEEN ' + CONVERT(varchar(10), @StartRow) + ' AND ' + CONVERT(varchar(10), @EndRow) + ';'

	--SELECT @SQLQuery;
	EXECUTE sp_Executesql     @SQLQuery	
END
GO