SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[MailjetBounceInsert]
	@Event varchar(50),
	@Time varchar(50),
	@Messageid varchar(500),
	@Email varchar(500),
	@CampaignId int,
	@ContactId int,
	@Customcampaign varchar(50),
	@Customid varchar(50),
	@Payload varchar(4000),
	@Blocked bit,
	@Bounce bit,
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

INSERT INTO [dbo].[mailjet_Bounce] (
	[EventId],
	[blocked],
	[hard_bounce],
	[error_related_to],
	[error]
) 
OUTPUT		
		inserted.Id AS ID
VALUES (
	@Eventid,
	@Blocked,
	@Bounce,
	@RelatedTo,
	@Error
)

--endregion

GO