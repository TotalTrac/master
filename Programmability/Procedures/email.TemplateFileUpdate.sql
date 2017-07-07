SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO


CREATE PROCEDURE [email].[TemplateFileUpdate]
	  @ID						int	
	, @Name						nvarchar(MAX)
	, @Data						varbinary(MAX)
	, @Size						bigint
	, @Version					timestamp
AS
BEGIN
	
	SET NOCOUNT ON;
	
	UPDATE [email].TemplateFileS
	SET	
			 [Data] = @Data
			,Name = @Name
			,[Size] = @Size


	
	OUTPUT
		inserted.Id AS ID, inserted.[Rowversion] AS [VERSION]
	WHERE
		(Id = @ID) AND 
		([Rowversion] = @Version);	
END
GO