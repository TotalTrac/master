CREATE TABLE [job].[QuoteLineItems] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [AdjustedPrice] [decimal](15, 5) NOT NULL,
  [Note] [varchar](max) NULL,
  [Quantity] [int] NOT NULL,
  [QuoteId] [int] NOT NULL,
  [ServiceId] [int] NOT NULL,
  [State] [int] NULL,
  [UnitPrice] [decimal](15, 5) NOT NULL,
  [RowVersion] [timestamp] NULL,
  [Unit] [int] NULL,
  CONSTRAINT [PK_QuoteLineItems] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [job].[QuoteLineItems]
  ADD CONSTRAINT [FK_QuoteLineItems_Quotes_Id] FOREIGN KEY ([QuoteId]) REFERENCES [job].[Quotes] ([Id])
GO

ALTER TABLE [job].[QuoteLineItems]
  ADD CONSTRAINT [FK_QuoteLineItems_Services_SERVICE_ID] FOREIGN KEY ([ServiceId]) REFERENCES [job].[Services] ([SERVICE_ID])
GO