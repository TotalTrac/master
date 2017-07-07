SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[MailjetSentInsert]
	@Event varchar(50),
	@Time varchar(50),
	@Messageid varchar(500),
	@Email varchar(500),
	@CampaignId int,
	@ContactId int,
	@Customcampaign varchar(50),
	@Customid varchar(50),
	@Payload varchar(4000),		
	@MjMessageId varchar(50),
	@SmtpReply varchar(50)
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

INSERT INTO [dbo].[mailjet_Sent] (
	[EventId],
	[mj_message_id],
	[smtp_reply]
) 
OUTPUT		
		inserted.Id AS ID
VALUES (
	@Eventid,
	@MjMessageId,
	@SmtpReply
)
--endregion

GO