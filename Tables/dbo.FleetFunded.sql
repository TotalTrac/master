CREATE TABLE [dbo].[FleetFunded] (
  [id] [int] IDENTITY,
  [alid] [varchar](25) NULL,
  [firstname] [varchar](50) NULL,
  [lastname] [varchar](50) NULL,
  [state] [varchar](5) NULL,
  [fundeddate] [date] NULL,
  CONSTRAINT [PK_FleetFunded] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO