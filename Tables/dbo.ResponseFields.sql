CREATE TABLE [dbo].[ResponseFields] (
  [FIELD_ID] [int] IDENTITY (-2147483648, 1),
  [FIELD_NAME] [nvarchar](100) NOT NULL,
  [FIELD_RESPONSEID] [int] NOT NULL,
  [FIELD_VALUE] [sql_variant] NULL,
  CONSTRAINT [PK_ResponseFields] PRIMARY KEY CLUSTERED ([FIELD_ID])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_ResponseFields_ResponseID]
  ON [dbo].[ResponseFields] ([FIELD_RESPONSEID])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[ResponseFields]
  ADD CONSTRAINT [FK_ResponseFields_Responses] FOREIGN KEY ([FIELD_RESPONSEID]) REFERENCES [dbo].[Responses] ([RESPONSE_ID])
GO