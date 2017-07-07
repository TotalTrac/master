CREATE TABLE [maponics].[ZipCodeSalesStaging] (
  [zip] [char](5) NOT NULL,
  [sfr_sales] [int] NULL,
  [sfr_vol] [int] NULL,
  [sfr_avg] [int] NULL,
  [sfr_med] [int] NULL,
  [sfr_mkt_avg] [int] NULL,
  [sfr_mkt_med] [int] NULL,
  [sfr_ltv_avg] [decimal](3, 2) NULL,
  [sfr_ltv_med] [decimal](3, 2) NULL,
  [cnd_sales] [int] NULL,
  [cnd_vol] [int] NULL,
  [cnd_avg] [int] NULL,
  [cnd_med] [int] NULL,
  [cnd_mkt_avg] [int] NULL,
  [cnd_mkt_med] [int] NULL,
  [cnd_ltv_avg] [decimal](3, 2) NULL,
  [cnd_ltv_med] [decimal](3, 2) NULL,
  [res_trend] [char](1) NOT NULL,
  [avg_trend] [char](1) NOT NULL,
  [turnover] [decimal](3, 2) NULL,
  [velocity] [int] NULL,
  [ctx_ver] [char](7) NOT NULL,
  [ver] [char](6) NOT NULL
)
ON [PRIMARY]
GO

CREATE INDEX [IX_ZipCode]
  ON [maponics].[ZipCodeSalesStaging] ([zip])
  ON [PRIMARY]
GO