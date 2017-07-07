CREATE TABLE [usps].[FacilityServiceAreas] (
  [SERVICEAREA_ID] [int] IDENTITY (-2147483648, 1),
  [SERVICEAREA_FACILITYID] [int] NOT NULL,
  [SERVICEAREA_START] [char](3) NOT NULL,
  [SERVICEAREA_END] [char](3) NOT NULL,
  CONSTRAINT [PK_FacilityServiceAreas] PRIMARY KEY CLUSTERED ([SERVICEAREA_ID])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_FacilityServiceAreas_FacilityID]
  ON [usps].[FacilityServiceAreas] ([SERVICEAREA_FACILITYID])
  ON [PRIMARY]
GO

ALTER TABLE [usps].[FacilityServiceAreas]
  ADD CONSTRAINT [FK_FacilityServiceAreas_Facilities] FOREIGN KEY ([SERVICEAREA_FACILITYID]) REFERENCES [usps].[Facilities] ([FACILITY_ID]) ON DELETE CASCADE
GO