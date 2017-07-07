SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[EventsGetMostRecentByAddressID]
	@ID		int
	, @Max	int
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @Events TABLE
	(
		Id			int
		, AddressId	int
		, [DateTime]	datetime		
		, IpAddress	varbinary(8)
		, [Type]		int
	)
	
	-- GET THE CLICKS
    INSERT INTO 
		@Events 
		(
			Id
			, AddressId
			, [DateTime]			
			, IpAddress
			, [Type]
		)
	SELECT TOP (@Max)
		c.Id
		, c.AddressId
		, c.[DateTime]
		, c.IpAddress
		, 2
	FROM
		[email].[Clicks] AS c		
	WHERE
		c.AddressId = @ID
	ORDER BY
		c.[DateTime] DESC;
		
		
	-- GET THE OPENS
    INSERT INTO 
		@Events 
		(
			Id
			, AddressId
			, [DateTime]			
			, IpAddress
			, [Type]
		)
	SELECT TOP (@Max)
		o.Id
		, o.AddressId
		, o.[DateTime]
		, o.IpAddress
		, 1
	FROM
		[email].[Opens] AS o		
	WHERE
		o.AddressId = @ID
	ORDER BY
		o.[DateTime] DESC;
		
		
	-- GET THE UNSUBSCRIBES
    INSERT INTO 
		@Events 
		(
			Id
			, AddressId
			, [DateTime]			
			, IpAddress
			, [Type]
		)
	SELECT TOP (@Max)
		u.Id
		, u.AddressId
		, u.[DateTime]
		, u.IpAddress
		, 4
	FROM
		[email].[Unsubscribes] AS u		
	WHERE
		u.AddressId = @ID
	ORDER BY
		u.[DateTime] DESC;
		
		
	-- GET THE FORWARDS
    INSERT INTO 
		@Events 
		(
			Id
			, AddressId
			, [DateTime]			
			, IpAddress
			, [Type]
		)
	SELECT TOP (@Max)
		f.Id		
		, f.ForwarderId
		, f.Forwarded
		, f.IpAddress		
		, 8
	FROM
		[email].[Forwards] AS f		
	WHERE
		f.ForwarderId = @ID
	ORDER BY
		f.Forwarded DESC;
		
		
	-- RETURN THE EVENTS
	SELECT TOP (@Max)
		Id
		, AddressId
		, [DateTime]
		, IpAddress
		, [Type]
	FROM 
		@Events
	ORDER BY
		[DateTime] DESC;
END
GO