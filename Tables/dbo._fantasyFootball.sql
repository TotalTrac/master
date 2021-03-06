﻿CREATE TABLE [dbo].[_fantasyFootball] (
  [id] [int] IDENTITY,
  [fName] [varchar](50) NOT NULL,
  [lName] [varchar](50) NOT NULL,
  [email] [varchar](100) NOT NULL,
  [phoneNumber] [varchar](15) NOT NULL,
  [companyName] [varchar](75) NOT NULL,
  [jobTitle] [varchar](75) NOT NULL,
  [nfcEast] [varchar](50) NOT NULL,
  [nfcSouth] [varchar](50) NOT NULL,
  [nfcNorth] [varchar](50) NOT NULL,
  [nfcWest] [varchar](50) NOT NULL,
  [nfcWildcard] [varchar](50) NOT NULL,
  [nfcWildcard2] [varchar](50) NOT NULL,
  [afcEast] [varchar](50) NOT NULL,
  [afcSouth] [varchar](50) NOT NULL,
  [afcNorth] [varchar](50) NOT NULL,
  [afcWest] [varchar](50) NOT NULL,
  [afcWildcard] [varchar](50) NOT NULL,
  [afcWildcard2] [varchar](50) NOT NULL,
  [nfcConfTeam] [varchar](50) NOT NULL,
  [nfcConfTeam2] [varchar](50) NOT NULL,
  [afcConfTeam] [varchar](50) NOT NULL,
  [afcConfTeam2] [varchar](50) NOT NULL,
  [nfcChamp] [varchar](50) NOT NULL,
  [afcChamp] [varchar](50) NOT NULL,
  [superbowlChamp] [varchar](50) NOT NULL,
  [superbowlScore] [varchar](50) NOT NULL,
  [mvp] [varchar](100) NOT NULL,
  [datetime] [datetime] NOT NULL DEFAULT (getdate())
)
ON [PRIMARY]
GO