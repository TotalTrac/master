﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [dbo].[BillingSubscriptionDeleteById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[BillingSubscriptionDeleteById]
-- Date Generated: Monday, June 26, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[BillingSubscriptionDeleteById]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM [dbo].[BillingSubscriptions]
WHERE
	[Id] = @Id

--endregion

GO