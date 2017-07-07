﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[StampTypeCreate] 
	@Name nvarchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT [dbo].[StampTypes]
	(
		STAMPTYPE_NAME
	)
	OUTPUT		
		inserted.STAMPTYPE_NAME AS ID, inserted.STAMPTYPE_ROWVERSION AS [VERSION]
	VALUES
	(
		@NAME
	);
END
GO