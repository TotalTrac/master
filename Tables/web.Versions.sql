CREATE TABLE [web].[Versions] (
  [Id] [int] IDENTITY,
  [ActiveBegin] [datetime] NULL,
  [ActiveEnd] [datetime] NULL,
  [Created] [datetime] NOT NULL,
  [CreatedById] [int] NOT NULL,
  [CustomReportUrl] [nvarchar](200) NULL,
  [DomainName] [nvarchar](50) NULL,
  [IsMobile] [bit] NOT NULL,
  [JobId] [int] NOT NULL,
  [Name] [nvarchar](200) NOT NULL,
  [TrackAnonymousEvents] [bit] NOT NULL CONSTRAINT [DF_WebCampaignVersions_WEBCAMPAIGNVERSION_TRACKANONYMOUSEVENTS] DEFAULT (1),
  [TypeId] [int] NOT NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_WebCampaignVersions] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO

CREATE INDEX [IX_Versions_JobId]
  ON [web].[Versions] ([JobId])
  ON [PRIMARY]
GO

CREATE INDEX [IX_Versions_Users]
  ON [web].[Versions] ([CreatedById])
  ON [PRIMARY]
GO

ALTER TABLE [web].[Versions]
  ADD CONSTRAINT [FK_Versions_Jobs] FOREIGN KEY ([JobId]) REFERENCES [job].[Jobs] ([JOB_ID])
GO

ALTER TABLE [web].[Versions]
  ADD CONSTRAINT [FK_Versions_Users] FOREIGN KEY ([CreatedById]) REFERENCES [dbo].[Users] ([USER_USERID])
GO

ALTER TABLE [web].[Versions]
  ADD CONSTRAINT [FK_Versions_VersionTypes] FOREIGN KEY ([TypeId]) REFERENCES [dbo].[web_VersionTypes] ([Id])
GO