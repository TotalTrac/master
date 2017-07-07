CREATE TABLE [dbo].[colpenn_RejectRecords] (
  [REJECTRECORD_ID] [int] IDENTITY,
  [REJECTRECORD_AGE] [int] NULL,
  [REJECTRECORD_BATCHDATE] [datetime] NULL,
  [REJECTRECORD_BIRTHDATE] [datetime] NULL,
  [REJECTRECORD_CITY] [nvarchar](20) NULL,
  [REJECTRECORD_COVERAGECODE] [char](1) NULL,
  [REJECTRECORD_EFFORT] [char](1) NULL,
  [REJECTRECORD_FLAG] [char](1) NULL,
  [REJECTRECORD_FULLNAME] [nvarchar](50) NULL,
  [REJECTRECORD_GENDER] [char](1) NULL,
  [REJECTRECORD_MAILDATE] [datetime] NULL,
  [REJECTRECORD_MEMBERNUMBER] [nvarchar](7) NULL,
  [REJECTRECORD_PHONENUMBER] [nvarchar](15) NULL,
  [REJECTRECORD_PRINTKEY] [nvarchar](7) NULL,
  [REJECTRECORD_REFERRERFLAG] [char](1) NULL,
  [REJECTRECORD_REFERRERFULLNAME] [nvarchar](50) NULL,
  [REJECTRECORD_REASON] [nvarchar](30) NULL,
  [REJECTRECORD_SOURCECODE1] [nchar](1) NOT NULL,
  [REJECTRECORD_SOURCECODE2] [nchar](1) NOT NULL,
  [REJECTRECORD_SOURCECODE3] [nchar](1) NOT NULL,
  [REJECTRECORD_SOURCECODE4] [nchar](1) NOT NULL,
  [REJECTRECORD_SOURCECODE5] [nchar](1) NOT NULL,
  [REJECTRECORD_SOURCECODE6] [nchar](1) NOT NULL,
  [REJECTRECORD_SOURCECODE7] [nchar](1) NOT NULL,
  [REJECTRECORD_SOURCECODE8] [nchar](1) NOT NULL,
  [REJECTRECORD_SOURCECODE9] [nchar](1) NOT NULL,
  [REJECTRECORD_SOURCECODE10] [nchar](1) NOT NULL,
  [REJECTRECORD_STATE] [nvarchar](2) NULL,
  [REJECTRECORD_STREET1] [nvarchar](40) NULL,
  [REJECTRECORD_STREET2] [nvarchar](40) NULL,
  [REJECTRECORD_TRANSACTIONDATE] [datetime] NOT NULL,
  [REJECTRECORD_ZIPCODE] [char](9) NULL,
  CONSTRAINT [PK_RejectRecords] PRIMARY KEY CLUSTERED ([REJECTRECORD_ID])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_RejectRecords_BatchDate]
  ON [dbo].[colpenn_RejectRecords] ([REJECTRECORD_BATCHDATE])
  ON [PRIMARY]
GO

CREATE INDEX [IX_RejectRecords_CoverageCode]
  ON [dbo].[colpenn_RejectRecords] ([REJECTRECORD_COVERAGECODE])
  ON [PRIMARY]
GO

CREATE INDEX [IX_RejectRecords_Effort]
  ON [dbo].[colpenn_RejectRecords] ([REJECTRECORD_EFFORT])
  ON [PRIMARY]
GO

CREATE INDEX [IX_RejectRecords_MailDate]
  ON [dbo].[colpenn_RejectRecords] ([REJECTRECORD_MAILDATE])
  ON [PRIMARY]
GO

CREATE INDEX [IX_RejectRecords_PrintKey]
  ON [dbo].[colpenn_RejectRecords] ([REJECTRECORD_PRINTKEY])
  ON [PRIMARY]
GO

CREATE INDEX [IX_RejectRecords_SourceCode1]
  ON [dbo].[colpenn_RejectRecords] ([REJECTRECORD_SOURCECODE1])
  ON [PRIMARY]
GO

CREATE INDEX [IX_RejectRecords_SourceCode10]
  ON [dbo].[colpenn_RejectRecords] ([REJECTRECORD_SOURCECODE10])
  ON [PRIMARY]
GO

CREATE INDEX [IX_RejectRecords_SourceCode2]
  ON [dbo].[colpenn_RejectRecords] ([REJECTRECORD_SOURCECODE2])
  ON [PRIMARY]
GO

CREATE INDEX [IX_RejectRecords_SourceCode3]
  ON [dbo].[colpenn_RejectRecords] ([REJECTRECORD_SOURCECODE3])
  ON [PRIMARY]
GO

CREATE INDEX [IX_RejectRecords_SourceCode4]
  ON [dbo].[colpenn_RejectRecords] ([REJECTRECORD_SOURCECODE4])
  ON [PRIMARY]
GO

CREATE INDEX [IX_RejectRecords_SourceCode5]
  ON [dbo].[colpenn_RejectRecords] ([REJECTRECORD_SOURCECODE5])
  ON [PRIMARY]
GO

CREATE INDEX [IX_RejectRecords_SourceCode6]
  ON [dbo].[colpenn_RejectRecords] ([REJECTRECORD_SOURCECODE6])
  ON [PRIMARY]
GO

CREATE INDEX [IX_RejectRecords_SourceCode7]
  ON [dbo].[colpenn_RejectRecords] ([REJECTRECORD_SOURCECODE7])
  ON [PRIMARY]
GO

CREATE INDEX [IX_RejectRecords_SourceCode8]
  ON [dbo].[colpenn_RejectRecords] ([REJECTRECORD_SOURCECODE8])
  ON [PRIMARY]
GO

CREATE INDEX [IX_RejectRecords_SourceCode9]
  ON [dbo].[colpenn_RejectRecords] ([REJECTRECORD_SOURCECODE9])
  ON [PRIMARY]
GO

CREATE INDEX [IX_RejectRecords_TransactionDate]
  ON [dbo].[colpenn_RejectRecords] ([REJECTRECORD_TRANSACTIONDATE])
  ON [PRIMARY]
GO