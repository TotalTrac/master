CREATE TABLE [acs].[AddressTypes] (
  [ID] [int] IDENTITY,
  [Description] [varchar](max) NOT NULL,
  [Value] [char](1) NOT NULL,
  CONSTRAINT [PK_AddressTypes] PRIMARY KEY CLUSTERED ([ID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO