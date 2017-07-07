SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [StVincent].[OrderCarrierRouteItemCreate]	
	@Available			int	
	, @CarrierRouteID	int
	, @CountResultID	int
	, @Requested		int = NULL
	, @Selected			bit
	, @Type				int	
AS
BEGIN
	SET NOCOUNT ON;

    INSERT StVincent.[OrderCarrierRouteItems]
	(
		CRRT_AVAILABLE
		, CRRT_CARRIERROUTEID
		, CRRT_COUNTRESULTID
		, CRRT_REQUESTED
		, CRRT_SELECTED
		, CRRT_TYPE		
	)
	OUTPUT inserted.CRRT_ID AS [ID], inserted.CRRT_ROWVERSION AS [VERSION]
	VALUES
	(
		@Available
		, @CarrierRouteID
		, @CountResultID
		, @Requested
		, @Selected
		, @Type		
	);
END
GO