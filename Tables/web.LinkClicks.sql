CREATE TABLE [web].[LinkClicks] (
  [Id] [int] IDENTITY,
  [DateTime] [datetime] NOT NULL,
  [IpAddress] [varbinary](8) NOT NULL,
  [IpCityName] [nvarchar](100) NULL,
  [IpCountryCode] [char](2) NULL,
  [IpLatitude] [decimal](9, 6) NULL,
  [IpLongitude] [decimal](9, 6) NULL,
  [IpPostalCode] [varchar](15) NULL,
  [IpRegionCode] [char](2) NULL,
  [LinkId] [int] NOT NULL,
  [SessionId] [char](24) NULL,
  [UserAgent] [nvarchar](4000) NULL,
  [UserId] [int] NULL,
  CONSTRAINT [PK_LinkClicks] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE INDEX [IX_LinkClicks_Links]
  ON [web].[LinkClicks] ([LinkId])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

CREATE INDEX [IX_LinkClicks_UserId]
  ON [web].[LinkClicks] ([UserId])
  ON [PRIMARY]
GO

ALTER TABLE [web].[LinkClicks]
  ADD CONSTRAINT [FK_LinkClicks_Links] FOREIGN KEY ([LinkId]) REFERENCES [web].[Links] ([LINK_ID])
GO

ALTER TABLE [web].[LinkClicks]
  ADD CONSTRAINT [FK_LinkClicks_Users] FOREIGN KEY ([UserId]) REFERENCES [web].[Users] ([USER_ID])
GO