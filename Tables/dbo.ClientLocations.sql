CREATE TABLE [dbo].[ClientLocations] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [Address1] [nvarchar](100) NULL,
  [Address2] [nvarchar](100) NULL,
  [Address3] [nvarchar](100) NULL,
  [Address4] [nvarchar](100) NULL,
  [AddressType] [int] NULL,
  [City] [nvarchar](50) NULL,
  [ClientId] [int] NOT NULL,
  [Code] [char](10) NULL,
  [Contact] [nvarchar](50) NULL,
  [CountryId] [int] NULL,
  [Email] [nvarchar](320) NULL,
  [Fax] [char](15) NULL,
  [Name] [nvarchar](100) NULL,
  [Phone] [char](15) NULL,
  [PlacesId] [varchar](200) NULL,
  [PostalCode] [nchar](15) NULL,
  [Region] [nvarchar](50) NULL,
  [TollFree] [char](15) NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_ClientLocations] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO