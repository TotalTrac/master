CREATE TABLE [keying].[Donations] (
  [id] [int] IDENTITY,
  [mailpieceid] [int] NOT NULL,
  [donation] [money] NOT NULL CONSTRAINT [DF__Donations__donat__2FFACE6A] DEFAULT (0),
  [remove] [bit] NOT NULL CONSTRAINT [DF__Donations__remov__30EEF2A3] DEFAULT (0),
  [created] [datetime] NOT NULL CONSTRAINT [DF_Donations_created] DEFAULT (getdate()),
  [downloaded] [datetime] NULL
)
ON [PRIMARY]
GO