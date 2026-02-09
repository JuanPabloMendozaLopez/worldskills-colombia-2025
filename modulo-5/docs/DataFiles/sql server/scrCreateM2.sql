USE [master]
GO
/****** Object:  Database [Sessao2]    ******/
CREATE DATABASE [Sessao2]
GO
USE [Sessao2]
GO
/****** Object:  Table [dbo].[Estadio]    ******/

GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estadio](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](255) NOT NULL,
	[Estado] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
([Id] ASC))
GO
/****** Object:  Table [dbo].[Imagens]     ******/
GO
CREATE TABLE [dbo].[Imagens](
	[Codigo] [int] NOT NULL,
	[Arquivo] [image] NULL,
 CONSTRAINT [PK__Imagens__06370DADEAD179B5] PRIMARY KEY CLUSTERED 
([Codigo] ASC)) 
GO
/****** Object:  Table [dbo].[Jogador]    ******/
GO
CREATE TABLE [dbo].[Jogador](
	[Id] [int] NOT NULL,
	[Nome] [varchar](255) NOT NULL,
	[Nascimento] [datetime] NOT NULL,
	[Posicao] [varchar](255) NOT NULL,
	[QTDEFaltas] [int] NULL,
	[QTDECartoesAmarelo] [int] NULL,
	[QTDECartoesVermelho] [int] NULL,
	[QTDEGols] [int] NULL,
	[Informacoes] [text] NULL,
	[NumeroCamisa] [int] NULL,
	[SelecaoID] [int] NULL,
 CONSTRAINT [PK__Jogador__3214EC0776BBDC69] PRIMARY KEY CLUSTERED 
([Id] ASC))
GO
/****** Object:  Table [dbo].[Jogo]   ******/
GO
CREATE TABLE [dbo].[Jogo](
	[Id] [int] NOT NULL,
	[SelecaoCasa] [int] NULL,
	[SelecaoVisitante] [int] NULL,
	[PlacarCasa] [int] NOT NULL,
	[PlacarVisitante] [int] NOT NULL,
	[PenaltisCasa] [int] NOT NULL,
	[PenaltisVisitante] [int] NOT NULL,
	[Data] [datetime] NULL,
	[Estadio] [int] NULL,
 CONSTRAINT [PK__Jogo__3214EC07C2251C83] PRIMARY KEY CLUSTERED 
([Id] ASC)) 
GO
/****** Object:  Table [dbo].[Selecao]    ******/
GO
CREATE TABLE [dbo].[Selecao](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](255) NOT NULL,
	[Bandeira] [image] NULL,
PRIMARY KEY CLUSTERED 
([Id] ASC)) 
GO
/****** Object:  Table [dbo].[Usuario]    ******/
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Apelido] [varchar](255) NOT NULL,
	[Senha] [varchar](255) NOT NULL,
	[Perfil] [varchar](50) NOT NULL,
	[Bloqueado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
([Id] ASC) ON [PRIMARY], UNIQUE NONCLUSTERED 
([Apelido] ASC
)ON [PRIMARY], UNIQUE NONCLUSTERED 
([Email] ASC) ON [PRIMARY]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Jogador] ADD  CONSTRAINT [DF__Jogador__QTDEFal__38996AB5]  DEFAULT ((0)) FOR [QTDEFaltas]
GO
ALTER TABLE [dbo].[Jogador] ADD  CONSTRAINT [DF__Jogador__QTDECar__398D8EEE]  DEFAULT ((0)) FOR [QTDECartoesAmarelo]
GO
ALTER TABLE [dbo].[Jogador] ADD  CONSTRAINT [DF__Jogador__QTDECar__3A81B327]  DEFAULT ((0)) FOR [QTDECartoesVermelho]
GO
ALTER TABLE [dbo].[Jogador] ADD  CONSTRAINT [DF__Jogador__QTDEGol__3B75D760]  DEFAULT ((0)) FOR [QTDEGols]
GO
ALTER TABLE [dbo].[Jogo] ADD  CONSTRAINT [DF__Jogo__PlacarCasa__3C69FB99]  DEFAULT ((0)) FOR [PlacarCasa]
GO
ALTER TABLE [dbo].[Jogo] ADD  CONSTRAINT [DF__Jogo__PlacarVisi__3D5E1FD2]  DEFAULT ((0)) FOR [PlacarVisitante]
GO
ALTER TABLE [dbo].[Jogo] ADD  CONSTRAINT [DF__Jogo__PenaltisCa__3E52440B]  DEFAULT ((0)) FOR [PenaltisCasa]
GO
ALTER TABLE [dbo].[Jogo] ADD  CONSTRAINT [DF__Jogo__PenaltisVi__3F466844]  DEFAULT ((0)) FOR [PenaltisVisitante]
GO
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [DF_Usuario_Perfil]  DEFAULT ('Normal') FOR [Perfil]
GO
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [DF_Usuario_Bloqueado]  DEFAULT ((0)) FOR [Bloqueado]
GO
ALTER TABLE [dbo].[Imagens]  WITH CHECK ADD  CONSTRAINT [FK_Imagens_Jogador] FOREIGN KEY([Codigo])
REFERENCES [dbo].[Jogador] ([Id])
GO
ALTER TABLE [dbo].[Imagens] CHECK CONSTRAINT [FK_Imagens_Jogador]
GO
ALTER TABLE [dbo].[Jogador]  WITH CHECK ADD  CONSTRAINT [FK__Jogador__Selecao__4222D4EF] FOREIGN KEY([SelecaoID])
REFERENCES [dbo].[Selecao] ([Id])
GO
ALTER TABLE [dbo].[Jogador] CHECK CONSTRAINT [FK__Jogador__Selecao__4222D4EF]
GO
ALTER TABLE [dbo].[Jogo]  WITH CHECK ADD  CONSTRAINT [FK__Jogo__Estadio__4316F928] FOREIGN KEY([Estadio])
REFERENCES [dbo].[Estadio] ([Id])
GO
ALTER TABLE [dbo].[Jogo] CHECK CONSTRAINT [FK__Jogo__Estadio__4316F928]
GO
ALTER TABLE [dbo].[Jogo]  WITH CHECK ADD  CONSTRAINT [FK__Jogo__SelecaoCas__440B1D61] FOREIGN KEY([SelecaoCasa])
REFERENCES [dbo].[Selecao] ([Id])
GO
ALTER TABLE [dbo].[Jogo] CHECK CONSTRAINT [FK__Jogo__SelecaoCas__440B1D61]
GO
ALTER TABLE [dbo].[Jogo]  WITH CHECK ADD  CONSTRAINT [FK__Jogo__SelecaoVis__44FF419A] FOREIGN KEY([SelecaoVisitante])
REFERENCES [dbo].[Selecao] ([Id])
GO
ALTER TABLE [dbo].[Jogo] CHECK CONSTRAINT [FK__Jogo__SelecaoVis__44FF419A]
GO
USE [master]
GO
ALTER DATABASE [Sessao4] SET  READ_WRITE 
GO
