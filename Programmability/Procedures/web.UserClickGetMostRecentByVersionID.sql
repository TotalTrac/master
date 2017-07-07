﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[UserClickGetMostRecentByVersionID] 
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;
    
    DECLARE @Clicks TABLE
	(
		CLICK_DATETIME			datetime
		, CLICK_ID				int
		, CLICK_IPADDRESS		varbinary(8)
		, CLICK_IPCITYNAME		nvarchar(100)
		, CLICK_IPCOUNTRYCODE	char(2)
		, CLICK_IPLATITUDE		decimal(9,6)
		, CLICK_IPLONGITUDE		decimal(9,6)
		, CLICK_IPREGIONCODE	char(2)
		, CLICK_IPPOSTALCODE	varchar(15)
		, CLICK_SESSIONID		nvarchar(24)
		, CLICK_TARGETID		int
		, CLICK_TYPE			int
		, CLICK_USERAGENT		nvarchar(4000)
		, CLICK_USERID			int
	)
	
	INSERT INTO @Clicks 
	( 
		CLICK_DATETIME
		, CLICK_ID
		, CLICK_IPADDRESS
		, CLICK_IPCITYNAME
		, CLICK_IPCOUNTRYCODE
		, CLICK_IPLATITUDE
		, CLICK_IPLONGITUDE
		, CLICK_IPREGIONCODE
		, CLICK_IPPOSTALCODE
		, CLICK_SESSIONID
		, CLICK_TARGETID
		, CLICK_TYPE
		, CLICK_USERAGENT
		, CLICK_USERID
	)	
	SELECT TOP 1
		lc.LINKCLICK_DATETIME
		, uc.USERLINKCLICK_ID
		, lc.LINKCLICK_IPADDRESS
		, lc.LINKCLICK_IPCITYNAME
		, lc.LINKCLICK_IPCOUNTRYCODE
		, lc.LINKCLICK_IPLATITUDE
		, lc.LINKCLICK_IPLONGITUDE
		, lc.LINKCLICK_IPREGIONCODE
		, lc.LINKCLICK_IPPOSTALCODE
		, lc.LINKCLICK_SESSIONID
		, lc.LINKCLICK_LINKID
		, 1
		, lc.LINKCLICK_USERAGENT
		,uc.USERLINKCLICK_USERID
	FROM
		[web].[UserLinkClicks] AS uc
		INNER JOIN [web].[LinkClicks] AS lc
			ON uc.USERLINKCLICK_LINKCLICKID = lc.LINKCLICK_ID
		INNER JOIN [web].[Links] AS l
			ON lc.LINKCLICK_LINKID = l.LINK_ID	
		INNER JOIN [web].[Pages] AS p
			ON l.LINK_PAGEID = p.PAGE_ID			
	WHERE
		p.PAGE_VERSIONID = @ID	
	ORDER BY
		lc.LINKCLICK_DATETIME DESC;
		
	
	INSERT INTO @Clicks 
	( 
		CLICK_DATETIME
		, CLICK_ID
		, CLICK_IPADDRESS
		, CLICK_IPCITYNAME
		, CLICK_IPCOUNTRYCODE
		, CLICK_IPLATITUDE
		, CLICK_IPLONGITUDE
		, CLICK_IPREGIONCODE
		, CLICK_IPPOSTALCODE
		, CLICK_SESSIONID
		, CLICK_TARGETID
		, CLICK_TYPE
		, CLICK_USERAGENT
		, CLICK_USERID
	)
	SELECT TOP 1
		bc.BUTTONCLICK_DATETIME
		, uc.USERBUTTONCLICK_ID
		, bc.BUTTONCLICK_IPADDRESS
		, bc.BUTTONCLICK_IPCITYNAME
		, bc.BUTTONCLICK_IPCOUNTRYCODE
		, bc.BUTTONCLICK_IPLATITUDE
		, bc.BUTTONCLICK_IPLONGITUDE
		, bc.BUTTONCLICK_IPREGIONCODE
		, bc.BUTTONCLICK_IPPOSTALCODE
		, bc.BUTTONCLICK_SESSIONID
		, bc.BUTTONCLICK_BUTTONID
		, 0
		, bc.BUTTONCLICK_USERAGENT
		,uc.USERBUTTONCLICK_USERID
	FROM
		[web].[UserButtonClicks] AS uc
		INNER JOIN [web].[ButtonClicks] AS bc
			ON uc.USERBUTTONCLICK_BUTTONCLICKID = bc.BUTTONCLICK_ID
		INNER JOIN [web].[Buttons] AS b
			ON bc.BUTTONCLICK_BUTTONID = b.BUTTON_ID	
		INNER JOIN [web].[Pages] AS p
			ON b.BUTTON_PAGEID = p.PAGE_ID			
	WHERE
		p.PAGE_VERSIONID = @ID	
	ORDER BY
		bc.BUTTONCLICK_DATETIME DESC;
	
	SELECT TOP 1 
		CLICK_DATETIME
		, CLICK_ID
		, CLICK_IPADDRESS
		, CLICK_IPCITYNAME
		, CLICK_IPCOUNTRYCODE
		, CLICK_IPLATITUDE
		, CLICK_IPLONGITUDE
		, CLICK_IPREGIONCODE
		, CLICK_IPPOSTALCODE
		, CLICK_SESSIONID
		, CLICK_TARGETID
		, CLICK_TYPE
		, CLICK_USERAGENT
		, CLICK_USERID
	FROM 
		@Clicks
	ORDER BY
		CLICK_DATETIME DESC;
	
END
GO