USE [master]
GO
/****** Object:  Database [Hospital]    Script Date: 11/10/2019 11:29:02 a. m. ******/
CREATE DATABASE [Hospital]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hospital', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.INGENIERIA\MSSQL\DATA\Hospital.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Hospital_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.INGENIERIA\MSSQL\DATA\Hospital_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Hospital] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hospital].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hospital] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hospital] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Hospital] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hospital] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hospital] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hospital] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hospital] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hospital] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hospital] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hospital] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hospital] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hospital] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hospital] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hospital] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hospital] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hospital] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hospital] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hospital] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hospital] SET  MULTI_USER 
GO
ALTER DATABASE [Hospital] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hospital] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hospital] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hospital] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Hospital]
GO
/****** Object:  StoredProcedure [dbo].[sp_anular_cita]    Script Date: 11/10/2019 11:29:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_anular_cita]
@pcod_cita nvarchar(10)
as
   update Tbl_Cita set activo=0 
   where Cod_Cita=@pcod_cita

GO
/****** Object:  StoredProcedure [dbo].[sp_consultar_cita]    Script Date: 11/10/2019 11:29:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_consultar_cita]
@pcod_cita nvarchar(10)
as
   select * from Tbl_Cita where Cod_Cita=@pcod_cita

   select nom_paciente,tel_paciente from TblPaciente,Tbl_Cita
   where Tbl_Cita.Id_paciente=TblPaciente.Id_Paciente
   and Cod_Cita=@pcod_cita

   select Nom_Medico,Especialidad from Tbl_Medico,Tbl_Cita
   where Tbl_Cita.Id_medico=Tbl_Medico.Id_Medico
   and Cod_Cita=@pcod_cita
GO
/****** Object:  StoredProcedure [dbo].[sp_consultar_medico]    Script Date: 11/10/2019 11:29:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[sp_consultar_medico]
@pidmedico nvarchar(10)
as
  if @pidmedico=''
	select * from Tbl_medico
  else
    select * from tbl_Medico
    where id_medico=@pidmedico
GO
/****** Object:  StoredProcedure [dbo].[sp_consultar_paciente]    Script Date: 11/10/2019 11:29:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_consultar_paciente]
@pidpaciente nvarchar(10)
as
  if @pidpaciente=''
	select * from TblPaciente
  else
    select * from tblpaciente 
    where id_paciente=@pidpaciente
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminar_medico]    Script Date: 11/10/2019 11:29:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[sp_eliminar_medico]
@pidmedico nvarchar(10)
as
    delete from tbl_Medico where id_medico=@pidmedico
GO
/****** Object:  StoredProcedure [dbo].[sp_eliminar_paciente]    Script Date: 11/10/2019 11:29:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_eliminar_paciente]
@pidpaciente nvarchar(10)
as
   delete from TblPaciente where id_paciente=@pidpaciente
GO
/****** Object:  StoredProcedure [dbo].[sp_guardar_cita]    Script Date: 11/10/2019 11:29:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_guardar_cita]
@pCod_Cita nvarchar(10),
@pfecha nvarchar(10),
@phora nvarchar(10),
@pconsultorio nvarchar(3),
@pId_paciente nvarchar(10),
@pId_medico nvarchar(10),
@pvalor int,
@pobservaciones nvarchar(max)
as
   if not exists (select Cod_Cita from Tbl_Cita where Cod_Cita=@pCod_Cita)
      insert into Tbl_Cita (Cod_Cita,fecha,hora,consultorio,Id_paciente,Id_medico,
	  valor,observaciones) values(@pcod_cita,@pfecha,@phora,@pconsultorio,@pId_paciente,
	  @pId_medico,@pvalor,@pobservaciones)
   else
     update Tbl_Cita set fecha=@pfecha,hora=@phora,consultorio=@pconsultorio,
	 Id_paciente=@pId_paciente,Id_medico=@pId_medico,valor=@pvalor,
	 observaciones=@pobservaciones where Cod_Cita=@pCod_Cita

GO
/****** Object:  StoredProcedure [dbo].[sp_guardar_medico]    Script Date: 11/10/2019 11:29:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_guardar_medico]
@pId_Medico nvarchar(10),
@pnom_Medico nvarchar(50),
@pEspecialidad nvarchar(30)
as
   if not exists (select Id_Medico from Tbl_Medico
   where Id_Medico=@pId_Medico)
		insert into Tbl_Medico
		(Id_Medico,Nom_Medico,Especialidad)
		values
		(@pId_Medico,@pNom_Medico,@pEspecialidad)
	else
		update Tbl_Medico set Nom_Medico=@pnom_Medico,Especialidad=@pEspecialidad
		where Id_Medico=@pId_Medico

GO
/****** Object:  StoredProcedure [dbo].[sp_guardar_paciente]    Script Date: 11/10/2019 11:29:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[sp_guardar_paciente]
@pId_Paciente nvarchar(10),
@pnom_paciente nvarchar(50),
@pdir_paciente nvarchar(50),
@ptel_paciente nvarchar(10)
as
   if not exists (select Id_paciente from TblPaciente
   where Id_Paciente=@pId_Paciente)
		insert into TblPaciente
		(Id_Paciente,nom_paciente,dir_paciente,tel_paciente)
		values
		(@pId_Paciente,@pnom_paciente,@pdir_paciente,@ptel_paciente)
	else
		update TblPaciente set nom_paciente=@pnom_paciente,
		dir_paciente=@pdir_paciente,tel_paciente=@ptel_paciente
		where Id_Paciente=@pId_Paciente
GO
/****** Object:  Table [dbo].[Tbl_Cita]    Script Date: 11/10/2019 11:29:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Cita](
	[Cod_Cita] [nvarchar](10) NOT NULL,
	[fecha] [nvarchar](10) NOT NULL,
	[hora] [nvarchar](10) NOT NULL,
	[consultorio] [nvarchar](3) NOT NULL,
	[Id_paciente] [nvarchar](10) NOT NULL,
	[Id_medico] [nvarchar](10) NOT NULL,
	[valor] [int] NOT NULL,
	[observaciones] [nvarchar](max) NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_Tbl_Cita] PRIMARY KEY CLUSTERED 
(
	[Cod_Cita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tbl_Medico]    Script Date: 11/10/2019 11:29:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Medico](
	[Id_Medico] [nvarchar](10) NOT NULL,
	[Nom_Medico] [nvarchar](50) NOT NULL,
	[Especialidad] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Tbl_Medico] PRIMARY KEY CLUSTERED 
(
	[Id_Medico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblPaciente]    Script Date: 11/10/2019 11:29:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblPaciente](
	[Id_Paciente] [nvarchar](10) NOT NULL,
	[nom_paciente] [nvarchar](50) NOT NULL,
	[dir_paciente] [nvarchar](50) NOT NULL,
	[tel_paciente] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_TblPaciente] PRIMARY KEY CLUSTERED 
(
	[Id_Paciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[TblPaciente] ([Id_Paciente], [nom_paciente], [dir_paciente], [tel_paciente]) VALUES (N'10101010', N'Pedro Paramo', N'Cra 56B 56-34', N'2222222')
INSERT [dbo].[TblPaciente] ([Id_Paciente], [nom_paciente], [dir_paciente], [tel_paciente]) VALUES (N'20202020', N'Armando Mesas', N'Calle 23 90-02', N'3333333')
INSERT [dbo].[TblPaciente] ([Id_Paciente], [nom_paciente], [dir_paciente], [tel_paciente]) VALUES (N'30303030', N'Zoila Vaca', N'Cra 89 67-23', N'4444444')
INSERT [dbo].[TblPaciente] ([Id_Paciente], [nom_paciente], [dir_paciente], [tel_paciente]) VALUES (N'40404040', N'Jorge Isaac', N'Calle 110 43-71', N'5555555')
ALTER TABLE [dbo].[Tbl_Cita] ADD  CONSTRAINT [DF_Tbl_Cita_activo]  DEFAULT ((1)) FOR [activo]
GO
ALTER TABLE [dbo].[Tbl_Cita]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Cita_Tbl_Medico] FOREIGN KEY([Id_medico])
REFERENCES [dbo].[Tbl_Medico] ([Id_Medico])
GO
ALTER TABLE [dbo].[Tbl_Cita] CHECK CONSTRAINT [FK_Tbl_Cita_Tbl_Medico]
GO
ALTER TABLE [dbo].[Tbl_Cita]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Cita_TblPaciente] FOREIGN KEY([Id_paciente])
REFERENCES [dbo].[TblPaciente] ([Id_Paciente])
GO
ALTER TABLE [dbo].[Tbl_Cita] CHECK CONSTRAINT [FK_Tbl_Cita_TblPaciente]
GO
USE [master]
GO
ALTER DATABASE [Hospital] SET  READ_WRITE 
GO
