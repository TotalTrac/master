SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[Maintenance_GetProcedureStats]

AS
BEGIN
	SELECT 
		OBJECT_NAME(st.objectid) AS [Name]
		, total_worker_time/execution_count AS [Avg CPU Time]
		, execution_count
	FROM 
		sys.dm_exec_query_stats AS qs
		CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) AS st
	ORDER BY 
		[Name];
END
GO