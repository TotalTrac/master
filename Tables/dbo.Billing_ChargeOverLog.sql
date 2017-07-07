CREATE TABLE [dbo].[Billing_ChargeOverLog] (
  [Id] [int] IDENTITY,
  [ContextStr] [varchar](50) NOT NULL,
  [ContextId] [int] NOT NULL,
  [Created] [datetime] NULL,
  [CreatedById] [int] NULL,
  [EventStr] [varchar](50) NOT NULL,
  [SecurityToken] [varchar](50) NOT NULL,
  [Package] [varchar](max) NULL,
  [BaseObj] [varchar](max) NULL,
  [BillingPackage] [varchar](max) NULL,
  [Bulk] [varchar](max) NULL,
  [Invoice] [varchar](max) NULL,
  [Item] [varchar](max) NULL,
  [LineItem] [varchar](max) NULL,
  [Transaction] [varchar](max) NULL,
  [Customer] [varchar](max) NULL,
  [User] [varchar](max) NULL,
  CONSTRAINT [PK_Billing_ChargeOverLog] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO