CREATE TABLE [dbo].[OperationsStaging] (
  [machinetype] [varchar](50) NULL,
  [code] [varchar](max) NULL,
  [equipmentdesc] [varchar](max) NULL,
  [stoptheclock] [varchar](max) NULL,
  [cutoff] [varchar](max) NULL,
  [type] [varchar](max) NULL,
  [mailtype] [varchar](max) NULL,
  [maillevel] [varchar](max) NULL,
  [phase] [varchar](max) NULL,
  [process] [varchar](max) NULL
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO