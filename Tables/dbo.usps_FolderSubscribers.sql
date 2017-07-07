CREATE TABLE [dbo].[usps_FolderSubscribers] (
  [Id] [int] NOT NULL,
  [DisplayName] [nvarchar](100) NOT NULL,
  [EmailAddress] [nvarchar](320) NOT NULL,
  [IsActive] [bit] NOT NULL,
  [SubscriberType] [int] NOT NULL,
  CONSTRAINT [PK_usps_FolderSubscribers] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[usps_FolderSubscribers]
  ADD CONSTRAINT [FK_usps_FolderSubscribers_usps_FolderSubscriberTypes] FOREIGN KEY ([SubscriberType]) REFERENCES [dbo].[usps_FolderSubscriberTypes] ([Id]) ON DELETE CASCADE
GO