CREATE TABLE [dbo].[ClientCreationRequests] (
  [Id] [int] IDENTITY,
  [Address1] [nvarchar](100) NULL,
  [Address2] [nvarchar](100) NULL,
  [ApprovedById] [int] NULL,
  [Branded] [bit] NOT NULL,
  [City] [nvarchar](50) NULL,
  [Contact] [nvarchar](50) NULL,
  [Created] [datetime] NOT NULL,
  [CreatedById] [int] NOT NULL,
  [Email] [nvarchar](320) NULL,
  [Favicon] [nvarchar](255) NULL,
  [Fax] [char](15) NULL,
  [Internal] [bit] NOT NULL,
  [LegalName] [nvarchar](200) NULL,
  [Name] [nvarchar](100) NOT NULL,
  [NonProfitAuth] [char](10) NULL,
  [ParentId] [int] NULL,
  [Phone] [char](15) NULL,
  [PostalCode] [nchar](15) NULL,
  [Region] [nvarchar](50) NULL,
  [ShortName] [nvarchar](50) NOT NULL,
  [State] [int] NOT NULL,
  [StyleSheet] [nvarchar](100) NULL,
  [SubDomain] [nvarchar](50) NULL,
  [Url] [nvarchar](255) NULL,
  [Vendor] [bit] NOT NULL,
  [RowVersion] [timestamp] NULL,
  CONSTRAINT [PK_ClientCreationRequests] PRIMARY KEY NONCLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[ClientCreationRequests]
  ADD CONSTRAINT [FK_ClientCreationRequests_Clients_CLIENT_ID] FOREIGN KEY ([ParentId]) REFERENCES [dbo].[Clients] ([CLIENT_ID])
GO

ALTER TABLE [dbo].[ClientCreationRequests]
  ADD CONSTRAINT [FK_ClientCreationRequests_CreationRequestStateTypes_Id] FOREIGN KEY ([State]) REFERENCES [dbo].[CreationRequestStateTypes] ([Id])
GO

ALTER TABLE [dbo].[ClientCreationRequests]
  ADD CONSTRAINT [FK_ClientCreationRequests_Users_USER_USERID] FOREIGN KEY ([CreatedById]) REFERENCES [dbo].[Users] ([USER_USERID])
GO