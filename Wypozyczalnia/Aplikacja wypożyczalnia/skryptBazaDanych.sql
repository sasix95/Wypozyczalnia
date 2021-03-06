USE [master]
GO
/****** Object:  Database [wypozyczalnia]    Script Date: 2018-01-16 21:12:58 ******/
CREATE DATABASE [wypozyczalnia]
GO
ALTER DATABASE [wypozyczalnia] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [wypozyczalnia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [wypozyczalnia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [wypozyczalnia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [wypozyczalnia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [wypozyczalnia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [wypozyczalnia] SET ARITHABORT OFF 
GO
ALTER DATABASE [wypozyczalnia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [wypozyczalnia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [wypozyczalnia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [wypozyczalnia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [wypozyczalnia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [wypozyczalnia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [wypozyczalnia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [wypozyczalnia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [wypozyczalnia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [wypozyczalnia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [wypozyczalnia] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [wypozyczalnia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [wypozyczalnia] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [wypozyczalnia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [wypozyczalnia] SET  MULTI_USER 
GO
ALTER DATABASE [wypozyczalnia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [wypozyczalnia] SET ENCRYPTION ON
GO
ALTER DATABASE [wypozyczalnia] SET QUERY_STORE = ON
GO
ALTER DATABASE [wypozyczalnia] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 7), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 10, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO)
GO
USE [wypozyczalnia]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET OPTIMIZE_FOR_AD_HOC_WORKLOADS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [wypozyczalnia]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_diagramobjects]    Script Date: 2018-01-16 21:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE FUNCTION [dbo].[fn_diagramobjects]() 
	RETURNS int
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		declare @id_upgraddiagrams		int
		declare @id_sysdiagrams			int
		declare @id_helpdiagrams		int
		declare @id_helpdiagramdefinition	int
		declare @id_creatediagram	int
		declare @id_renamediagram	int
		declare @id_alterdiagram 	int 
		declare @id_dropdiagram		int
		declare @InstalledObjects	int

		select @InstalledObjects = 0

		select 	@id_upgraddiagrams = object_id(N'dbo.sp_upgraddiagrams'),
			@id_sysdiagrams = object_id(N'dbo.sysdiagrams'),
			@id_helpdiagrams = object_id(N'dbo.sp_helpdiagrams'),
			@id_helpdiagramdefinition = object_id(N'dbo.sp_helpdiagramdefinition'),
			@id_creatediagram = object_id(N'dbo.sp_creatediagram'),
			@id_renamediagram = object_id(N'dbo.sp_renamediagram'),
			@id_alterdiagram = object_id(N'dbo.sp_alterdiagram'), 
			@id_dropdiagram = object_id(N'dbo.sp_dropdiagram')

		if @id_upgraddiagrams is not null
			select @InstalledObjects = @InstalledObjects + 1
		if @id_sysdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 2
		if @id_helpdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 4
		if @id_helpdiagramdefinition is not null
			select @InstalledObjects = @InstalledObjects + 8
		if @id_creatediagram is not null
			select @InstalledObjects = @InstalledObjects + 16
		if @id_renamediagram is not null
			select @InstalledObjects = @InstalledObjects + 32
		if @id_alterdiagram  is not null
			select @InstalledObjects = @InstalledObjects + 64
		if @id_dropdiagram is not null
			select @InstalledObjects = @InstalledObjects + 128
		
		return @InstalledObjects 
	END
	
GO
/****** Object:  Table [dbo].[Klient]    Script Date: 2018-01-16 21:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klient](
	[Id_klienta] [int] NOT NULL,
	[Telefon_kontaktowy] [nchar](11) NOT NULL,
	[Adres] [nvarchar](max) NOT NULL,
	[Adres_email] [nvarchar](30) NOT NULL,
	[Promocja] [decimal](4, 2) NULL,
	[Aktywnosc] [int] NULL,
	[CzyUsuniete] [bit] NULL,
 CONSTRAINT [PK_Klient] PRIMARY KEY CLUSTERED 
(
	[Id_klienta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klient_firmy]    Script Date: 2018-01-16 21:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klient_firmy](
	[Id_klienta] [int] NOT NULL,
	[Nazwa_firmy] [nvarchar](30) NOT NULL,
	[NIP] [nchar](10) NOT NULL,
	[CzyUsuniete] [bit] NULL,
 CONSTRAINT [PK_Klient_firmy] PRIMARY KEY CLUSTERED 
(
	[Id_klienta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klient_indywidualny]    Script Date: 2018-01-16 21:13:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klient_indywidualny](
	[Id_klienta] [int] NOT NULL,
	[Imię] [nvarchar](30) NOT NULL,
	[Nazwisko] [nvarchar](30) NOT NULL,
	[Numer_prawa_jazdy] [nvarchar](15) NOT NULL,
	[PESEL] [nchar](11) NOT NULL,
	[Płec] [bit] NULL,
	[CzyUsuniete] [bit] NULL,
 CONSTRAINT [PK_Klient_indywidualny] PRIMARY KEY CLUSTERED 
(
	[Id_klienta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klient_KlientFirma]    Script Date: 2018-01-16 21:13:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klient_KlientFirma](
	[Id_klienta_K] [int] NOT NULL,
	[Id_klienta_F] [int] NOT NULL,
 CONSTRAINT [PK_Klient_KlientFirma] PRIMARY KEY CLUSTERED 
(
	[Id_klienta_K] ASC,
	[Id_klienta_F] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Klient_KlientIndyw]    Script Date: 2018-01-16 21:13:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klient_KlientIndyw](
	[Id_klienta_K] [int] NOT NULL,
	[Id_klienta_I] [int] NOT NULL,
 CONSTRAINT [PK_Klient_KlientIndyw] PRIMARY KEY CLUSTERED 
(
	[Id_klienta_K] ASC,
	[Id_klienta_I] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lista_rezerwacji]    Script Date: 2018-01-16 21:13:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lista_rezerwacji](
	[RezerwacjaID_rezerwacji] [int] NOT NULL,
	[liczba rezerwacji] [int] NULL,
 CONSTRAINT [PK_Lista_rezerwacji] PRIMARY KEY CLUSTERED 
(
	[RezerwacjaID_rezerwacji] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Panel_administratora]    Script Date: 2018-01-16 21:13:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Panel_administratora](
	[Login] [nvarchar](30) NOT NULL,
	[haslo] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Panel_administratora] PRIMARY KEY CLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rezerwacja]    Script Date: 2018-01-16 21:13:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rezerwacja](
	[ID_rezerwacji] [int] NOT NULL,
	[Data_planowanego_wypozyczenia] [datetime] NOT NULL,
	[Data_planowanego_zwrotu] [datetime] NOT NULL,
	[Id_klienta] [int] NOT NULL,
	[Id_samochodu] [int] NOT NULL,
	[ID_wypożyczenia] [int] NOT NULL,
	[CzyUsuniete] [bit] NULL,
 CONSTRAINT [PK_Rezerwacja] PRIMARY KEY CLUSTERED 
(
	[ID_rezerwacji] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rozliczenie]    Script Date: 2018-01-16 21:13:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rozliczenie](
	[ID_wypożyczenia] [int] NOT NULL,
	[ID_Rozliczenia] [int] NOT NULL,
	[Data_zwrotu] [datetime] NOT NULL,
	[Czy_uszkodzony] [bit] NOT NULL,
 CONSTRAINT [PK_Rozliczenie] PRIMARY KEY CLUSTERED 
(
	[ID_Rozliczenia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Samochód]    Script Date: 2018-01-16 21:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Samochód](
	[Id_samochodu] [int] NOT NULL,
	[Marka] [nvarchar](30) NOT NULL,
	[Model] [nvarchar](30) NOT NULL,
	[Pojemnosc] [decimal](2, 1) NULL,
	[Rodzaj_paliwa] [nvarchar](30) NOT NULL,
	[Typ_nadwozia] [nvarchar](30) NULL,
	[Ilosc_koni] [int] NULL,
	[Skrzynia_biegow] [nvarchar](30) NULL,
	[Zużycie_paliwa] [decimal](4, 2) NULL,
	[Ilosc_miejsc] [int] NULL,
	[Ilosc_drzwi] [int] NULL,
	[Rocznik] [int] NULL,
	[Kolor] [nvarchar](30) NULL,
	[Cena_za_dobę] [decimal](6, 2) NULL,
	[Dostepnosc] [bit] NOT NULL,
	[Inne] [nvarchar](max) NULL,
	[Kaucja] [int] NOT NULL,
	[CzyUsuniete] [bit] NULL,
 CONSTRAINT [PK_Samochódy] PRIMARY KEY CLUSTERED 
(
	[Id_samochodu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 2018-01-16 21:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysdiagrams](
	[name] [sysname] NOT NULL,
	[principal_id] [int] NOT NULL,
	[diagram_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[definition] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[diagram_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_principal_name] UNIQUE NONCLUSTERED 
(
	[principal_id] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wypożyczenie]    Script Date: 2018-01-16 21:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wypożyczenie](
	[ID_wypożyczenia] [int] NOT NULL,
	[Data_wypożyczenia] [datetime] NOT NULL,
	[Data_planowanego_zwrotu] [datetime] NOT NULL,
	[Cena_za_wypozyczenie] [decimal](10, 2) NULL,
	[CzyUsuniete] [bit] NULL,
 CONSTRAINT [PK_Wypożyczenie] PRIMARY KEY CLUSTERED 
(
	[ID_wypożyczenia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Klient] ADD  DEFAULT ((0.0)) FOR [Promocja]
GO
ALTER TABLE [dbo].[Klient] ADD  DEFAULT ((0)) FOR [Aktywnosc]
GO
ALTER TABLE [dbo].[Klient_KlientFirma]  WITH CHECK ADD  CONSTRAINT [FK_Klient_KlientFirma_Klient] FOREIGN KEY([Id_klienta_K])
REFERENCES [dbo].[Klient] ([Id_klienta])
GO
ALTER TABLE [dbo].[Klient_KlientFirma] CHECK CONSTRAINT [FK_Klient_KlientFirma_Klient]
GO
ALTER TABLE [dbo].[Klient_KlientFirma]  WITH CHECK ADD  CONSTRAINT [FK_Klient_KlientFirma_Klient_firmy] FOREIGN KEY([Id_klienta_F])
REFERENCES [dbo].[Klient_firmy] ([Id_klienta])
GO
ALTER TABLE [dbo].[Klient_KlientFirma] CHECK CONSTRAINT [FK_Klient_KlientFirma_Klient_firmy]
GO
ALTER TABLE [dbo].[Klient_KlientIndyw]  WITH CHECK ADD  CONSTRAINT [FK_Klient_KlientIndyw_Klient] FOREIGN KEY([Id_klienta_K])
REFERENCES [dbo].[Klient] ([Id_klienta])
GO
ALTER TABLE [dbo].[Klient_KlientIndyw] CHECK CONSTRAINT [FK_Klient_KlientIndyw_Klient]
GO
ALTER TABLE [dbo].[Klient_KlientIndyw]  WITH CHECK ADD  CONSTRAINT [FK_Klient_KlientIndyw_Klient_indywidualny] FOREIGN KEY([Id_klienta_I])
REFERENCES [dbo].[Klient_indywidualny] ([Id_klienta])
GO
ALTER TABLE [dbo].[Klient_KlientIndyw] CHECK CONSTRAINT [FK_Klient_KlientIndyw_Klient_indywidualny]
GO
ALTER TABLE [dbo].[Lista_rezerwacji]  WITH CHECK ADD  CONSTRAINT [FK_Lista_rezerwacji_Rezerwacja] FOREIGN KEY([RezerwacjaID_rezerwacji])
REFERENCES [dbo].[Rezerwacja] ([ID_rezerwacji])
GO
ALTER TABLE [dbo].[Lista_rezerwacji] CHECK CONSTRAINT [FK_Lista_rezerwacji_Rezerwacja]
GO
ALTER TABLE [dbo].[Rezerwacja]  WITH CHECK ADD  CONSTRAINT [FK_Rezerwacja_Klient] FOREIGN KEY([Id_klienta])
REFERENCES [dbo].[Klient] ([Id_klienta])
GO
ALTER TABLE [dbo].[Rezerwacja] CHECK CONSTRAINT [FK_Rezerwacja_Klient]
GO
ALTER TABLE [dbo].[Rezerwacja]  WITH CHECK ADD  CONSTRAINT [FK_Rezerwacja_Samochód] FOREIGN KEY([Id_samochodu])
REFERENCES [dbo].[Samochód] ([Id_samochodu])
GO
ALTER TABLE [dbo].[Rezerwacja] CHECK CONSTRAINT [FK_Rezerwacja_Samochód]
GO
ALTER TABLE [dbo].[Rezerwacja]  WITH CHECK ADD  CONSTRAINT [FK_Rezerwacja_Wypożyczenie] FOREIGN KEY([ID_wypożyczenia])
REFERENCES [dbo].[Wypożyczenie] ([ID_wypożyczenia])
GO
ALTER TABLE [dbo].[Rezerwacja] CHECK CONSTRAINT [FK_Rezerwacja_Wypożyczenie]
GO
ALTER TABLE [dbo].[Rozliczenie]  WITH CHECK ADD  CONSTRAINT [FK_Rozliczenie_Wypożyczenie] FOREIGN KEY([ID_wypożyczenia])
REFERENCES [dbo].[Wypożyczenie] ([ID_wypożyczenia])
GO
ALTER TABLE [dbo].[Rozliczenie] CHECK CONSTRAINT [FK_Rozliczenie_Wypożyczenie]
GO
/****** Object:  StoredProcedure [dbo].[sp_alterdiagram]    Script Date: 2018-01-16 21:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_alterdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null,
		@version 	int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId 			int
		declare @retval 		int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @ShouldChangeUID	int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid ARG', 16, 1)
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();	 
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		revert;
	
		select @ShouldChangeUID = 0
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		
		if(@DiagId IS NULL or (@IsDbo = 0 and @theId <> @UIDFound))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end
	
		if(@IsDbo <> 0)
		begin
			if(@UIDFound is null or USER_NAME(@UIDFound) is null) -- invalid principal_id
			begin
				select @ShouldChangeUID = 1 ;
			end
		end

		-- update dds data			
		update dbo.sysdiagrams set definition = @definition where diagram_id = @DiagId ;

		-- change owner
		if(@ShouldChangeUID = 1)
			update dbo.sysdiagrams set principal_id = @theId where diagram_id = @DiagId ;

		-- update dds version
		if(@version is not null)
			update dbo.sysdiagrams set version = @version where diagram_id = @DiagId ;

		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_creatediagram]    Script Date: 2018-01-16 21:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_creatediagram]
	(
		@diagramname 	sysname,
		@owner_id		int	= null, 	
		@version 		int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId int
		declare @retval int
		declare @IsDbo	int
		declare @userName sysname
		if(@version is null or @diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID(); 
		select @IsDbo = IS_MEMBER(N'db_owner');
		revert; 
		
		if @owner_id is null
		begin
			select @owner_id = @theId;
		end
		else
		begin
			if @theId <> @owner_id
			begin
				if @IsDbo = 0
				begin
					RAISERROR (N'E_INVALIDARG', 16, 1);
					return -1
				end
				select @theId = @owner_id
			end
		end
		-- next 2 line only for test, will be removed after define name unique
		if EXISTS(select diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @diagramname)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end
	
		insert into dbo.sysdiagrams(name, principal_id , version, definition)
				VALUES(@diagramname, @theId, @version, @definition) ;
		
		select @retval = @@IDENTITY 
		return @retval
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_dropdiagram]    Script Date: 2018-01-16 21:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_dropdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT; 
		
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		delete from dbo.sysdiagrams where diagram_id = @DiagId;
	
		return 0;
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagramdefinition]    Script Date: 2018-01-16 21:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_helpdiagramdefinition]
	(
		@diagramname 	sysname,
		@owner_id	int	= null 		
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		set nocount on

		declare @theId 		int
		declare @IsDbo 		int
		declare @DiagId		int
		declare @UIDFound	int
	
		if(@diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner');
		if(@owner_id is null)
			select @owner_id = @theId;
		revert; 
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname;
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId ))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end

		select version, definition FROM dbo.sysdiagrams where diagram_id = @DiagId ; 
		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagrams]    Script Date: 2018-01-16 21:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_helpdiagrams]
	(
		@diagramname sysname = NULL,
		@owner_id int = NULL
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		DECLARE @user sysname
		DECLARE @dboLogin bit
		EXECUTE AS CALLER;
			SET @user = USER_NAME();
			SET @dboLogin = CONVERT(bit,IS_MEMBER('db_owner'));
		REVERT;
		SELECT
			[Database] = DB_NAME(),
			[Name] = name,
			[ID] = diagram_id,
			[Owner] = USER_NAME(principal_id),
			[OwnerID] = principal_id
		FROM
			sysdiagrams
		WHERE
			(@dboLogin = 1 OR USER_NAME(principal_id) = @user) AND
			(@diagramname IS NULL OR name = @diagramname) AND
			(@owner_id IS NULL OR principal_id = @owner_id)
		ORDER BY
			4, 5, 1
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_renamediagram]    Script Date: 2018-01-16 21:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_renamediagram]
	(
		@diagramname 		sysname,
		@owner_id		int	= null,
		@new_diagramname	sysname
	
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @DiagIdTarg		int
		declare @u_name			sysname
		if((@diagramname is null) or (@new_diagramname is null))
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT;
	
		select @u_name = USER_NAME(@owner_id)
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		-- if((@u_name is not null) and (@new_diagramname = @diagramname))	-- nothing will change
		--	return 0;
	
		if(@u_name is null)
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @new_diagramname
		else
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @owner_id and name = @new_diagramname
	
		if((@DiagIdTarg is not null) and  @DiagId <> @DiagIdTarg)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end		
	
		if(@u_name is null)
			update dbo.sysdiagrams set [name] = @new_diagramname, principal_id = @theId where diagram_id = @DiagId
		else
			update dbo.sysdiagrams set [name] = @new_diagramname where diagram_id = @DiagId
		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_upgraddiagrams]    Script Date: 2018-01-16 21:13:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_upgraddiagrams]
	AS
	BEGIN
		IF OBJECT_ID(N'dbo.sysdiagrams') IS NOT NULL
			return 0;
	
		CREATE TABLE dbo.sysdiagrams
		(
			name sysname NOT NULL,
			principal_id int NOT NULL,	-- we may change it to varbinary(85)
			diagram_id int PRIMARY KEY IDENTITY,
			version int,
	
			definition varbinary(max)
			CONSTRAINT UK_principal_name UNIQUE
			(
				principal_id,
				name
			)
		);


		/* Add this if we need to have some form of extended properties for diagrams */
		/*
		IF OBJECT_ID(N'dbo.sysdiagram_properties') IS NULL
		BEGIN
			CREATE TABLE dbo.sysdiagram_properties
			(
				diagram_id int,
				name sysname,
				value varbinary(max) NOT NULL
			)
		END
		*/

		IF OBJECT_ID(N'dbo.dtproperties') IS NOT NULL
		begin
			insert into dbo.sysdiagrams
			(
				[name],
				[principal_id],
				[version],
				[definition]
			)
			select	 
				convert(sysname, dgnm.[uvalue]),
				DATABASE_PRINCIPAL_ID(N'dbo'),			-- will change to the sid of sa
				0,							-- zero for old format, dgdef.[version],
				dgdef.[lvalue]
			from dbo.[dtproperties] dgnm
				inner join dbo.[dtproperties] dggd on dggd.[property] = 'DtgSchemaGUID' and dggd.[objectid] = dgnm.[objectid]	
				inner join dbo.[dtproperties] dgdef on dgdef.[property] = 'DtgSchemaDATA' and dgdef.[objectid] = dgnm.[objectid]
				
			where dgnm.[property] = 'DtgSchemaNAME' and dggd.[uvalue] like N'_EA3E6268-D998-11CE-9454-00AA00A3F36E_' 
			return 2;
		end
		return 1;
	END
	
GO
EXEC sys.sp_addextendedproperty @name=N'microsoft_database_tools_support', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysdiagrams'
GO
USE [master]
GO
ALTER DATABASE [wypozyczalnia] SET  READ_WRITE 
GO
