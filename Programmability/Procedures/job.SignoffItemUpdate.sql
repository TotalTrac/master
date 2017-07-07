﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [job].[SignoffItemUpdate]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[SignoffItemUpdate]
-- Date Generated: Tuesday, February 23, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[SignoffItemUpdate]
@Version				timestamp,
	@Id int,
	@Copies int,
  @Instructions VARCHAR(MAX),
	@Random bit,
	@Kitid int,
	@Quantity INT,
  @SoDueDate DATETIME

    
AS

SET NOCOUNT ON

UPDATE [job].[SignoffItems] SET
	[Copies] = @Copies,
  [Instructions] = @Instructions,
	[Random] = @Random,
	[KitId] = @Kitid,
  [SoDueDate] = @SoDueDate,
	[Quantity] = @Quantity
    OUTPUT inserted.Id AS [ID], inserted.[RowVersion] as [VERSION]
WHERE
	[Id] = @Id
AND [RowVersion] = @Version	

--endregion

GO