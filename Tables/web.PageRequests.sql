CREATE TABLE [web].[PageRequests] (
  [Id] [int] IDENTITY,
  [IpAddress] [varbinary](8) NOT NULL,
  [IpCityName] [nvarchar](100) NULL,
  [IpCountryCode] [char](2) NULL,
  [IpLatitude] [decimal](9, 6) NULL,
  [IpLongitude] [decimal](9, 6) NULL,
  [IpPostalCode] [varchar](15) NULL,
  [IpRegionCode] [char](2) NULL,
  [PageId] [int] NOT NULL,
  [QrScan] [bit] NULL,
  [Referrer] [nvarchar](400) NULL,
  [RequestBegin] [datetime] NOT NULL,
  [RequestEnd] [datetime] NOT NULL,
  [SessionId] [char](24) NOT NULL,
  [UserAgent] [nvarchar](4000) NULL,
  [UserId] [int] NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_PageRequests] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE INDEX [_dta_index_PageRequests_5_813961976__K11_K2_K14]
  ON [web].[PageRequests] ([PageId], [RequestBegin], [SessionId])
  ON [PRIMARY]
GO

CREATE INDEX [IX_PageRequests_PageID]
  ON [web].[PageRequests] ([PageId])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO

CREATE INDEX [IX_PageRequests_Referrer]
  ON [web].[PageRequests] ([Referrer])
  ON [PRIMARY]
GO

CREATE INDEX [IX_PageRequests_SessionID]
  ON [web].[PageRequests] ([SessionId])
  ON [PRIMARY]
GO

CREATE INDEX [IX_PageRequests_UserId]
  ON [web].[PageRequests] ([UserId])
  ON [PRIMARY]
GO

ALTER TABLE [web].[PageRequests]
  ADD CONSTRAINT [FK_PageRequests_Pages] FOREIGN KEY ([PageId]) REFERENCES [web].[Pages] ([PAGE_ID]) ON DELETE CASCADE
GO

ALTER TABLE [web].[PageRequests]
  ADD CONSTRAINT [FK_PageRequests_Users] FOREIGN KEY ([UserId]) REFERENCES [web].[Users] ([USER_ID])
GO