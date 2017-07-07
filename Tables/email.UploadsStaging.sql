CREATE TABLE [email].[UploadsStaging] (
  [Id] [int] IDENTITY,
  [CampaignId] [int] NOT NULL,
  [City] [nvarchar](30) NULL,
  [CompanyName] [nvarchar](100) NULL,
  [Country] [nvarchar](50) NULL,
  [EmailAddress] [nvarchar](320) NULL,
  [FirstName] [nvarchar](50) NULL,
  [IsSignoff] [bit] NOT NULL,
  [LastName] [nvarchar](50) NULL,
  [Phone] [varchar](20) NULL,
  [PostalCode] [varchar](15) NULL,
  [Region] [nvarchar](30) NULL,
  [StreetAddress1] [nvarchar](100) NULL,
  [StreetAddress2] [nvarchar](100) NULL,
  [Title] [nvarchar](100) NULL,
  [VersionId] [int] NOT NULL,
  [Raw] [nvarchar](max) NOT NULL,
  [CampaignUserId] [int] NULL
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO