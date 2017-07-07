SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [StVincent].[TemplateCarrierRouteItemCreate]	
	@Available			int	
	, @CarrierRouteID	int	
	, @Requested		int = NULL
	, @Selected			bit
	, @Type				int	
AS
BEGIN
	SET NOCOUNT ON;

    INSERT [StVincent].[TemplateCarrierRouteItems]
	(
		CRRT_AVAILABLE
		, CRRT_CARRIERROUTEID		
		, CRRT_REQUESTED
		, CRRT_SELECTED
		, CRRT_TYPE		
	)
	OUTPUT inserted.CRRT_ID AS [ID], inserted.CRRT_ROWVERSION AS [VERSION]
	VALUES
	(
		@Available
		, @CarrierRouteID		
		, @Requested
		, @Selected
		, @Type		
	);
END
GO