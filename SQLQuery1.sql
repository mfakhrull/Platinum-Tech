CREATE TABLE [dbo].[Categories] (
	[CatId] INT IDENTITY (1,1) NOT NULL,
	[CatName] VARCHAR (50) NULL,
	[CatDesc] VARCHAR (500) NULL,
	PRIMARY KEY CLUSTERED ([CatId] ASC)
);

CREATE TABLE [dbo].[Items] (
	[ItemId] INT IDENTITY (1,1) NOT NULL,
	[CatId] INT NOT NULL,
	[ItemTitle] VARCHAR (50) NULL,
	[ItemPrice] FLOAT (53) NULL,
	[ItemDesc] VARCHAR (500) NULL,
	[ItemImage] VARCHAR (50) NULL,
	PRIMARY KEY CLUSTERED ([ItemId] ASC),
	CONSTRAINT [FK_Items_Categories] FOREIGN KEY ([CatId]) REFERENCES [dbo].[Categories] ([CatId])
);

CREATE TABLE [dbo].[Sales](
	[SalesId] VARCHAR(10) NOT NULL,
	[ItemId] INT NOT NULL,
	[Quantity] INT NULL,
	[SalesDate] DATETIME NULL,
	[Confirmed] BIT DEFAULT 0 NOT NULL,
	PRIMARY KEY CLUSTERED ([SalesId] ASC, [ItemId] ASC)
);

CREATE TABLE [dbo].[UserAccount] (
	[Id] INT IDENTITY (1,1) NOT NULL,
	[UserName] VARCHAR (50) NULL,
	[PasswordHash] VARCHAR(100) NULL,
	[Role] VARCHAR(10) NULL,
	[Enable] BIT NULL,
	PRIMARY KEY CLUSTERED ([Id] ASC)
);

