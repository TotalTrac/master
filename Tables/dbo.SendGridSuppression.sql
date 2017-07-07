CREATE TABLE [dbo].[SendGridSuppression] (
  [id] [int] NOT NULL,
  [status] [varchar](15) NULL,
  [reason] [varchar](255) NULL,
  [email] [varchar](100) NULL,
  [created] [datetime] NULL,
  [ipaddress] [varchar](20) NULL,
  [source] [varchar](15) NULL
)
ON [PRIMARY]
GO