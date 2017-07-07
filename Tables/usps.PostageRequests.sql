CREATE TABLE [usps].[PostageRequests] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [AmountRequested] [decimal](11, 2) NOT NULL CONSTRAINT [DF_tblPostageRequests_POSTAGEREQUEST_AMOUNTREQUESTED] DEFAULT (0.00),
  [ClientId] [int] NOT NULL,
  [Expected] [date] NULL,
  [MailingId] [int] NULL CONSTRAINT [DF_tblPostageRequests_POSTAGEREQUEST_JOBID] DEFAULT (0),
  [Notes] [nvarchar](1000) NULL,
  [Requested] [datetime] NOT NULL,
  [RequestedById] [int] NOT NULL CONSTRAINT [DF_tblPostageRequests_POSTAGEREQUEST_REQUESTEDBYID] DEFAULT (0),
  [RowVersion] [timestamp],
  CONSTRAINT [PK_tblPostageRequests] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO