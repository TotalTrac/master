﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[ClientCreationRequestInsert]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[ClientCreationRequestInsert]
-- Date Generated: Friday, August 19, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[ClientCreationRequestInsert]
	@Address1 nvarchar(100),
	@Address2 nvarchar(100),
	@Approvedbyid int,
	@Branded bit,
	@City nvarchar(50),
	@Contact nvarchar(50),
	@Created datetime,
	@Createdbyid int,
	@Email nvarchar(320),
	@Favicon nvarchar(255),
	@Fax char(15),
	@Internal bit,
	@Legalname nvarchar(200),
	@Name nvarchar(100),
--	@Nonprofitauth char(10),
	@Parentid int,
	@Phone char(15),
	@Postalcode nchar(15),
	@Region nvarchar(50),
	@Shortname nvarchar(50),
	@State int,
	@Stylesheet nvarchar(100),
	@Subdomain nvarchar(50),
	@Url nvarchar(255),
	@Vendor bit

AS

SET NOCOUNT ON

INSERT INTO [dbo].[ClientCreationRequests] (
	[Address1],
	[Address2],
	[ApprovedById],
	[Branded],
	[City],
	[Contact],
	[Created],
	[CreatedById],
	[Email],
	[Favicon],
	[Fax],
	[Internal],
	[LegalName],
	[Name],
	--[NonProfitAuth],
	[ParentId],
	[Phone],
	[PostalCode],
	[Region],
	[ShortName],
	[State],
	[StyleSheet],
	[SubDomain],
	[Url],
	[Vendor]
) 
OUTPUT		
		inserted.Id AS ID, inserted.Rowversion AS [VERSION]
VALUES (
	@Address1,
	@Address2,
	@Approvedbyid,
	@Branded,
	@City,
	@Contact,
	@Created,
	@Createdbyid,
	@Email,
	@Favicon,
	@Fax,
	@Internal,
	@Legalname,
	@Name,
	--@Nonprofitauth,
	@Parentid,
	@Phone,
	@Postalcode,
	@Region,
	@Shortname,
	@State,
	@Stylesheet,
	@Subdomain,
	@Url,
	@Vendor
)

--endregion

GO