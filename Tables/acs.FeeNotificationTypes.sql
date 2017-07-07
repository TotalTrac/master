CREATE TABLE [acs].[FeeNotificationTypes] (
  [ID] [int] IDENTITY (-2147483648, 1),
  [Description] [varchar](max) NOT NULL,
  [Value] [char](1) NOT NULL,
  CONSTRAINT [PK_FeeNotificationTypes] PRIMARY KEY CLUSTERED ([ID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO