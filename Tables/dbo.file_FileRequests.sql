CREATE TABLE [dbo].[file_FileRequests] (
  [Id] [int] IDENTITY (-2147483648, 1),
  [AccessKey] [nvarchar](128) NOT NULL,
  [Created] [datetime] NOT NULL,
  [CreatedById] [int] NOT NULL,
  [FolderId] [int] NOT NULL,
  [Host] [nvarchar](4000) NOT NULL,
  [Message] [nvarchar](max) NOT NULL,
  [SubjectLine] [nvarchar](500) NOT NULL,
  [UserId] [int] NOT NULL,
  CONSTRAINT [PK_file_Requests] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO