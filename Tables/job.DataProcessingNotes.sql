CREATE TABLE [job].[DataProcessingNotes] (
  [Id] [int] IDENTITY,
  [Created] [datetime] NULL,
  [JobId] [int] NOT NULL CONSTRAINT [DF_tblDataProcessingNotes_DPNOTE_JOBID] DEFAULT (0),
  [Text] [ntext] NULL CONSTRAINT [DF_tblDataProcessingNotes_DPNOTE_TEXT] DEFAULT (''),
  [Rowversion] [timestamp],
  CONSTRAINT [PK_tblDataProcessingNotes] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [job].[DataProcessingNotes]
  ADD CONSTRAINT [FK__DataProce__JobId__69A84D12] FOREIGN KEY ([JobId]) REFERENCES [dbo].[Jobs] ([JOB_ID])
GO