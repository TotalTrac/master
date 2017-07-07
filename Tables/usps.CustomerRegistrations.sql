CREATE TABLE [usps].[CustomerRegistrations] (
  [CRID_ID] [int] NOT NULL,
  [CRID_CLIENTID] [int] NOT NULL,
  [CRID_NAME] [varchar](100) NOT NULL,
  [CRID_NONPROFITAUTH] [char](10) NULL,
  CONSTRAINT [PK_CustomerRegistrationIDs] PRIMARY KEY CLUSTERED ([CRID_ID]),
  CONSTRAINT [UQ__Customer__17EB82ACFE710FC3] UNIQUE ([CRID_NAME], [CRID_CLIENTID])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_CustomerRegistrationIDs_LocationID]
  ON [usps].[CustomerRegistrations] ([CRID_CLIENTID], [CRID_NAME])
  INCLUDE ([CRID_ID])
  ON [PRIMARY]
GO

ALTER TABLE [usps].[CustomerRegistrations]
  ADD CONSTRAINT [FK__CustomerR__CRID___534EF79F] FOREIGN KEY ([CRID_CLIENTID]) REFERENCES [dbo].[Clients] ([CLIENT_ID])
GO