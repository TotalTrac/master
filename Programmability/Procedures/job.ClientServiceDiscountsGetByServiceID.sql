﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[ClientServiceDiscountsGetByServiceID] 
	@ID int
AS
BEGIN

	SET NOCOUNT ON;

	SELECT 
		ID
		, CLIENTID
		, PRICEMINIMUM
		, [PERCENT]
		, SERVICEID		
		, UNITPRICE
		, ROWVERSION
	FROM 
		job.[ClientServiceDiscounts] 
	WHERE 
		SERVICEID = @ID
	ORDER BY ID;
END
GO