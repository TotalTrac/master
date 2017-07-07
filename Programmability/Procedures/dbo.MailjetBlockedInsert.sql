SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[MailjetBlockedInsert]
	@Event varchar(50),
	@Time varchar(50),
	@Messageid varchar(500),
	@Email varchar(500),
	@CampaignId int,
	@ContactId int,
	@Customcampaign varchar(50),
	@Customid varchar(50),
	@Payload varchar(4000),
	@RelatedTo varchar(50),
	@Error varchar(50)
AS

SET NOCOUNT ON

DECLARE	@EventId int;

EXEC	@EventId = [dbo].[MailjetEventInsert]
		@Event = @Event,
		@Time = @Time,
		@Messageid = @Messageid,
		@Email = @Email,
		@CampaignId = @CampaignId,
		@ContactId = @ContactId,
		@Customcampaign = @Customcampaign,
		@Customid = @Customid,
		@Payload = @Payload;

INSERT INTO [dbo].[mailjet_Blocked] (
	[EventId],
	[error_related_to],
	[error]
) 
OUTPUT		
	inserted.Id AS ID
VALUES (
	@EventId,
	@RelatedTo,
	@Error
)

--endregion

GO