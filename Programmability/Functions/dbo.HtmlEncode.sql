SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[HtmlEncode]
(
    @UnEncoded as varchar(500)
)
RETURNS varchar(500)
AS
BEGIN
  DECLARE @Encoded as varchar(500)

  --order is important here. Replace the amp first, then the lt and gt. 
  --otherwise the &lt will become &amp;lt; 
  SELECT @Encoded = 
  Replace(
    Replace(
      Replace(@UnEncoded,'&','&amp;'),
    '<', '&lt;'),
  '>', '&gt;')

  RETURN @Encoded
END
GO