﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[BulkServiceDiscountGetByID]
	@ID int
AS
	SET NOCOUNT ON;
	
	SELECT
		DISCOUNT_ID
		, DISCOUNT_HIGHTHRESHOLD
		, DISCOUNT_LOWTHRESHOLD
		, DISCOUNT_PERCENT
		, DISCOUNT_SERVICEID	
		, DISCOUNT_UNITPRICE
		, DISCOUNT_ROWVERSION
	FROM 
		BulkServiceDiscounts
	WHERE
		DISCOUNT_ID = @ID;
GO