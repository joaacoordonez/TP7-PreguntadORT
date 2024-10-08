USE [master]
GO
/****** Object:  Database [PreguntadOrt]    Script Date: 3/9/2024 09:04:08 ******/
CREATE DATABASE [PreguntadOrt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PreguntadOrt', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntadOrt.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PreguntadOrt_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntadOrt_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PreguntadOrt] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PreguntadOrt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ARITHABORT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PreguntadOrt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PreguntadOrt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PreguntadOrt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PreguntadOrt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PreguntadOrt] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PreguntadOrt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PreguntadOrt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PreguntadOrt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PreguntadOrt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PreguntadOrt] SET RECOVERY FULL 
GO
ALTER DATABASE [PreguntadOrt] SET  MULTI_USER 
GO
ALTER DATABASE [PreguntadOrt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PreguntadOrt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PreguntadOrt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PreguntadOrt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PreguntadOrt] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PreguntadOrt', N'ON'
GO
ALTER DATABASE [PreguntadOrt] SET QUERY_STORE = OFF
GO
USE [PreguntadOrt]
GO
/****** Object:  User [alumno]    Script Date: 3/9/2024 09:04:08 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 3/9/2024 09:04:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[IdCategoria] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Foto] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultades]    Script Date: 3/9/2024 09:04:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultades](
	[IdDificultad] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dificultades] PRIMARY KEY CLUSTERED 
(
	[IdDificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 3/9/2024 09:04:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[IdDificultad] [int] NOT NULL,
	[IdPregunta] [int] NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[Enunciado] [varchar](150) NOT NULL,
	[Foto] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 3/9/2024 09:04:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[IdRespuestas] [int] NOT NULL,
	[IdPregunta] [int] NOT NULL,
	[Opcion] [int] NOT NULL,
	[Contenido] [varchar](150) NOT NULL,
	[Correcta] [bit] NOT NULL,
	[Foto] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[IdRespuestas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (1, N'Deporte', N'')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (2, N'Geografía', N'')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (3, N'Ciencia', N'')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (4, N'Historia', N'')
GO
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (1, N'Fácil')
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (2, N'Media')
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (3, N'Difícil')
GO
INSERT [dbo].[Preguntas] ([IdDificultad], [IdPregunta], [IdCategoria], [Enunciado], [Foto]) VALUES (1, 1, 1, N'¿Cuántos jugadores hay en un equipo de fútbol?    ', N'                                                  ')
INSERT [dbo].[Preguntas] ([IdDificultad], [IdPregunta], [IdCategoria], [Enunciado], [Foto]) VALUES (2, 2, 1, N'¿En qué país se originó el baloncesto?            ', N'                                                  ')
INSERT [dbo].[Preguntas] ([IdDificultad], [IdPregunta], [IdCategoria], [Enunciado], [Foto]) VALUES (3, 3, 1, N'¿Quién ha ganado más títulos de Fórmula 1?        ', N'                                                  ')
INSERT [dbo].[Preguntas] ([IdDificultad], [IdPregunta], [IdCategoria], [Enunciado], [Foto]) VALUES (1, 4, 1, N'¿Qué deporte se juega en Wimbledon?               ', N'                                                  ')
INSERT [dbo].[Preguntas] ([IdDificultad], [IdPregunta], [IdCategoria], [Enunciado], [Foto]) VALUES (3, 5, 1, N'¿En qué año se celebraron los primeros Juegos Olímpicos modernos?', N'')
INSERT [dbo].[Preguntas] ([IdDificultad], [IdPregunta], [IdCategoria], [Enunciado], [Foto]) VALUES (1, 6, 2, N'¿Cuál es el río más largo del mundo?              ', N'                                                  ')
INSERT [dbo].[Preguntas] ([IdDificultad], [IdPregunta], [IdCategoria], [Enunciado], [Foto]) VALUES (2, 7, 2, N'¿En qué continente se encuentra el desierto del Sahara?', N'')
INSERT [dbo].[Preguntas] ([IdDificultad], [IdPregunta], [IdCategoria], [Enunciado], [Foto]) VALUES (3, 8, 2, N'¿Cuál es el país más pequeño del mundo por área?  ', N'                                                  ')
INSERT [dbo].[Preguntas] ([IdDificultad], [IdPregunta], [IdCategoria], [Enunciado], [Foto]) VALUES (1, 9, 2, N'¿Qué océano está al este de los Estados Unidos?', N'')
INSERT [dbo].[Preguntas] ([IdDificultad], [IdPregunta], [IdCategoria], [Enunciado], [Foto]) VALUES (2, 10, 2, N'¿Cuál es el país con más población del mundo?', N'')
INSERT [dbo].[Preguntas] ([IdDificultad], [IdPregunta], [IdCategoria], [Enunciado], [Foto]) VALUES (1, 11, 3, N'¿Cuál es el planeta más grande del sistema solar?', N'')
INSERT [dbo].[Preguntas] ([IdDificultad], [IdPregunta], [IdCategoria], [Enunciado], [Foto]) VALUES (2, 12, 3, N'¿Cuál es la molécula básica de la vida?', N'')
INSERT [dbo].[Preguntas] ([IdDificultad], [IdPregunta], [IdCategoria], [Enunciado], [Foto]) VALUES (3, 13, 3, N'¿Qué científico propuso la teoría de la relatividad?', N'')
INSERT [dbo].[Preguntas] ([IdDificultad], [IdPregunta], [IdCategoria], [Enunciado], [Foto]) VALUES (1, 14, 3, N'¿Qué elemento tiene el símbolo químico O?', N'')
INSERT [dbo].[Preguntas] ([IdDificultad], [IdPregunta], [IdCategoria], [Enunciado], [Foto]) VALUES (2, 15, 3, N'¿Cuántos huesos tiene el cuerpo humano?', N'')
INSERT [dbo].[Preguntas] ([IdDificultad], [IdPregunta], [IdCategoria], [Enunciado], [Foto]) VALUES (1, 16, 4, N'¿Quién fue el primer presidente de los Estados Unidos?', N'')
INSERT [dbo].[Preguntas] ([IdDificultad], [IdPregunta], [IdCategoria], [Enunciado], [Foto]) VALUES (2, 17, 4, N'¿En qué año cayó el Muro de Berlín?', N'')
INSERT [dbo].[Preguntas] ([IdDificultad], [IdPregunta], [IdCategoria], [Enunciado], [Foto]) VALUES (3, 18, 4, N'¿Qué evento marcó el inicio de la Segunda Guerra Mundial?', N'')
INSERT [dbo].[Preguntas] ([IdDificultad], [IdPregunta], [IdCategoria], [Enunciado], [Foto]) VALUES (1, 19, 4, N'¿Quién fue el líder del Imperio Mongol?', N'')
INSERT [dbo].[Preguntas] ([IdDificultad], [IdPregunta], [IdCategoria], [Enunciado], [Foto]) VALUES (2, 20, 4, N'¿Qué revolución tuvo lugar en Francia en 1789?', N'')
INSERT [dbo].[Preguntas] ([IdDificultad], [IdPregunta], [IdCategoria], [Enunciado], [Foto]) VALUES (2, 21, 4, N'¿En qué año cayó el Muro de Berlín?', N'')
INSERT [dbo].[Preguntas] ([IdDificultad], [IdPregunta], [IdCategoria], [Enunciado], [Foto]) VALUES (3, 22, 4, N'¿Quién fue el líder de la Revolución Cubana?', N'')
INSERT [dbo].[Preguntas] ([IdDificultad], [IdPregunta], [IdCategoria], [Enunciado], [Foto]) VALUES (1, 23, 4, N'¿Cuál fue la primera civilización conocida?', N'')
INSERT [dbo].[Preguntas] ([IdDificultad], [IdPregunta], [IdCategoria], [Enunciado], [Foto]) VALUES (2, 24, 4, N'¿Quién pintó la "Última Cena"?', N'')
GO
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (1, 1, 1, N'11', 1, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (2, 1, 2, N'10', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (3, 1, 3, N'12', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (4, 1, 4, N'13', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (5, 2, 1, N'Estados Unidos', 1, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (6, 2, 2, N'Inglaterra', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (7, 2, 3, N'Canadá', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (8, 2, 4, N'Francia', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (9, 3, 1, N'Franco Colapinto', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (10, 3, 2, N'Ayrton Senna', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (11, 3, 3, N'Lewis Hamilton', 1, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (12, 3, 4, N'Alain Prost', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (13, 4, 1, N'Tenis', 1, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (14, 4, 2, N'Golf', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (15, 4, 3, N'Fútbol', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (16, 4, 4, N'Béisbol', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (17, 5, 1, N'1896', 1, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (18, 5, 2, N'1900', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (19, 5, 3, N'1888', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (20, 5, 4, N'1912', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (21, 6, 1, N'Nilo', 1, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (22, 6, 2, N'Amazonas', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (23, 6, 3, N'Yangtsé', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (24, 6, 4, N'Misisipi', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (25, 7, 1, N'Asia', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (26, 7, 2, N'África', 1, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (27, 7, 3, N'América del Sur', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (28, 7, 4, N'Australia', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (29, 8, 1, N'Mónaco', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (30, 8, 2, N'San Marino', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (31, 8, 3, N'Ciudad del Vaticano', 1, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (32, 8, 4, N'Liechtenstein', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (33, 9, 1, N'Océano Atlántico', 1, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (34, 9, 2, N'Océano Pacífico', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (35, 9, 3, N'Océano Índico', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (36, 9, 4, N'Océano Ártico', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (37, 10, 1, N'China', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (38, 10, 2, N'India', 1, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (39, 10, 3, N'Estados Unidos', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (40, 10, 4, N'Indonesia', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (41, 11, 1, N'Júpiter', 1, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (42, 11, 2, N'Saturno', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (43, 11, 3, N'Urano', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (44, 11, 4, N'Neptuno', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (45, 12, 1, N'ADN', 1, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (46, 12, 2, N'ARN', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (47, 12, 3, N'Proteína', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (48, 12, 4, N'Lípido', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (49, 13, 1, N'Albert Einstein', 1, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (50, 13, 2, N'Isaac Newton', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (51, 13, 3, N'Galileo Galilei', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (52, 13, 4, N'Niels Bohr', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (53, 14, 1, N'Nitrógeno', 1, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (54, 14, 2, N'Oxígeno', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (55, 14, 3, N'Dióxido de carbono', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (56, 14, 4, N'Helio', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (57, 15, 1, N'Oxígeno', 1, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (58, 15, 2, N'Oro', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (59, 15, 3, N'Osmio', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (60, 15, 4, N'Óxido de Zinc', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (77, 20, 1, N'George Washington', 1, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (78, 20, 2, N'Thomas Jefferson', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (79, 20, 3, N'John Adams', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (80, 20, 4, N'James Madison', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (81, 21, 1, N'1989', 1, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (82, 21, 2, N'1990', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (83, 21, 3, N'1987', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (84, 21, 4, N'1991', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (85, 22, 1, N'Fidel Castro', 1, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (86, 22, 2, N'Ernesto Che Guevara', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (87, 22, 3, N'Camilo Cienfuegos', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (88, 22, 4, N'Raúl Castro', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (89, 23, 1, N'Sumeria', 1, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (90, 23, 2, N'Egipto', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (91, 23, 3, N'Mesopotamia', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (92, 23, 4, N'India', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (93, 24, 1, N'Leonardo da Vinci', 1, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (94, 24, 2, N'Miguel Ángel', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (95, 24, 3, N'Rafael', 0, N'')
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (96, 24, 4, N'Donatello', 0, N'')
GO
ALTER TABLE [dbo].[Preguntas]  WITH NOCHECK ADD  CONSTRAINT [FK_Preguntas_Categorias1] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categorias] ([IdCategoria])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Preguntas] NOCHECK CONSTRAINT [FK_Preguntas_Categorias1]
GO
ALTER TABLE [dbo].[Preguntas]  WITH NOCHECK ADD  CONSTRAINT [FK_Preguntas_Dificultades1] FOREIGN KEY([IdDificultad])
REFERENCES [dbo].[Dificultades] ([IdDificultad])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Preguntas] NOCHECK CONSTRAINT [FK_Preguntas_Dificultades1]
GO
ALTER TABLE [dbo].[Respuestas]  WITH NOCHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas1] FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[Preguntas] ([IdPregunta])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Respuestas] NOCHECK CONSTRAINT [FK_Respuestas_Preguntas1]
GO
USE [master]
GO
ALTER DATABASE [PreguntadOrt] SET  READ_WRITE 
GO
