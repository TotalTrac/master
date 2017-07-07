CREATE TABLE [usps].[ZipCodeFinalizedAverages] (
  [ZipCode] [int] NOT NULL,
  [AverageHours] [int] NOT NULL,
  [EntryPoint] [char](5) NOT NULL,
  [Pieces] [int] NOT NULL,
  [PostalClassID] [int] NOT NULL,
  [ScanDate] [date] NOT NULL
)
ON [PRIMARY]
GO

ALTER TABLE [usps].[ZipCodeFinalizedAverages]
  ADD CONSTRAINT [FK_ZipCodeFinalizedAverages_ZipCodes] FOREIGN KEY ([ZipCode]) REFERENCES [maponics].[ZipCodes] ([ZIPCODE_ID]) ON DELETE CASCADE
GO