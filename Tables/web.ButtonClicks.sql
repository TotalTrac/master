CREATE TABLE [web].[ButtonClicks] (
  [Id] [int] IDENTITY,
  [ButtonId] [int] NOT NULL,
  [DateTime] [datetime] NOT NULL,
  [IpAddress] [varbinary](8) NOT NULL,
  [IpCityName] [nvarchar](100) NULL,
  [IpCountryCode] [char](2) NULL,
  [IpLatitude] [decimal](9, 6) NULL,
  [IpLongitude] [decimal](9, 6) NULL,
  [IpPostalCode] [varchar](15) NULL,
  [IpRegionCode] [char](2) NULL,
  [SessionId] [char](24) NULL,
  [UserAgent] [nvarchar](4000) NULL,
  [UserId] [int] NULL,
  CONSTRAINT [PK_ButtonClicks] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE INDEX [IX_ButtonClicks_ButtonId]
  ON [web].[ButtonClicks] ([ButtonId])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

CREATE INDEX [IX_ButtonClicks_UserId]
  ON [web].[ButtonClicks] ([UserId])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

ALTER TABLE [web].[ButtonClicks]
  ADD CONSTRAINT [FK_ButtonClicks_Buttons] FOREIGN KEY ([ButtonId]) REFERENCES [web].[Buttons] ([BUTTON_ID])
GO

ALTER TABLE [web].[ButtonClicks]
  ADD CONSTRAINT [FK_ButtonClicks_Users] FOREIGN KEY ([UserId]) REFERENCES [web].[Users] ([USER_ID])
GO