CREATE TABLE [usps].[FacilitySubTypes] (
  [SUBTYPE_ID] [int] IDENTITY (-2147483648, 1),
  [SUBTYPE_NAME] [varchar](60) NOT NULL,
  [SUBTYPE_TYPEID] [int] NOT NULL,
  CONSTRAINT [PK_FacilitySubTypes] PRIMARY KEY CLUSTERED ([SUBTYPE_ID])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_FacilitySubTypes_TypeID]
  ON [usps].[FacilitySubTypes] ([SUBTYPE_TYPEID])
  ON [PRIMARY]
GO

ALTER TABLE [usps].[FacilitySubTypes]
  ADD CONSTRAINT [FK_FacilitySubTypes_FacilityTypes] FOREIGN KEY ([SUBTYPE_TYPEID]) REFERENCES [usps].[FacilityTypes] ([TYPE_ID])
GO