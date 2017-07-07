CREATE TABLE [dbo].[colpenn_MailRecords] (
  [MAILRECORD_ID] [int] IDENTITY,
  [MAILRECORD_BATCHDATE] [datetime] NULL,
  [MAILRECORD_COVERAGECODE] [char](1) NULL,
  [MAILRECORD_EFFORT] [char](1) NULL,
  [MAILRECORD_MAILDATE] [datetime] NULL,
  [MAILRECORD_PRINTKEY] [nvarchar](7) NULL,
  [MAILRECORD_SOURCECODE1] [nchar](1) NOT NULL,
  [MAILRECORD_SOURCECODE2] [nchar](1) NOT NULL,
  [MAILRECORD_SOURCECODE3] [nchar](1) NOT NULL,
  [MAILRECORD_SOURCECODE4] [nchar](1) NOT NULL,
  [MAILRECORD_SOURCECODE5] [nchar](1) NOT NULL,
  [MAILRECORD_SOURCECODE6] [nchar](1) NOT NULL,
  [MAILRECORD_SOURCECODE7] [nchar](1) NOT NULL,
  [MAILRECORD_SOURCECODE8] [nchar](1) NOT NULL,
  [MAILRECORD_SOURCECODE9] [nchar](1) NOT NULL,
  [MAILRECORD_SOURCECODE10] [nchar](1) NOT NULL,
  [MAILRECORD_TRANSACTIONDATE] [datetime] NULL,
  CONSTRAINT [PK_MailRecords] PRIMARY KEY CLUSTERED ([MAILRECORD_ID])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_MailRecords_BatchDate]
  ON [dbo].[colpenn_MailRecords] ([MAILRECORD_BATCHDATE])
  ON [PRIMARY]
GO

CREATE INDEX [IX_MailRecords_CoverageCode]
  ON [dbo].[colpenn_MailRecords] ([MAILRECORD_COVERAGECODE])
  ON [PRIMARY]
GO

CREATE INDEX [IX_MailRecords_MailDate]
  ON [dbo].[colpenn_MailRecords] ([MAILRECORD_MAILDATE])
  ON [PRIMARY]
GO

CREATE INDEX [IX_MailRecords_PrintKey]
  ON [dbo].[colpenn_MailRecords] ([MAILRECORD_PRINTKEY])
  ON [PRIMARY]
GO

CREATE INDEX [IX_MailRecords_SourceCode1]
  ON [dbo].[colpenn_MailRecords] ([MAILRECORD_SOURCECODE1])
  ON [PRIMARY]
GO

CREATE INDEX [IX_MailRecords_SourceCode10]
  ON [dbo].[colpenn_MailRecords] ([MAILRECORD_SOURCECODE10])
  ON [PRIMARY]
GO

CREATE INDEX [IX_MailRecords_SourceCode2]
  ON [dbo].[colpenn_MailRecords] ([MAILRECORD_SOURCECODE2])
  ON [PRIMARY]
GO

CREATE INDEX [IX_MailRecords_SourceCode3]
  ON [dbo].[colpenn_MailRecords] ([MAILRECORD_SOURCECODE3])
  ON [PRIMARY]
GO

CREATE INDEX [IX_MailRecords_SourceCode4]
  ON [dbo].[colpenn_MailRecords] ([MAILRECORD_SOURCECODE4])
  ON [PRIMARY]
GO

CREATE INDEX [IX_MailRecords_SourceCode5]
  ON [dbo].[colpenn_MailRecords] ([MAILRECORD_SOURCECODE5])
  ON [PRIMARY]
GO

CREATE INDEX [IX_MailRecords_SourceCode6]
  ON [dbo].[colpenn_MailRecords] ([MAILRECORD_SOURCECODE6])
  ON [PRIMARY]
GO

CREATE INDEX [IX_MailRecords_SourceCode7]
  ON [dbo].[colpenn_MailRecords] ([MAILRECORD_SOURCECODE7])
  ON [PRIMARY]
GO

CREATE INDEX [IX_MailRecords_SourceCode8]
  ON [dbo].[colpenn_MailRecords] ([MAILRECORD_SOURCECODE8])
  ON [PRIMARY]
GO

CREATE INDEX [IX_MailRecords_SourceCode9]
  ON [dbo].[colpenn_MailRecords] ([MAILRECORD_SOURCECODE9])
  ON [PRIMARY]
GO

CREATE INDEX [IX_MailRecords_TransactionDate]
  ON [dbo].[colpenn_MailRecords] ([MAILRECORD_TRANSACTIONDATE])
  ON [PRIMARY]
GO