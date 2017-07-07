SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MailjetEventInsert]
	@Event varchar(50),
	@Time varchar(50),
	@Messageid varchar(500),
	@Email varchar(500),
	@CampaignId int,
	@ContactId int,
	@Customcampaign varchar(50),
	@Customid varchar(50),
	@Payload varchar(4000),
	@SendId int
AS

SET NOCOUNT ON

DECLARE @Id int
DECLARE @table table (id int)

INSERT INTO [dbo].[mailjet_Event] (
	[event],
	[time],
	[MessageId],
	[email],
	[mj_campaign_id],
	[mj_contact_id],
	[customcampaign],
	[CustomID],
	[Payload],
	[SendId]
) 
OUTPUT		
	inserted.id INTO @table
VALUES (
	@Event,
	@Time,
	@Messageid,
	@Email,
	@CampaignId,
	@ContactId,
	@Customcampaign,
	@Customid,
	@Payload,
	@SendId
)

SELECT @Id = id FROM @table;

RETURN @Id
--endregion

GO