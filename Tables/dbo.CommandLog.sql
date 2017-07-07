CREATE TABLE [dbo].[CommandLog] (
  [ID] [int] IDENTITY,
  [DatabaseName] [sysname] NULL,
  [SchemaName] [sysname] NULL,
  [ObjectName] [sysname] NULL,
  [ObjectType] [char](2) NULL,
  [IndexName] [sysname] NULL,
  [IndexType] [tinyint] NULL,
  [StatisticsName] [sysname] NULL,
  [PartitionNumber] [int] NULL,
  [ExtendedInfo] [xml] NULL,
  [Command] [nvarchar](max) NOT NULL,
  [CommandType] [nvarchar](60) NOT NULL,
  [StartTime] [datetime] NOT NULL,
  [EndTime] [datetime] NULL,
  [ErrorNumber] [int] NULL,
  [ErrorMessage] [nvarchar](max) NULL,
  CONSTRAINT [PK_CommandLog] PRIMARY KEY CLUSTERED ([ID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO