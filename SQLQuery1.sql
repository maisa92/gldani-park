USE [GldaniPark]
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetCardBalance]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetCardBalance](
@CardId NCHAR(6), 
@Date datetime
)
RETURNS decimal(18,4)
AS
BEGIN 
 
DECLARE @Income DECIMAL(18,4)
DECLARE @Outcome DECIMAL(18,4)


SET @Income = (SELECT SUM(Amount) FROM dbo.Transactions
WHERE  CardId = @CardId AND TransactionDate < @Date AND Type = 0)
 
SET @Outcome = (SELECT SUM(Amount) FROM dbo.Transactions
WHERE CardId = @CardId AND TransactionDate < @Date AND Type = 1)

RETURN ISNULL(@Income,0) - ISNULL(@Outcome,0)  
END
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Attractions]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Attractions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AttractionId] [varchar](2) NULL,
	[Price] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Attractions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cards]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CardId] [varchar](6) NOT NULL,
	[CardPrice] [decimal](18, 2) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Cards] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transactions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Type] [bit] NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[AttractionId] [varchar](2) NULL,
	[CardId] [varchar](6) NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
/****** Object:  StoredProcedure [dbo].[spAddBalanceToCard]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAddBalanceToCard]
    @CardId NVARCHAR(6) ,
    @Balance DECIMAL(18, 2)
AS
    BEGIN
        INSERT INTO dbo.Transactions (   Type ,
                                         Amount ,
                                         TransactionDate ,
                                         AttractionId ,
                                         CardId
                                     )
        VALUES (   0 ,         -- Type - bit
                   @Balance ,  -- Amount - decimal(18, 2)
                   GETDATE() , -- TransactionDate - datetime
                   NULL ,      -- AttractionId - varchar(2)
                   @CardId     -- CardId - varchar(6)
               );
        SELECT dbo.fnGetCardBalance(@CardId, GETDATE()) AS Balance;

    END;
GO
/****** Object:  StoredProcedure [dbo].[spAnalysisOfIncomingFunds]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAnalysisOfIncomingFunds]
@StartDate DATETIME,
@EndDate DATETIME
AS
BEGIN 

SELECT  ISNULL(sum(Amount), 0) Income FROM dbo.Transactions WHERE TransactionDate > @StartDate AND TransactionDate <= @EndDate AND Type = 0 

end

GO
/****** Object:  StoredProcedure [dbo].[spAttractionAnalysis]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spAttractionAnalysis]
@StartDate DATETIME,
@EndDate DATETIME
AS
BEGIN  
SELECT * FROM dbo.Transactions WHERE TransactionDate > @StartDate AND TransactionDate <= @EndDate AND Type = 1
end


GO
/****** Object:  StoredProcedure [dbo].[spCardHistory]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCardHistory]
@CardId VARCHAR(6) 
AS
BEGIN
SELECT 
TOP 1
 CardId,
 CardPrice,
 CreateDate,
 RestAmount = dbo.fnGetCardBalance(@CardId,GETDATE()),
 IsActive
 FROM dbo.Cards WHERE CardId = @CardId
 END 

GO
/****** Object:  StoredProcedure [dbo].[spCardHistoryTransactions]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCardHistoryTransactions]
@CardId VARCHAR(6) 
AS
BEGIN
SELECT * FROM dbo.Transactions WHERE CardId = @CardId
end
GO
/****** Object:  StoredProcedure [dbo].[spCardsSell]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[spCardsSell]
    @StartDate DATETIME ,
    @EndDate DATETIME
AS
    BEGIN 

        SELECT c.CardPrice AS Price,
			   COUNT(c.CardId) SellAmount,
			   0 AS  ReversedAmount
        FROM    dbo.Cards c
        WHERE   CreateDate > @StartDate
                AND CreateDate <= @EndDate
				GROUP BY c.CardPrice 
    END


GO
/****** Object:  StoredProcedure [dbo].[spCheckTransactionAndSave]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCheckTransactionAndSave]
    @CardId NVARCHAR(6) ,
    @AttractionPrice DECIMAL(18, 2) ,
    @AttractionId VARCHAR(2)
AS
    BEGIN
        BEGIN TRY
            BEGIN TRANSACTION; 

            DECLARE @Balance DECIMAL(18, 2);
            SET @Balance = dbo.fnGetCardBalance(@CardId, GETDATE());

            IF @AttractionPrice > @Balance
                BEGIN

                    SELECT @CardId AS CardId ,
                           @AttractionId AS AttractionId ,
                           @AttractionPrice AS AttractionPrice ,
                           @Balance AS Balance ,
                           '2' AS ResponseType;
                END;
            ELSE
                BEGIN

                    INSERT INTO dbo.Transactions (   Type ,
                                                     Amount ,
                                                     TransactionDate ,
                                                     AttractionId ,
                                                     CardId
                                                 )
                    VALUES (   1 ,                -- Type - bit
                               @AttractionPrice , -- Amount - decimal
                               GETDATE() ,        -- TransactionDate - datetime
                               @AttractionId ,    -- AttractionId - int
                               @CardId            -- CardId - int
                           );

                    SELECT @CardId AS CardId ,
                           @AttractionId AS AttractionId ,
                           @AttractionPrice AS AttractionPrice ,
                           @Balance -  @AttractionPrice  AS Balance ,
                           '1' AS ResponseType;

                END;
            COMMIT TRANSACTION;
        END TRY
        BEGIN CATCH
            ROLLBACK TRANSACTION; 
            SELECT '000000' AS CardId ,
                   '00' AS AttractionId ,
                    00.00 AS AttractionPrice ,
                    000.00 AS Balance ,
                   '3' AS ResponseType;
        END CATCH;

    END;
	
	
GO
/****** Object:  StoredProcedure [dbo].[spCostAnalysis]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCostAnalysis]
@StartDate DATETIME,
@EndDate DATETIME
AS
BEGIN 

 SELECT TOP 1 * FROM dbo.Attractions

end


GO
/****** Object:  StoredProcedure [dbo].[spDeleteAttraction]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDeleteAttraction]
    @Id INT
AS
    BEGIN
        DELETE FROM dbo.Attractions
        WHERE  Id = @Id;
    END;

GO
/****** Object:  StoredProcedure [dbo].[spDistributionOfTheAmountOfMoneyReceivedInMonths]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[spDistributionOfTheAmountOfMoneyReceivedInMonths]
@StartDate DATETIME,
@EndDate DATETIME
AS
BEGIN 

SELECT  SUM(Amount) Amount FROM dbo.Transactions 
WHERE TransactionDate > @StartDate AND TransactionDate <= @EndDate AND Type = 0
end

GO
/****** Object:  StoredProcedure [dbo].[spGetAttraction]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAttraction]
    @Id INT
AS
    BEGIN
        SELECT *
        FROM   GldaniPark.dbo.Attractions
        WHERE  Id = @Id;
    END;

GO
/****** Object:  StoredProcedure [dbo].[spGetAttractionList]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAttractionList]
AS
BEGIN
SELECT * FROM dbo.Attractions
end
GO
/****** Object:  StoredProcedure [dbo].[spGetAttractionPriceList]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetAttractionPriceList]
AS
BEGIN
SELECT AttractionId AS AttractionId, Price AS Price FROM dbo.Attractions
END 

GO
/****** Object:  StoredProcedure [dbo].[spGetCard]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetCard]
@Id int
AS
BEGIN
SELECT * FROM dbo.Cards WHERE Id = @Id
 END
GO
/****** Object:  StoredProcedure [dbo].[spGetCardBalance]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetCardBalance]
@CardId NVARCHAR(6)
AS
begin
SELECT dbo.fnGetCardBalance(@CardId,GETDATE()) AS Balance
end
GO
/****** Object:  StoredProcedure [dbo].[spGetCardList]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetCardList]
AS
BEGIN 
SELECT * FROM dbo.Cards
end


GO
/****** Object:  StoredProcedure [dbo].[spHourlyDistributionOfFunds]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[spHourlyDistributionOfFunds]
@StartDate DATETIME,
@EndDate DATETIME
AS
BEGIN 

SELECT  
Id AS Id,
Type AS IsOutCome,
Amount AS Amount,
TransactionDate AS TransactionDate,
AttractionId AS AttractionId, 
CardId AS CardId 
 FROM dbo.Transactions WHERE TransactionDate > @StartDate AND TransactionDate <= @EndDate
end

GO
/****** Object:  StoredProcedure [dbo].[spIsCardExist]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spIsCardExist]
    @CardId NVARCHAR(6)
AS
    BEGIN
        IF EXISTS (   SELECT *
                      FROM   dbo.Cards
                      WHERE  CardId = @CardId
                  )
            BEGIN
                SELECT 1 AS Exist;
            END;
        ELSE
            BEGIN
                SELECT 0 AS Exist;
            END;
    END;
GO
/****** Object:  StoredProcedure [dbo].[spSaveAttraction]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSaveAttraction]
@Name NVARCHAR(50),
@Price DECIMAL(18,2),
@AttractionId VARCHAR(2)
AS 
BEGIN
INSERT INTO dbo.Attractions
        ( Name, CreateDate, Price,AttractionId )
VALUES  ( @Name, -- Name - nvarchar(50)
          GETDATE(),
		  @Price,
		  @AttractionId
          )
END 
GO
/****** Object:  StoredProcedure [dbo].[spSaveCard]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spSaveCard]
@CardId INT,
@IsActive bit =null
AS 
BEGIN
INSERT INTO dbo.Cards
        ( CardId, IsActive, CreateDate )
VALUES  ( @CardId, -- CardId - int
          @IsActive, -- IsActive - bit
          GETDATE()  -- CreateDate - datetime
          ) 
END 
GO
/****** Object:  StoredProcedure [dbo].[spSaveTransaction]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSaveTransaction]
@Type  BIT,
@Amount  DECIMAL(18,2), 
@AttractionId  INT = null,
@CardId  int
AS 
BEGIN
 INSERT INTO dbo.Transactions
         ( Type ,
           Amount ,
           TransactionDate ,
           AttractionId ,
           CardId
         )
 VALUES  ( @Type,
           @Amount,
           GETDATE() ,  
           @AttractionId ,  
           @CardId   
         )
END 
GO
/****** Object:  StoredProcedure [dbo].[spUpdateAttraction]    Script Date: 3/1/2019 3:31:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spUpdateAttraction]
    @Id INT ,
    @Name NVARCHAR(100) ,
    @Price DECIMAL(18, 2)
AS
    BEGIN
        UPDATE dbo.Attractions
        SET    Name = @Name ,
               Price = @Price
        WHERE  Id = @Id;
    END;

GO
