CREATE TABLE [site].[FailedLogins] (
  [Username] [nvarchar](320) NOT NULL,
  [FailedLogins] [int] NOT NULL,
  CONSTRAINT [PK_FailedLogins] PRIMARY KEY CLUSTERED ([Username])
)
ON [PRIMARY]
GO