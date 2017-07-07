CREATE TABLE [dbo].[CampaignUsersStaging] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [CampaignUserId] [int] NULL,
  [City] [nvarchar](30) NULL,
  [CompanyName] [nvarchar](100) NULL,
  [Country] [nvarchar](50) NULL,
  [EmailAddress] [nvarchar](320) NULL,
  [EmailUserType] [int] NULL,
  [EmailVersionId] [int] NULL,
  [FirstName] [nvarchar](50) NULL,
  [IsSignoff] [bit] NOT NULL,
  [JobId] [int] NOT NULL,
  [LastName] [nvarchar](50) NULL,
  [Phone] [varchar](20) NULL,
  [PostalCode] [varchar](15) NULL,
  [Region] [nvarchar](30) NULL,
  [StreetAddress1] [nvarchar](100) NULL,
  [StreetAddress2] [nvarchar](100) NULL,
  [Title] [nvarchar](100) NULL,
  [WebUserCode] [nvarchar](20) NULL,
  [WebUserUrl] [nvarchar](100) NULL,
  [WebVersionId] [int] NULL,
  CONSTRAINT [PK_CampaignUsersStaging] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO