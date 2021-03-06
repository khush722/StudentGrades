USE [master]
GO
/****** Object:  Database [StudentsDb]    Script Date: 8/09/2020 11:26:44 pm ******/
CREATE DATABASE [StudentsDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentsDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\StudentsDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudentsDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\StudentsDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [StudentsDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentsDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentsDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentsDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentsDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentsDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentsDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentsDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentsDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentsDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentsDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentsDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentsDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentsDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentsDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentsDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentsDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudentsDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentsDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentsDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentsDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentsDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentsDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentsDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentsDb] SET RECOVERY FULL 
GO
ALTER DATABASE [StudentsDb] SET  MULTI_USER 
GO
ALTER DATABASE [StudentsDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentsDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentsDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentsDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudentsDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'StudentsDb', N'ON'
GO
ALTER DATABASE [StudentsDb] SET QUERY_STORE = OFF
GO
USE [StudentsDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8/09/2020 11:26:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 8/09/2020 11:26:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](max) NULL,
	[TeacherId] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 8/09/2020 11:26:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[GradeId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[StudentGrade] [nvarchar](max) NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[GradeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 8/09/2020 11:26:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[DOB] [datetime2](7) NOT NULL,
	[EnrollmentDate] [datetime2](7) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[isHonorsStudent] [bit] NOT NULL,
	[Password] [nvarchar](max) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 8/09/2020 11:26:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200903101416_InitialSetup', N'3.1.7')
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([CourseId], [CourseName], [TeacherId]) VALUES (1, N'web development', 1)
INSERT [dbo].[Course] ([CourseId], [CourseName], [TeacherId]) VALUES (2, N'Health care', 2)
INSERT [dbo].[Course] ([CourseId], [CourseName], [TeacherId]) VALUES (3, N'Software development', 3)
INSERT [dbo].[Course] ([CourseId], [CourseName], [TeacherId]) VALUES (4, N'Phisyotherapy', 4)
INSERT [dbo].[Course] ([CourseId], [CourseName], [TeacherId]) VALUES (5, N'web and software  development', 5)
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[Grade] ON 

INSERT [dbo].[Grade] ([GradeId], [StudentId], [CourseId], [StudentGrade]) VALUES (1, 1, 1, N'80%')
INSERT [dbo].[Grade] ([GradeId], [StudentId], [CourseId], [StudentGrade]) VALUES (2, 2, 2, N'85%')
INSERT [dbo].[Grade] ([GradeId], [StudentId], [CourseId], [StudentGrade]) VALUES (3, 3, 3, N'90%')
INSERT [dbo].[Grade] ([GradeId], [StudentId], [CourseId], [StudentGrade]) VALUES (4, 4, 4, N'95%')
INSERT [dbo].[Grade] ([GradeId], [StudentId], [CourseId], [StudentGrade]) VALUES (5, 5, 5, N'96%')
SET IDENTITY_INSERT [dbo].[Grade] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([StudentId], [Name], [DOB], [EnrollmentDate], [Email], [isHonorsStudent], [Password]) VALUES (1, N'khush', CAST(N'1998-04-02T00:00:00.0000000' AS DateTime2), CAST(N'2020-09-10T00:00:00.0000000' AS DateTime2), N'khushdeep@gmail.com', 1, N'456789')
INSERT [dbo].[Student] ([StudentId], [Name], [DOB], [EnrollmentDate], [Email], [isHonorsStudent], [Password]) VALUES (2, N'Vicky', CAST(N'1998-02-08T00:00:00.0000000' AS DateTime2), CAST(N'2020-09-02T00:00:00.0000000' AS DateTime2), N'vicky@gmail.com', 1, N'12345')
INSERT [dbo].[Student] ([StudentId], [Name], [DOB], [EnrollmentDate], [Email], [isHonorsStudent], [Password]) VALUES (3, N'Robin', CAST(N'1996-03-09T00:00:00.0000000' AS DateTime2), CAST(N'2020-09-05T00:00:00.0000000' AS DateTime2), N'Robinsharma@gamil.com', 1, N'robin')
INSERT [dbo].[Student] ([StudentId], [Name], [DOB], [EnrollmentDate], [Email], [isHonorsStudent], [Password]) VALUES (4, N'Gaurav Bhatia', CAST(N'1997-09-15T00:00:00.0000000' AS DateTime2), CAST(N'2020-08-31T00:00:00.0000000' AS DateTime2), N'Gauravbhatia @gmail.com', 1, N'1237')
INSERT [dbo].[Student] ([StudentId], [Name], [DOB], [EnrollmentDate], [Email], [isHonorsStudent], [Password]) VALUES (5, N'Amrit', CAST(N'1998-07-09T00:00:00.0000000' AS DateTime2), CAST(N'2020-09-10T00:00:00.0000000' AS DateTime2), N'Amritkhehra@gamil.com', 1, N'avi123')
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([TeacherId], [Name]) VALUES (1, N'Milad')
INSERT [dbo].[Teacher] ([TeacherId], [Name]) VALUES (2, N'Dipti ')
INSERT [dbo].[Teacher] ([TeacherId], [Name]) VALUES (3, N'Hanna')
INSERT [dbo].[Teacher] ([TeacherId], [Name]) VALUES (4, N'Krishna')
INSERT [dbo].[Teacher] ([TeacherId], [Name]) VALUES (5, N'Nagindra ')
SET IDENTITY_INSERT [dbo].[Teacher] OFF
GO
/****** Object:  Index [IX_Course_TeacherId]    Script Date: 8/09/2020 11:26:45 pm ******/
CREATE NONCLUSTERED INDEX [IX_Course_TeacherId] ON [dbo].[Course]
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Grade_CourseId]    Script Date: 8/09/2020 11:26:45 pm ******/
CREATE NONCLUSTERED INDEX [IX_Grade_CourseId] ON [dbo].[Grade]
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Grade_StudentId]    Script Date: 8/09/2020 11:26:45 pm ******/
CREATE NONCLUSTERED INDEX [IX_Grade_StudentId] ON [dbo].[Grade]
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Teacher_TeacherId] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([TeacherId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Teacher_TeacherId]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_Course_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([CourseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_Course_CourseId]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_Student_StudentId] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_Student_StudentId]
GO
USE [master]
GO
ALTER DATABASE [StudentsDb] SET  READ_WRITE 
GO
