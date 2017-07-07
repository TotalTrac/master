SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [StVincent].[TemplateCarrierRouteItemUpdate]
	@ID					int
	, @Available		int	
	, @CarrierRouteID	int	
	, @Requested		int = NULL
	, @Selected			bit
	, @Type				int	
	, @Version			timestamp
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE [StVincent].[TemplateCarrierRouteItems]
	SET
		CRRT_AVAILABLE			= @Available		
		, CRRT_CARRIERROUTEID	= @CarrierRouteID
		, CRRT_REQUESTED		= @Requested
		, CRRT_SELECTED			= @Selected
		, CRRT_TYPE				= @Type		
	OUTPUT inserted.CRRT_ID AS [ID], inserted.CRRT_ROWVERSION AS [VERSION]
	WHERE
		CRRT_ID = @ID
		AND CRRT_ROWVERSION = @Version;
END
GO