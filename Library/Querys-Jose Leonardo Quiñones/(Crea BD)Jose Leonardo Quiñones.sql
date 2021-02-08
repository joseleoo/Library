
CREATE DATABASE [Library]

GO
ALTER DATABASE [Library] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Library] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Library] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Library] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Library] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Library] SET ARITHABORT OFF 
GO
ALTER DATABASE [Library] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Library] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Library] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Library] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Library] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Library] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Library] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Library] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Library] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Library] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Library] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Library] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Library] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Library] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Library] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Library] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Library] SET  MULTI_USER 
GO
ALTER DATABASE [Library] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Library] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Library] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Library] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Library] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Library] SET QUERY_STORE = OFF
GO
USE [Library]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Library]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Identificación] [varchar](12) NOT NULL,
	[Nombres] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[DireccionEnvio] [varchar](50) NOT NULL,
	[TelefonoFijo] [varchar](50) NULL,
	[Celular] [varchar](13) NOT NULL,
	[Email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[IdCompraLibro] [int] IDENTITY(1,1) NOT NULL,
	[IdLibro] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Valor] [decimal](18, 0) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
 CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED 
(
	[IdCompraLibro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editorial](
	[IdEditorial] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Editorial] PRIMARY KEY CLUSTERED 
(
	[IdEditorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[IdEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[TelefonoFijo] [varchar](50) NULL,
	[Celular] [varchar](50) NOT NULL,
	[Cargo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libro](
	[IdLibro] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](50) NOT NULL,
	[IdEditorial] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Costo] [decimal](18, 0) NOT NULL,
	[PrecioSugerido] [decimal](18, 0) NOT NULL,
	[Autor] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Libro] PRIMARY KEY CLUSTERED 
(
	[IdLibro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([IdCliente], [Identificación], [Nombres], [Apellidos], [DireccionEnvio], [TelefonoFijo], [Celular], [Email]) VALUES (1, N'123456789', N'Maria Andrea', N'Anders', N'Obere Str. 57', N'030-0074321', N'(5) 555-4729', N'anders@gmail.com')
INSERT [dbo].[Cliente] ([IdCliente], [Identificación], [Nombres], [Apellidos], [DireccionEnvio], [TelefonoFijo], [Celular], [Email]) VALUES (2, N'12209', N'Thomas ', N'Hardy', N'Mataderos  2312', N'(5) 555-3932', N'(5) 555-3745', N'hardy@hotmail.com')
INSERT [dbo].[Cliente] ([IdCliente], [Identificación], [Nombres], [Apellidos], [DireccionEnvio], [TelefonoFijo], [Celular], [Email]) VALUES (11, N'28023', N'Laurence ', N'Lebihan', N'12, rue des Bouchers', N'91.24.45.41', N'91.24.45.40', N'laurcence@hotmail.com')
INSERT [dbo].[Cliente] ([IdCliente], [Identificación], [Nombres], [Apellidos], [DireccionEnvio], [TelefonoFijo], [Celular], [Email]) VALUES (21, N'52066', N'Elizabeth ', N'Brown', N'Berkeley Gardens 12  Brewery', N'555-9199', N'555-2282', N'lizi@gmail.com')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
SET IDENTITY_INSERT [dbo].[Compra] ON 

INSERT [dbo].[Compra] ([IdCompraLibro], [IdLibro], [IdCliente], [Fecha], [Valor], [IdEmpleado]) VALUES (1, 4, 1, CAST(N'2019-01-01' AS Date), CAST(200000 AS Decimal(18, 0)), 1)
INSERT [dbo].[Compra] ([IdCompraLibro], [IdLibro], [IdCliente], [Fecha], [Valor], [IdEmpleado]) VALUES (2, 5, 2, CAST(N'2019-02-02' AS Date), CAST(300000 AS Decimal(18, 0)), 1)
INSERT [dbo].[Compra] ([IdCompraLibro], [IdLibro], [IdCliente], [Fecha], [Valor], [IdEmpleado]) VALUES (4, 6, 11, CAST(N'2020-02-01' AS Date), CAST(250000 AS Decimal(18, 0)), 2)
INSERT [dbo].[Compra] ([IdCompraLibro], [IdLibro], [IdCliente], [Fecha], [Valor], [IdEmpleado]) VALUES (5, 7, 11, CAST(N'2019-02-01' AS Date), CAST(350000 AS Decimal(18, 0)), 2)
INSERT [dbo].[Compra] ([IdCompraLibro], [IdLibro], [IdCliente], [Fecha], [Valor], [IdEmpleado]) VALUES (7, 4, 11, CAST(N'2020-02-01' AS Date), CAST(450000 AS Decimal(18, 0)), 2)
SET IDENTITY_INSERT [dbo].[Compra] OFF
SET IDENTITY_INSERT [dbo].[Editorial] ON 

INSERT [dbo].[Editorial] ([IdEditorial], [Nombre]) VALUES (1, N'Circunferencia de lectores')
INSERT [dbo].[Editorial] ([IdEditorial], [Nombre]) VALUES (2, N'Normativa')
SET IDENTITY_INSERT [dbo].[Editorial] OFF
SET IDENTITY_INSERT [dbo].[Empleado] ON 

INSERT [dbo].[Empleado] ([IdEmpleado], [Nombres], [Apellidos], [Direccion], [TelefonoFijo], [Celular], [Cargo]) VALUES (1, N'Nancy', N'Davolio', N'507 - 20th Ave. E.
Apt. 2A', N'(206) 555-9857', N'555-98598', N'Sales Representative')
INSERT [dbo].[Empleado] ([IdEmpleado], [Nombres], [Apellidos], [Direccion], [TelefonoFijo], [Celular], [Cargo]) VALUES (2, N'Margaret', N'Peacock', N'4110 Old Redmond Rd.', N'(206) 555-8122', N'555-8129', N'Vice President, Sales')
INSERT [dbo].[Empleado] ([IdEmpleado], [Nombres], [Apellidos], [Direccion], [TelefonoFijo], [Celular], [Cargo]) VALUES (3, N'Javier ', N'Solis', N'calle 100', N'12345678', N'123456', N'Sales Representative')
SET IDENTITY_INSERT [dbo].[Empleado] OFF
SET IDENTITY_INSERT [dbo].[Libro] ON 

INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdEditorial], [Fecha], [Costo], [PrecioSugerido], [Autor]) VALUES (4, N'Uncle Bob''s Organic Pears', 1, CAST(N'2020-01-01' AS Date), CAST(100000 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), N'Charlotte Cooper')
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdEditorial], [Fecha], [Costo], [PrecioSugerido], [Autor]) VALUES (5, N'Guaraná Fantástica', 2, CAST(N'2020-02-13' AS Date), CAST(200000 AS Decimal(18, 0)), CAST(300000 AS Decimal(18, 0)), N'Regina Murphy')
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdEditorial], [Fecha], [Costo], [PrecioSugerido], [Autor]) VALUES (6, N'Tokyo Traders', 1, CAST(N'2020-03-01' AS Date), CAST(150000 AS Decimal(18, 0)), CAST(250000 AS Decimal(18, 0)), N'Yoshi Nagase')
INSERT [dbo].[Libro] ([IdLibro], [Titulo], [IdEditorial], [Fecha], [Costo], [PrecioSugerido], [Autor]) VALUES (7, N'Chocolate', 2, CAST(N'2020-04-01' AS Date), CAST(250000 AS Decimal(18, 0)), CAST(350000 AS Decimal(18, 0)), N'Carlos Diaz')
SET IDENTITY_INSERT [dbo].[Libro] OFF
ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [FK_Compra_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [FK_Compra_Cliente]
GO
ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [FK_Compra_Empleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [FK_Compra_Empleado]
GO
ALTER TABLE [dbo].[Compra]  WITH CHECK ADD  CONSTRAINT [FK_Compra_Libro] FOREIGN KEY([IdLibro])
REFERENCES [dbo].[Libro] ([IdLibro])
GO
ALTER TABLE [dbo].[Compra] CHECK CONSTRAINT [FK_Compra_Libro]
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK_Libro_Editorial] FOREIGN KEY([IdEditorial])
REFERENCES [dbo].[Editorial] ([IdEditorial])
GO
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK_Libro_Editorial]
GO
ALTER TABLE [dbo].[Libro]  WITH CHECK ADD  CONSTRAINT [FK_Libro_Libro] FOREIGN KEY([IdLibro])
REFERENCES [dbo].[Libro] ([IdLibro])
GO
ALTER TABLE [dbo].[Libro] CHECK CONSTRAINT [FK_Libro_Libro]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ObtieneTotalVentasXEmpleado] 
	-- Add the parameters for the stored procedure here

	@Anio varchar(4)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select distinct nombre, sum(NoVentas) as ValorTotalVentas from
(
select    Nombres+' '+ Apellidos as nombre,
case when YEAR(c.Fecha)=@Anio then sum(Valor) else 0 end as NoVentas 
from Empleado e 
left join Compra c on e.IdEmpleado=c.IdEmpleado
left join Libro l on l.IdLibro= c.IdLibro
group by Nombres, Apellidos,YEAR(c.fecha)
)as tabla
group by nombre



END
GO
USE [master]
GO
ALTER DATABASE [Library] SET  READ_WRITE 
GO
