SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[EmailBounceLogUpdate]
	@Id int,
	@Messageid varchar(500),
	@Xmailgunsid varchar(100),
	@Attachmentcount int,
	@Bodyplaintext varchar(4000),
	@Code varchar(100),
	@Domain varchar(4000),
	@Error varchar(500),
	@Event varchar(50),
	@Messageheaders varchar(4000),
	@Fmisendid int,	
	@Recipient varchar(1000),
	@Signature varchar(1000),
	@Timestamp varchar(50),
	@Token varchar(50),
	@Notification varchar(500),
	@Campaignid varchar(500),
	@Tag varchar(500),
	@Mailinglist varchar(500),
	@Customdata varchar(4000)
AS

BEGIN
	SET NOCOUNT ON

	UPDATE [dbo].[mailgun_BounceLog] 
	SET
		[MessageId]			= @Messageid
		, [XMailGunSid]		= @Xmailgunsid
		, [AttachmentCount] = @Attachmentcount
		, [BodyPlainText]	= @Bodyplaintext
		, [Code]			= @Code
		, [Domain]			= @Domain
		, [Error]			= @Error
		, [Event]			= @Event
		, [MessageHeaders]	= @Messageheaders
		, [SendId]			= @Fmisendid		
		, [Recipient]		= @Recipient
		, [Signature]		= @Signature
		, [TimeStamp]		= @Timestamp
		, [Token]			= @Token
		, [Notification]	= @Notification
		, [CampaignId]		= @Campaignid
		, [Tag]				= @Tag
		, [MailingList]		= @Mailinglist
		, [CustomData]		= @Customdata
	WHERE
		[Id] = @Id;
END
GO