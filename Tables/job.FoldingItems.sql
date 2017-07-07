CREATE TABLE [job].[FoldingItems] (
  [Id] [int] IDENTITY,
  [BoweBottom] [decimal](6, 4) NULL CONSTRAINT [DF_tblFoldingItems_FOLDINGITEM_BOWEBOTTOM] DEFAULT (0.0),
  [BoweFixed] [decimal](6, 4) NULL CONSTRAINT [DF_tblFoldingItems_FOLDINGITEM_BOWEFIXED] DEFAULT (0.0),
  [BoweTop] [decimal](6, 4) NULL CONSTRAINT [DF_tblFoldingItems_FOLDINGITEM_BOEWTOP] DEFAULT (0.0),
  [Description] [varchar](max) NULL,
  [FoldTypeId] [int] NOT NULL,
  [GutterTrim] [decimal](5, 3) NULL CONSTRAINT [DF_tblFoldingItems_FOLDINGITEM_GUTTERTRIM] DEFAULT (0.0),
  [Height] [decimal](5, 3) NULL CONSTRAINT [DF_tblFoldingItems_FOLDINGITEM_HEIGHT] DEFAULT (0.0),
  [InsertItemId] [int] NOT NULL CONSTRAINT [DF_tblFoldingItems_FOLDINGITEM_INSERTID] DEFAULT (0),
  [Interstack] [bit] NOT NULL CONSTRAINT [DF_tblFoldingItems_FOLDINGITEM_INTERSTACK] DEFAULT (0),
  [IsBoweFixedDistance] [bit] NULL CONSTRAINT [DF_tblFoldingItems_FOLDINGITEM_ISFIXEDDISTANCE] DEFAULT (0),
  [LayoutOut] [int] NULL CONSTRAINT [DF_tblFoldingItems_FOLDINGITEM_LAYOUTOUT] DEFAULT (0),
  [LayoutUp] [int] NULL CONSTRAINT [DF_tblFoldingItems_FOLDINGITEM_LAYOUTUP] DEFAULT (0),
  [LeftTrim] [decimal](5, 3) NULL CONSTRAINT [DF_tblFoldingItems_FOLDINGITEM_LEFTTRIM] DEFAULT (0.0),
  [SlitNest] [bit] NOT NULL CONSTRAINT [DF_tblFoldingItems_FOLDINGITEM_SLITNEST] DEFAULT (0),
  [FirstFold] [decimal](5, 3) NULL CONSTRAINT [DF_tblFoldingItems_FOLDINGITEM_FIRSTFOLD] DEFAULT (0.0),
  [SecondFold] [decimal](5, 3) NULL CONSTRAINT [DF_tblFoldingItems_FOLDINGITEM_SECONDFOLD] DEFAULT (0.0),
  [ThirdFold] [decimal](5, 3) NULL CONSTRAINT [DF_tblFoldingItems_FOLDINGITEM_THIRDFOLD] DEFAULT (0.0),
  [FourthFold] [decimal](5, 3) NULL CONSTRAINT [DF_tblFoldingItems_FOLDINGITEM_FOURTHFOLD] DEFAULT (0.0),
  [RightTrim] [decimal](5, 3) NULL CONSTRAINT [DF_tblFoldingItems_FOLDINGITEM_RIGHTTRIM] DEFAULT (0.0),
  [StartTime] [datetime] NULL,
  [EndTime] [datetime] NULL,
  [Width] [decimal](5, 3) NULL CONSTRAINT [DF_tblFoldingItems_FOLDINGITEM_WIDTH] DEFAULT (0.0),
  [RowVersion] [timestamp],
  CONSTRAINT [PK_tblFoldingItems] PRIMARY KEY CLUSTERED ([Id]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE INDEX [IX_tblFoldingItems_InsertItemId]
  ON [job].[FoldingItems] ([InsertItemId])
  WITH (FILLFACTOR = 90)
  ON [PRIMARY]
GO