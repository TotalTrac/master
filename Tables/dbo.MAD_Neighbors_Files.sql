CREATE TABLE [dbo].[MAD_Neighbors_Files] (
  [id] [int] IDENTITY,
  [filename] [varchar](100) NOT NULL,
  [uploadedatetime] [datetime] NOT NULL CONSTRAINT [DF_MAD_Neighbors_Files_uploadedatetime] DEFAULT (getutcdate()),
  [processeddatetime] [datetime] NULL,
  CONSTRAINT [PK_MAD_Neighbors_Files] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO