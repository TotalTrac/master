SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailerCreate]
	@MailerId char(9)
	, @ClientID				int	
	, @IsDefaultTrackingID  BIT
  , @IsTrackingRegistered BIT
  , @IsManaged BIT
AS

BEGIN
		
	SET NOCOUNT ON;
		
	INSERT [usps].[Mailers]
	(
      MailerId
		, ClientId
		, IsDefaultTrackingId
    , IsManaged
		, IsTrackingRegistered
	)
	OUTPUT
		inserted.Id AS ID, inserted.RowVersion AS [VERSION]
	VALUES
	(
		  @MailerId
		, @ClientID
		, @IsDefaultTrackingID
    , @IsManaged
		, 0
	)
END
GO