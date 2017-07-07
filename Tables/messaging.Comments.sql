CREATE TABLE [messaging].[Comments] (
  [Id] [int] IDENTITY,
  [Content] [varchar](max) NULL,
  [Created] [datetime] NOT NULL,
  [CreatedByAdmin] [bit] NULL,
  [CreatedByCurrentUser] [bit] NULL,
  [CreatedById] [int] NULL,
  [Creator] [int] NULL,
  [Deleted] [bit] NULL,
  [FileId] [int] NULL,
  [FileName] [varchar](5000) NULL,
  [FileSource] [varbinary](max) NULL,
  [FileMimeType] [varchar](1000) NULL,
  [FileUrl] [varchar](1000) NULL,
  [Fullname] [varchar](1000) NULL,
  [IsNew] [bit] NULL,
  [Modified] [datetime] NULL,
  [Pings] [varchar](max) NULL,
  [Parent] [int] NULL,
  [ProfileUrl] [varchar](500) NULL,
  [ProfilePictureUrl] [varchar](500) NULL,
  [ThreadId] [int] NULL,
  [UpVoteCount] [int] NULL,
  [UserHasUpvoted] [bit] NULL,
  [RowVersion] [timestamp] NULL,
  CONSTRAINT [PK_Comments_copy] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [messaging].[Comments]
  ADD CONSTRAINT [FK_Comments_CommentThreads_Id_copy] FOREIGN KEY ([ThreadId]) REFERENCES [dbo].[CommentThreads] ([Id])
GO