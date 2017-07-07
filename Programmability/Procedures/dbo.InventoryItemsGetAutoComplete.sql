SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[InventoryItemsGetAutoComplete]
	@ID				int
	, @Substring	nvarchar(255)
AS
BEGIN
			
	SET NOCOUNT ON;

    WITH CTE (CLIENT_ID, CLIENT_NAME, CLIENT_SHORTNAME)
	AS
	(
		(SELECT c.CLIENT_ID, CLIENT_NAME, CLIENT_SHORTNAME
		FROM [dbo].[Clients] AS c
			INNER JOIN [dbo].[Relationships] AS r
				ON c.CLIENT_ID = r.RELATIONSHIP_CLIENTID
		WHERE 
			c.CLIENT_PARENTID IS NULL
			AND r.RELATIONSHIP_USERID = @ID

			UNION
		
		SELECT 
			c.CLIENT_ID, CLIENT_NAME, CLIENT_SHORTNAME
		FROM [dbo].[Clients] AS c
			INNER JOIN [dbo].[Users] AS u
				ON c.CLIENT_ID = u.USER_CLIENT_ID
		WHERE 
			u.USER_USERID = @ID
		)
			
		UNION ALL

		SELECT 
			c.CLIENT_ID, c.CLIENT_NAME, c.CLIENT_SHORTNAME
		FROM [dbo].[Clients] AS c
			INNER JOIN [dbo].[Relationships] AS r
				ON c.CLIENT_ID = r.RELATIONSHIP_CLIENTID
			INNER JOIN CTE
				ON CTE.CLIENT_ID = c.CLIENT_PARENTID
		WHERE 
			c.CLIENT_PARENTID IS NOT NULL
			AND r.RELATIONSHIP_USERID = @ID
	)	
	SELECT 
		[ID]
    , [ShareTypeId]
		, [ClientID]
		, [Code]
		, [Description]
		, CLIENT_NAME
		, INVENTORYITEMTYPE_NAME

    FROM 
		[dbo].[InventoryItems] AS i
		INNER JOIN [dbo].[InventoryItemTypes] AS t
			ON i.[TypeID] = t.INVENTORYITEMTYPE_ID
		INNER JOIN CTE
			ON CTE.CLIENT_ID = i.[ClientID]
	WHERE
		[IsActive] = 1 
		AND ([Code] LIKE '%' + @Substring + '%'
		OR CLIENT_NAME LIKE '%' + @Substring + '%'
		OR CLIENT_SHORTNAME LIKE '%' + @Substring + '%'
		OR INVENTORYITEMTYPE_NAME LIKE '%' + @Substring + '%');
END
GO