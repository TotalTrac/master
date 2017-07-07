SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[PostageAccountsGetAvailablePostage]
  @Result Decimal(11,2) output
  AS 
BEGIN
	SET NOCOUNT ON;

  DECLARE @Received DECIMAL(11,2);
  DECLARE @Refund DECIMAL(11,2);
	DECLARE @Usage DECIMAL(11,2);	
	

	Set @Received = (SELECT ISNULL((SUM(a.AmountReceived)), 0) AS RECEIVED
	FROM (
		SELECT pa.Id AS paId,
      pr.AccountId,
      pr.AmountReceived
       
		FROM [usps].[PostageAccounts] pa
		JOIN [usps].[PostageReceipts] pr
    ON pr.AccountId = pa.Id		 	)a
	  );
	Set @Refund = (SELECT ISNULL((SUM(a.RefundAmount)), 0) AS RECEIVED
	FROM (
		SELECT pa.Id AS paId,
      pr.AccountId,
      pr.RefundAmount
       
		FROM [usps].[PostageAccounts] pa
		JOIN [usps].PostageRefunds pr
    ON pr.AccountId = pa.Id		 	)a
	  );

Set @Usage = (SELECT ISNULL(SUM(pui.Actual), 0) AS USAGE 
		FROM [usps].[PostageUsageItems] pui
		);
Set @Result = @Received - @Usage - @Refund
  END
  
GO