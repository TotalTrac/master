﻿CREATE TABLE [maponics].[ZipCodeHouseholdStaging] (
  [zip] [char](5) NOT NULL,
  [hh_total] [int] NOT NULL,
  [hh_wt_n_hs] [int] NOT NULL,
  [hh_wt_hs] [int] NOT NULL,
  [hh_bk_n_hs] [int] NOT NULL,
  [hh_bk_hs] [int] NOT NULL,
  [hh_ak_n_hs] [int] NOT NULL,
  [hh_ak_hs] [int] NOT NULL,
  [hh_as_n_hs] [int] NOT NULL,
  [hh_as_hs] [int] NOT NULL,
  [hh_pi_n_hs] [int] NOT NULL,
  [hh_pi_hs] [int] NOT NULL,
  [hh_or_n_hs] [int] NOT NULL,
  [hh_or_hs] [int] NOT NULL,
  [hh_2r_n_hs] [int] NOT NULL,
  [hh_2r_hs] [int] NOT NULL,
  [hh_fam] [int] NOT NULL,
  [hh_fam_2p] [int] NOT NULL,
  [hh_fam_3p] [int] NOT NULL,
  [hh_fam_4p] [int] NOT NULL,
  [hh_fam_5p] [int] NOT NULL,
  [hh_fam_6p] [int] NOT NULL,
  [hh_fam_7p] [int] NOT NULL,
  [hh_nofam] [int] NOT NULL,
  [hh_nofam1] [int] NOT NULL,
  [hh_nofam2] [int] NOT NULL,
  [hh_nofam3] [int] NOT NULL,
  [hh_nofam4] [int] NOT NULL,
  [hh_nofam5] [int] NOT NULL,
  [hh_nofam6] [int] NOT NULL,
  [hh_nofam7p] [int] NOT NULL,
  [fm_total] [int] NOT NULL,
  [fmhwc_u18] [int] NOT NULL,
  [fmhwc_u6] [int] NOT NULL,
  [fmhwc_0_17] [int] NOT NULL,
  [fmhwc_6_17] [int] NOT NULL,
  [fmhwnc_u18] [int] NOT NULL,
  [fmnwoc_u18] [int] NOT NULL,
  [fmnwoc_u6] [int] NOT NULL,
  [fmnwoc0_17] [int] NOT NULL,
  [fmnwoc6_17] [int] NOT NULL,
  [fmnwnocu18] [int] NOT NULL,
  [ffnhoc_u18] [int] NOT NULL,
  [ffnhoc_u6] [int] NOT NULL,
  [ffnhoc0_17] [int] NOT NULL,
  [ffnhoc6_17] [int] NOT NULL,
  [ffnhocu18] [int] NOT NULL,
  [iu25_u10k] [int] NOT NULL,
  [iu25_u15k] [int] NOT NULL,
  [iu25_u20k] [int] NOT NULL,
  [iu25_u25k] [int] NOT NULL,
  [iu25_u30k] [int] NOT NULL,
  [iu25_u35k] [int] NOT NULL,
  [iu25_u40k] [int] NOT NULL,
  [iu25_u45k] [int] NOT NULL,
  [iu25_u50k] [int] NOT NULL,
  [iu25_u60k] [int] NOT NULL,
  [iu25_u75k] [int] NOT NULL,
  [iu25_u100k] [int] NOT NULL,
  [iu25_u125k] [int] NOT NULL,
  [iu25_u150k] [int] NOT NULL,
  [iu25_u200k] [int] NOT NULL,
  [iu25_p200k] [int] NOT NULL,
  [iu44_u10k] [int] NOT NULL,
  [iu44_u15k] [int] NOT NULL,
  [iu44_u20k] [int] NOT NULL,
  [iu44_u25k] [int] NOT NULL,
  [iu44_u30k] [int] NOT NULL,
  [iu44_u35k] [int] NOT NULL,
  [iu44_u40k] [int] NOT NULL,
  [iu44_u45k] [int] NOT NULL,
  [iu44_u50k] [int] NOT NULL,
  [iu44_u60k] [int] NOT NULL,
  [iu44_u75k] [int] NOT NULL,
  [iu44_100k] [int] NOT NULL,
  [iu44_u125k] [int] NOT NULL,
  [iu44_u150k] [int] NOT NULL,
  [iu44_u200k] [int] NOT NULL,
  [iu44_p200k] [int] NOT NULL,
  [iu64_u10k] [int] NOT NULL,
  [iu64_u15k] [int] NOT NULL,
  [iu64_u20k] [int] NOT NULL,
  [iu64_u25k] [int] NOT NULL,
  [iu64_u30k] [int] NOT NULL,
  [iu64_u35k] [int] NOT NULL,
  [iu64_u40k] [int] NOT NULL,
  [iu64_u45k] [int] NOT NULL,
  [iu64_u50k] [int] NOT NULL,
  [iu64_u60k] [int] NOT NULL,
  [iu64_u75k] [int] NOT NULL,
  [iu64_u100k] [int] NOT NULL,
  [iu64_u125k] [int] NOT NULL,
  [iu64_u150k] [int] NOT NULL,
  [iu64_u200k] [int] NOT NULL,
  [iu64_p200k] [int] NOT NULL,
  [io65_u10k] [int] NOT NULL,
  [io65_u15k] [int] NOT NULL,
  [io65_u20k] [int] NOT NULL,
  [io65_u25k] [int] NOT NULL,
  [io65_u30k] [int] NOT NULL,
  [io65_u35k] [int] NOT NULL,
  [io65_u40k] [int] NOT NULL,
  [io65_u45k] [int] NOT NULL,
  [io65_u50k] [int] NOT NULL,
  [io65_u60k] [int] NOT NULL,
  [io65_u75k] [int] NOT NULL,
  [io65_u100k] [int] NOT NULL,
  [io65_u125k] [int] NOT NULL,
  [io65_u150k] [int] NOT NULL,
  [io65_u200k] [int] NOT NULL,
  [io65_p200k] [int] NOT NULL,
  [lng_hme_en] [int] NOT NULL,
  [lng_hme_sp] [int] NOT NULL,
  [lng_hme_ie] [int] NOT NULL,
  [lng_hme_ap] [int] NOT NULL,
  [lng_hme_o] [int] NOT NULL,
  [ctx_ver] [char](7) NOT NULL,
  [ver] [char](6) NOT NULL
)
ON [PRIMARY]
GO

CREATE INDEX [IX_ZipCode]
  ON [maponics].[ZipCodeHouseholdStaging] ([zip])
  ON [PRIMARY]
GO