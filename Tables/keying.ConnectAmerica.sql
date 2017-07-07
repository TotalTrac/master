CREATE TABLE [keying].[ConnectAmerica] (
  [id] [int] IDENTITY (8373, 1),
  [full_name] [varchar](50) NULL,
  [street] [varchar](50) NULL,
  [city] [varchar](50) NULL,
  [state] [varchar](50) NULL,
  [zip] [varchar](50) NULL,
  [phone] [varchar](50) NULL,
  [email] [varchar](50) NULL,
  [formcode] [varchar](50) NULL,
  [tollfreephone] [varchar](50) NULL,
  [systemfor] [int] NULL,
  [datetimekeyed] [datetime] NULL CONSTRAINT [DF_ConnectAmerica_datetimekeyed] DEFAULT (getdate()),
  [keyer] [varchar](10) NULL,
  [batch] [varchar](20) NULL,
  [mailflags] [int] NULL,
  CONSTRAINT [PK_ConnectAmerica] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO