﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[ClientCreationRequestUpdate]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[ClientCreationRequestUpdate]
-- Date Generated: Friday, August 19, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[ClientCreationRequestUpdate]
@Version				timestamp,
	@Id int,
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
	--@Nonprofitauth char(10),
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

UPDATE [dbo].[ClientCreationRequests] SET
	[Address1] = @Address1,
	[Address2] = @Address2,
	[ApprovedById] = @Approvedbyid,
	[Branded] = @Branded,
	[City] = @City,
	[Contact] = @Contact,
	[Created] = @Created,
	[CreatedById] = @Createdbyid,
	[Email] = @Email,
	[Favicon] = @Favicon,
	[Fax] = @Fax,
	[Internal] = @Internal,
	[LegalName] = @Legalname,
	[Name] = @Name,
	--[NonProfitAuth] = @Nonprofitauth,
	[ParentId] = @Parentid,
	[Phone] = @Phone,
	[PostalCode] = @Postalcode,
	[Region] = @Region,
	[ShortName] = @Shortname,
	[State] = @State,
	[StyleSheet] = @Stylesheet,
	[SubDomain] = @Subdomain,
	[Url] = @Url,
	[Vendor] = @Vendor
    OUTPUT inserted.Id AS [ID], inserted.[RowVersion] as [VERSION]
WHERE
	[Id] = @Id
AND [RowVersion] = @Version	

--endregion

GO