USE [MinimalPeliculaApi]
GO
/****** Object:  UserDefinedTableType [dbo].[ListadoActores]    Script Date: 17/5/2024 20:06:40 ******/
CREATE TYPE [dbo].[ListadoActores] AS TABLE(
	[ActorId] [int] NULL,
	[Personaje] [nvarchar](150) NULL,
	[Orden] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ListadoEnteros]    Script Date: 17/5/2024 20:06:40 ******/
CREATE TYPE [dbo].[ListadoEnteros] AS TABLE(
	[Id] [int] NULL
)
GO
/****** Object:  Table [dbo].[Actores]    Script Date: 17/5/2024 20:06:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](1500) NOT NULL,
	[FechaNacimiento] [datetime2](7) NOT NULL,
	[Foto] [nvarchar](max) NULL,
 CONSTRAINT [PK_Actores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActoresPeliculas]    Script Date: 17/5/2024 20:06:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActoresPeliculas](
	[ActorId] [int] NOT NULL,
	[PeliculaId] [int] NOT NULL,
	[Orden] [int] NOT NULL,
	[Personaje] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_ActoresPeliculas] PRIMARY KEY CLUSTERED 
(
	[ActorId] ASC,
	[PeliculaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comentarios]    Script Date: 17/5/2024 20:06:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cuerpo] [nvarchar](max) NOT NULL,
	[PeliculaId] [int] NOT NULL,
	[UsuarioId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Comentarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Errores]    Script Date: 17/5/2024 20:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Errores](
	[Id] [uniqueidentifier] NOT NULL,
	[MensajeDeError] [nvarchar](max) NOT NULL,
	[StackTrace] [nvarchar](max) NULL,
	[Fecha] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Errores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Generos]    Script Date: 17/5/2024 20:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Generos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Generos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GenerosPeliculas]    Script Date: 17/5/2024 20:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenerosPeliculas](
	[PeliculaId] [int] NOT NULL,
	[GeneroId] [int] NOT NULL,
 CONSTRAINT [PK_GenerosPeliculas] PRIMARY KEY CLUSTERED 
(
	[PeliculaId] ASC,
	[GeneroId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Peliculas]    Script Date: 17/5/2024 20:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Peliculas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [nvarchar](150) NOT NULL,
	[EnCines] [bit] NOT NULL,
	[FechaLanzamiento] [datetime2](7) NOT NULL,
	[Poster] [nvarchar](max) NULL,
 CONSTRAINT [PK_Peliculas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 17/5/2024 20:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolesClaims]    Script Date: 17/5/2024 20:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolesClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_RolesClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 17/5/2024 20:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuariosClaims]    Script Date: 17/5/2024 20:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuariosClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_UsuariosClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuariosLogins]    Script Date: 17/5/2024 20:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuariosLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UsuariosLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuariosRoles]    Script Date: 17/5/2024 20:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuariosRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UsuariosRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuariosTokens]    Script Date: 17/5/2024 20:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuariosTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_UsuariosTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Actores] ON 

INSERT [dbo].[Actores] ([Id], [Nombre], [FechaNacimiento], [Foto]) VALUES (1, N'Tom Holland', CAST(N'1990-05-26T00:00:00.0000000' AS DateTime2), N'https://localhost:7047/actores/d87da5bd-d145-4df2-8a87-68d45341fec5.jpg')
INSERT [dbo].[Actores] ([Id], [Nombre], [FechaNacimiento], [Foto]) VALUES (2, N'Samuel L Jackson', CAST(N'1949-07-26T00:00:00.0000000' AS DateTime2), N'https://localhost:7047/actores/103e347d-64e6-4b6c-9ae0-21f436dfd5e2.jpeg')
INSERT [dbo].[Actores] ([Id], [Nombre], [FechaNacimiento], [Foto]) VALUES (3, N'Mariza Tomei', CAST(N'1985-09-13T00:00:00.0000000' AS DateTime2), N'https://localhost:7047/actores/d2e9942c-2e68-4656-ac90-3ece1433a814.jpg')
INSERT [dbo].[Actores] ([Id], [Nombre], [FechaNacimiento], [Foto]) VALUES (4, N'Zendaya', CAST(N'1996-01-30T00:00:00.0000000' AS DateTime2), N'https://localhost:7047/actores/4cc16656-1813-4f66-8c53-e12ca25fc691.jpg')
SET IDENTITY_INSERT [dbo].[Actores] OFF
GO
INSERT [dbo].[ActoresPeliculas] ([ActorId], [PeliculaId], [Orden], [Personaje]) VALUES (1, 1, 1, N'Peter Parker')
INSERT [dbo].[ActoresPeliculas] ([ActorId], [PeliculaId], [Orden], [Personaje]) VALUES (2, 1, 3, N'Nick Fury')
INSERT [dbo].[ActoresPeliculas] ([ActorId], [PeliculaId], [Orden], [Personaje]) VALUES (4, 1, 2, N'MJ')
GO
SET IDENTITY_INSERT [dbo].[Comentarios] ON 

INSERT [dbo].[Comentarios] ([Id], [Cuerpo], [PeliculaId], [UsuarioId]) VALUES (1, N'Muy buena', 1, N'be84d562-6bad-4ab5-a015-0bd8dfd20387')
INSERT [dbo].[Comentarios] ([Id], [Cuerpo], [PeliculaId], [UsuarioId]) VALUES (2, N'Muy buena2', 2, N'be84d562-6bad-4ab5-a015-0bd8dfd20387')
INSERT [dbo].[Comentarios] ([Id], [Cuerpo], [PeliculaId], [UsuarioId]) VALUES (3, N'Muy buena3', 2, N'be84d562-6bad-4ab5-a015-0bd8dfd20387')
INSERT [dbo].[Comentarios] ([Id], [Cuerpo], [PeliculaId], [UsuarioId]) VALUES (4, N'Genial', 1, N'be84d562-6bad-4ab5-a015-0bd8dfd20387')
INSERT [dbo].[Comentarios] ([Id], [Cuerpo], [PeliculaId], [UsuarioId]) VALUES (5, N'Genial', 3, N'be84d562-6bad-4ab5-a015-0bd8dfd20387')
INSERT [dbo].[Comentarios] ([Id], [Cuerpo], [PeliculaId], [UsuarioId]) VALUES (6, N'Me encanto ', 4, N'be84d562-6bad-4ab5-a015-0bd8dfd20387')
SET IDENTITY_INSERT [dbo].[Comentarios] OFF
GO
INSERT [dbo].[Errores] ([Id], [MensajeDeError], [StackTrace], [Fecha]) VALUES (N'd5fb2753-070f-ef11-b92b-e4f89cfba81e', N'error de ejemplo', N'   at Program.<>c.<<Main>$>b__0_2() in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Program.cs:line 84
   at lambda_method11(Closure, Object, HttpContext)
   at Microsoft.AspNetCore.OutputCaching.OutputCacheMiddleware.Invoke(HttpContext httpContext)
   at Microsoft.AspNetCore.StaticFiles.StaticFileMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.StatusCodePagesMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddlewareImpl.<Invoke>g__Awaited|10_0(ExceptionHandlerMiddlewareImpl middleware, HttpContext context, Task task)', CAST(N'2024-05-10T19:55:56.4200000' AS DateTime2))
INSERT [dbo].[Errores] ([Id], [MensajeDeError], [StackTrace], [Fecha]) VALUES (N'7af24967-0512-ef11-b92c-e4f89cfba81e', N'No se ha inicializado la propiedad ConnectionString.', N'   at Microsoft.Data.SqlClient.SqlConnection.PermissionDemand()
   at Microsoft.Data.SqlClient.SqlConnectionFactory.PermissionDemand(DbConnection outerConnection)
   at Microsoft.Data.ProviderBase.DbConnectionInternal.TryOpenConnectionInternal(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at Microsoft.Data.ProviderBase.DbConnectionClosed.TryOpenConnection(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at Microsoft.Data.SqlClient.SqlConnection.TryOpen(TaskCompletionSource`1 retry, SqlConnectionOverrides overrides)
   at Microsoft.Data.SqlClient.SqlConnection.InternalOpenAsync(CancellationToken cancellationToken)
--- End of stack trace from previous location ---
   at Dapper.SqlMapper.QueryRowAsync[T](IDbConnection cnn, Row row, Type effectiveType, CommandDefinition command) in /_/Dapper/SqlMapper.Async.cs:line 488
   at MinimalApiPeliculas.Repositorios.RepositorioUsuarios.BuscarUsuarioPorEmail(String normalizedEmail) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Repositorios\RepositorioUsuarios.cs:line 21
   at MinimalApiPeliculas.Servicios.UsuarioStore.FindByNameAsync(String normalizedUserName, CancellationToken cancellationToken) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Servicios\UsuarioStore.cs:line 50
   at Microsoft.AspNetCore.Identity.UserManager`1.FindByNameAsync(String userName)
   at Microsoft.AspNetCore.Identity.UserValidator`1.ValidateUserName(UserManager`1 manager, TUser user)
   at Microsoft.AspNetCore.Identity.UserValidator`1.ValidateAsync(UserManager`1 manager, TUser user)
   at Microsoft.AspNetCore.Identity.UserManager`1.ValidateUserAsync(TUser user)
   at Microsoft.AspNetCore.Identity.UserManager`1.CreateAsync(TUser user)
   at Microsoft.AspNetCore.Identity.UserManager`1.CreateAsync(TUser user, String password)
   at MinimalApiPeliculas.Endpoints.UsuariosEndpoints.Registrar(CredencialesUsuarioDTO credencialesUsuarioDTO, UserManager`1 userManager, IConfiguration configuration) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Endpoints\UsuariosEndpoints.cs:line 31
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<TaskOfTToValueTaskOfObject>g__ExecuteAwaited|92_0[T](Task`1 task)
   at MinimalApiPeliculas.Filtros.FiltroValidaciones`1.InvokeAsync(EndpointFilterInvocationContext context, EndpointFilterDelegate next) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Filtros\FiltroValidaciones.cs:line 29
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<ExecuteValueTaskOfObject>g__ExecuteAwaited|129_0(ValueTask`1 valueTask, HttpContext httpContext, JsonTypeInfo`1 jsonTypeInfo)
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<>c__DisplayClass102_2.<<HandleRequestBodyAndCompileRequestDelegateForJson>b__2>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.StatusCodePagesMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddlewareImpl.<Invoke>g__Awaited|10_0(ExceptionHandlerMiddlewareImpl middleware, HttpContext context, Task task)', CAST(N'2024-05-14T15:19:48.9166667' AS DateTime2))
INSERT [dbo].[Errores] ([Id], [MensajeDeError], [StackTrace], [Fecha]) VALUES (N'894603e0-0512-ef11-b92c-e4f89cfba81e', N'No se ha inicializado la propiedad ConnectionString.', N'   at Microsoft.Data.SqlClient.SqlConnection.PermissionDemand()
   at Microsoft.Data.SqlClient.SqlConnectionFactory.PermissionDemand(DbConnection outerConnection)
   at Microsoft.Data.ProviderBase.DbConnectionInternal.TryOpenConnectionInternal(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at Microsoft.Data.ProviderBase.DbConnectionClosed.TryOpenConnection(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at Microsoft.Data.SqlClient.SqlConnection.TryOpen(TaskCompletionSource`1 retry, SqlConnectionOverrides overrides)
   at Microsoft.Data.SqlClient.SqlConnection.InternalOpenAsync(CancellationToken cancellationToken)
--- End of stack trace from previous location ---
   at Dapper.SqlMapper.QueryRowAsync[T](IDbConnection cnn, Row row, Type effectiveType, CommandDefinition command) in /_/Dapper/SqlMapper.Async.cs:line 488
   at MinimalApiPeliculas.Repositorios.RepositorioUsuarios.BuscarUsuarioPorEmail(String normalizedEmail) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Repositorios\RepositorioUsuarios.cs:line 21
   at MinimalApiPeliculas.Servicios.UsuarioStore.FindByNameAsync(String normalizedUserName, CancellationToken cancellationToken) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Servicios\UsuarioStore.cs:line 50
   at Microsoft.AspNetCore.Identity.UserManager`1.FindByNameAsync(String userName)
   at Microsoft.AspNetCore.Identity.UserValidator`1.ValidateUserName(UserManager`1 manager, TUser user)
   at Microsoft.AspNetCore.Identity.UserValidator`1.ValidateAsync(UserManager`1 manager, TUser user)
   at Microsoft.AspNetCore.Identity.UserManager`1.ValidateUserAsync(TUser user)
   at Microsoft.AspNetCore.Identity.UserManager`1.CreateAsync(TUser user)
   at Microsoft.AspNetCore.Identity.UserManager`1.CreateAsync(TUser user, String password)
   at MinimalApiPeliculas.Endpoints.UsuariosEndpoints.Registrar(CredencialesUsuarioDTO credencialesUsuarioDTO, UserManager`1 userManager, IConfiguration configuration) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Endpoints\UsuariosEndpoints.cs:line 31
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<TaskOfTToValueTaskOfObject>g__ExecuteAwaited|92_0[T](Task`1 task)
   at MinimalApiPeliculas.Filtros.FiltroValidaciones`1.InvokeAsync(EndpointFilterInvocationContext context, EndpointFilterDelegate next) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Filtros\FiltroValidaciones.cs:line 29
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<ExecuteValueTaskOfObject>g__ExecuteAwaited|129_0(ValueTask`1 valueTask, HttpContext httpContext, JsonTypeInfo`1 jsonTypeInfo)
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<>c__DisplayClass102_2.<<HandleRequestBodyAndCompileRequestDelegateForJson>b__2>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.StatusCodePagesMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddlewareImpl.<Invoke>g__Awaited|10_0(ExceptionHandlerMiddlewareImpl middleware, HttpContext context, Task task)', CAST(N'2024-05-14T15:23:12.4166667' AS DateTime2))
INSERT [dbo].[Errores] ([Id], [MensajeDeError], [StackTrace], [Fecha]) VALUES (N'239798f3-0d12-ef11-b92c-e4f89cfba81e', N'No se ha inicializado la propiedad ConnectionString.', N'   at Microsoft.Data.SqlClient.SqlConnection.PermissionDemand()
   at Microsoft.Data.SqlClient.SqlConnectionFactory.PermissionDemand(DbConnection outerConnection)
   at Microsoft.Data.ProviderBase.DbConnectionInternal.TryOpenConnectionInternal(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at Microsoft.Data.ProviderBase.DbConnectionClosed.TryOpenConnection(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at Microsoft.Data.SqlClient.SqlConnection.TryOpen(TaskCompletionSource`1 retry, SqlConnectionOverrides overrides)
   at Microsoft.Data.SqlClient.SqlConnection.InternalOpenAsync(CancellationToken cancellationToken)
--- End of stack trace from previous location ---
   at Dapper.SqlMapper.QueryRowAsync[T](IDbConnection cnn, Row row, Type effectiveType, CommandDefinition command) in /_/Dapper/SqlMapper.Async.cs:line 488
   at MinimalApiPeliculas.Repositorios.RepositorioUsuarios.BuscarUsuarioPorEmail(String normalizedEmail) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Repositorios\RepositorioUsuarios.cs:line 21
   at MinimalApiPeliculas.Servicios.UsuarioStore.FindByNameAsync(String normalizedUserName, CancellationToken cancellationToken) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Servicios\UsuarioStore.cs:line 50
   at Microsoft.AspNetCore.Identity.UserManager`1.FindByNameAsync(String userName)
   at Microsoft.AspNetCore.Identity.UserValidator`1.ValidateUserName(UserManager`1 manager, TUser user)
   at Microsoft.AspNetCore.Identity.UserValidator`1.ValidateAsync(UserManager`1 manager, TUser user)
   at Microsoft.AspNetCore.Identity.UserManager`1.ValidateUserAsync(TUser user)
   at Microsoft.AspNetCore.Identity.UserManager`1.CreateAsync(TUser user)
   at Microsoft.AspNetCore.Identity.UserManager`1.CreateAsync(TUser user, String password)
   at MinimalApiPeliculas.Endpoints.UsuariosEndpoints.Registrar(CredencialesUsuarioDTO credencialesUsuarioDTO, UserManager`1 userManager, IConfiguration configuration) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Endpoints\UsuariosEndpoints.cs:line 31
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<TaskOfTToValueTaskOfObject>g__ExecuteAwaited|92_0[T](Task`1 task)
   at MinimalApiPeliculas.Filtros.FiltroValidaciones`1.InvokeAsync(EndpointFilterInvocationContext context, EndpointFilterDelegate next) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Filtros\FiltroValidaciones.cs:line 29
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<ExecuteValueTaskOfObject>g__ExecuteAwaited|129_0(ValueTask`1 valueTask, HttpContext httpContext, JsonTypeInfo`1 jsonTypeInfo)
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<>c__DisplayClass102_2.<<HandleRequestBodyAndCompileRequestDelegateForJson>b__2>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.StatusCodePagesMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddlewareImpl.<Invoke>g__Awaited|10_0(ExceptionHandlerMiddlewareImpl middleware, HttpContext context, Task task)', CAST(N'2024-05-14T16:21:00.8000000' AS DateTime2))
INSERT [dbo].[Errores] ([Id], [MensajeDeError], [StackTrace], [Fecha]) VALUES (N'a6661959-1112-ef11-b92c-e4f89cfba81e', N'No se ha inicializado la propiedad ConnectionString.', N'   at Microsoft.Data.SqlClient.SqlConnection.PermissionDemand()
   at Microsoft.Data.SqlClient.SqlConnectionFactory.PermissionDemand(DbConnection outerConnection)
   at Microsoft.Data.ProviderBase.DbConnectionInternal.TryOpenConnectionInternal(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at Microsoft.Data.ProviderBase.DbConnectionClosed.TryOpenConnection(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at Microsoft.Data.SqlClient.SqlConnection.TryOpen(TaskCompletionSource`1 retry, SqlConnectionOverrides overrides)
   at Microsoft.Data.SqlClient.SqlConnection.InternalOpenAsync(CancellationToken cancellationToken)
--- End of stack trace from previous location ---
   at Dapper.SqlMapper.QueryRowAsync[T](IDbConnection cnn, Row row, Type effectiveType, CommandDefinition command) in /_/Dapper/SqlMapper.Async.cs:line 488
   at MinimalApiPeliculas.Repositorios.RepositorioUsuarios.BuscarUsuarioPorEmail(String normalizedEmail) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Repositorios\RepositorioUsuarios.cs:line 21
   at MinimalApiPeliculas.Servicios.UsuarioStore.FindByNameAsync(String normalizedUserName, CancellationToken cancellationToken) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Servicios\UsuarioStore.cs:line 50
   at Microsoft.AspNetCore.Identity.UserManager`1.FindByNameAsync(String userName)
   at Microsoft.AspNetCore.Identity.UserValidator`1.ValidateUserName(UserManager`1 manager, TUser user)
   at Microsoft.AspNetCore.Identity.UserValidator`1.ValidateAsync(UserManager`1 manager, TUser user)
   at Microsoft.AspNetCore.Identity.UserManager`1.ValidateUserAsync(TUser user)
   at Microsoft.AspNetCore.Identity.UserManager`1.CreateAsync(TUser user)
   at Microsoft.AspNetCore.Identity.UserManager`1.CreateAsync(TUser user, String password)
   at MinimalApiPeliculas.Endpoints.UsuariosEndpoints.Registrar(CredencialesUsuarioDTO credencialesUsuarioDTO, UserManager`1 userManager, IConfiguration configuration) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Endpoints\UsuariosEndpoints.cs:line 31
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<TaskOfTToValueTaskOfObject>g__ExecuteAwaited|92_0[T](Task`1 task)
   at MinimalApiPeliculas.Filtros.FiltroValidaciones`1.InvokeAsync(EndpointFilterInvocationContext context, EndpointFilterDelegate next) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Filtros\FiltroValidaciones.cs:line 29
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<ExecuteValueTaskOfObject>g__ExecuteAwaited|129_0(ValueTask`1 valueTask, HttpContext httpContext, JsonTypeInfo`1 jsonTypeInfo)
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<>c__DisplayClass102_2.<<HandleRequestBodyAndCompileRequestDelegateForJson>b__2>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.StatusCodePagesMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddlewareImpl.<Invoke>g__Awaited|10_0(ExceptionHandlerMiddlewareImpl middleware, HttpContext context, Task task)', CAST(N'2024-05-14T16:45:19.7966667' AS DateTime2))
INSERT [dbo].[Errores] ([Id], [MensajeDeError], [StackTrace], [Fecha]) VALUES (N'f283d663-1312-ef11-b92c-e4f89cfba81e', N'No se ha inicializado la propiedad ConnectionString.', N'   at Microsoft.Data.SqlClient.SqlConnection.PermissionDemand()
   at Microsoft.Data.SqlClient.SqlConnectionFactory.PermissionDemand(DbConnection outerConnection)
   at Microsoft.Data.ProviderBase.DbConnectionInternal.TryOpenConnectionInternal(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at Microsoft.Data.ProviderBase.DbConnectionClosed.TryOpenConnection(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at Microsoft.Data.SqlClient.SqlConnection.TryOpen(TaskCompletionSource`1 retry, SqlConnectionOverrides overrides)
   at Microsoft.Data.SqlClient.SqlConnection.InternalOpenAsync(CancellationToken cancellationToken)
--- End of stack trace from previous location ---
   at Dapper.SqlMapper.QueryRowAsync[T](IDbConnection cnn, Row row, Type effectiveType, CommandDefinition command) in /_/Dapper/SqlMapper.Async.cs:line 488
   at MinimalApiPeliculas.Repositorios.RepositorioUsuarios.BuscarUsuarioPorEmail(String normalizedEmail) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Repositorios\RepositorioUsuarios.cs:line 21
   at MinimalApiPeliculas.Servicios.UsuarioStore.FindByNameAsync(String normalizedUserName, CancellationToken cancellationToken) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Servicios\UsuarioStore.cs:line 50
   at Microsoft.AspNetCore.Identity.UserManager`1.FindByNameAsync(String userName)
   at Microsoft.AspNetCore.Identity.UserValidator`1.ValidateUserName(UserManager`1 manager, TUser user)
   at Microsoft.AspNetCore.Identity.UserValidator`1.ValidateAsync(UserManager`1 manager, TUser user)
   at Microsoft.AspNetCore.Identity.UserManager`1.ValidateUserAsync(TUser user)
   at Microsoft.AspNetCore.Identity.UserManager`1.CreateAsync(TUser user)
   at Microsoft.AspNetCore.Identity.UserManager`1.CreateAsync(TUser user, String password)
   at MinimalApiPeliculas.Endpoints.UsuariosEndpoints.Registrar(CredencialesUsuarioDTO credencialesUsuarioDTO, UserManager`1 userManager, IConfiguration configuration) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Endpoints\UsuariosEndpoints.cs:line 31
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<TaskOfTToValueTaskOfObject>g__ExecuteAwaited|92_0[T](Task`1 task)
   at MinimalApiPeliculas.Filtros.FiltroValidaciones`1.InvokeAsync(EndpointFilterInvocationContext context, EndpointFilterDelegate next) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Filtros\FiltroValidaciones.cs:line 29
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<ExecuteValueTaskOfObject>g__ExecuteAwaited|129_0(ValueTask`1 valueTask, HttpContext httpContext, JsonTypeInfo`1 jsonTypeInfo)
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<>c__DisplayClass102_2.<<HandleRequestBodyAndCompileRequestDelegateForJson>b__2>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Diagnostics.StatusCodePagesMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddlewareImpl.<Invoke>g__Awaited|10_0(ExceptionHandlerMiddlewareImpl middleware, HttpContext context, Task task)', CAST(N'2024-05-14T16:59:56.2133333' AS DateTime2))
INSERT [dbo].[Errores] ([Id], [MensajeDeError], [StackTrace], [Fecha]) VALUES (N'2cb20d76-1812-ef11-b92c-e4f89cfba81e', N'No se ha inicializado la propiedad ConnectionString.', N'   at Microsoft.Data.SqlClient.SqlConnection.PermissionDemand()
   at Microsoft.Data.SqlClient.SqlConnectionFactory.PermissionDemand(DbConnection outerConnection)
   at Microsoft.Data.ProviderBase.DbConnectionInternal.TryOpenConnectionInternal(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at Microsoft.Data.ProviderBase.DbConnectionClosed.TryOpenConnection(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at Microsoft.Data.SqlClient.SqlConnection.TryOpen(TaskCompletionSource`1 retry, SqlConnectionOverrides overrides)
   at Microsoft.Data.SqlClient.SqlConnection.InternalOpenAsync(CancellationToken cancellationToken)
--- End of stack trace from previous location ---
   at Dapper.SqlMapper.QueryRowAsync[T](IDbConnection cnn, Row row, Type effectiveType, CommandDefinition command) in /_/Dapper/SqlMapper.Async.cs:line 488
   at MinimalApiPeliculas.Repositorios.RepositorioUsuarios.BuscarUsuarioPorEmail(String normalizedEmail) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Repositorios\RepositorioUsuarios.cs:line 21
   at MinimalApiPeliculas.Servicios.UsuarioStore.FindByNameAsync(String normalizedUserName, CancellationToken cancellationToken) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Servicios\UsuarioStore.cs:line 50
   at Microsoft.AspNetCore.Identity.UserManager`1.FindByNameAsync(String userName)
   at Microsoft.AspNetCore.Identity.UserValidator`1.ValidateUserName(UserManager`1 manager, TUser user)
   at Microsoft.AspNetCore.Identity.UserValidator`1.ValidateAsync(UserManager`1 manager, TUser user)
   at Microsoft.AspNetCore.Identity.UserManager`1.ValidateUserAsync(TUser user)
   at Microsoft.AspNetCore.Identity.UserManager`1.CreateAsync(TUser user)
   at Microsoft.AspNetCore.Identity.UserManager`1.CreateAsync(TUser user, String password)
   at MinimalApiPeliculas.Endpoints.UsuariosEndpoints.Registrar(CredencialesUsuarioDTO credencialesUsuarioDTO, UserManager`1 userManager, IConfiguration configuration) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Endpoints\UsuariosEndpoints.cs:line 31
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<TaskOfTToValueTaskOfObject>g__ExecuteAwaited|92_0[T](Task`1 task)
   at MinimalApiPeliculas.Filtros.FiltroValidaciones`1.InvokeAsync(EndpointFilterInvocationContext context, EndpointFilterDelegate next) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Filtros\FiltroValidaciones.cs:line 29
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<ExecuteValueTaskOfObject>g__ExecuteAwaited|129_0(ValueTask`1 valueTask, HttpContext httpContext, JsonTypeInfo`1 jsonTypeInfo)
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<>c__DisplayClass102_2.<<HandleRequestBodyAndCompileRequestDelegateForJson>b__2>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Diagnostics.StatusCodePagesMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddlewareImpl.<Invoke>g__Awaited|10_0(ExceptionHandlerMiddlewareImpl middleware, HttpContext context, Task task)', CAST(N'2024-05-14T17:36:14.6733333' AS DateTime2))
INSERT [dbo].[Errores] ([Id], [MensajeDeError], [StackTrace], [Fecha]) VALUES (N'aebd083c-0413-ef11-b92e-e4f89cfba81e', N'The member Usuario of type Microsoft.AspNetCore.Identity.IdentityUser cannot be used as a parameter value', N'   at Dapper.SqlMapper.LookupDbType(Type type, String name, Boolean demand, ITypeHandler& handler) in /_/Dapper/SqlMapper.cs:line 497
   at Dapper.SqlMapper.CreateParamInfoGenerator(Identity identity, Boolean checkForDuplicates, Boolean removeUnused, IList`1 literals) in /_/Dapper/SqlMapper.cs:line 2656
   at Dapper.SqlMapper.GetCacheInfo(Identity identity, Object exampleParameters, Boolean addToCache) in /_/Dapper/SqlMapper.cs:line 1848
   at Dapper.SqlMapper.ExecuteImplAsync(IDbConnection cnn, CommandDefinition command, Object param) in /_/Dapper/SqlMapper.Async.cs:line 656
   at MinimalApiPeliculas.Repositorios.RepositorioComentarios.Actualizar(Comentario Comentario) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Repositorios\RepositorioComentarios.cs:line 71
   at MinimalApiPeliculas.Endpoints.ComentariosEndpoints.Actualizar(Int32 peliculaId, Int32 id, CrearComentarioDTO crearComentarioDTO, IOutputCacheStore outputCacheStore, IRepositorioComentarios repositorioComentarios, IRepositorioPeliculas repositorioPeliculas, IServicioUsuarios servicioUsuarios) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Endpoints\ComentariosEndpoints.cs:line 118
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<TaskOfTToValueTaskOfObject>g__ExecuteAwaited|92_0[T](Task`1 task)
   at MinimalApiPeliculas.Filtros.FiltroValidaciones`1.InvokeAsync(EndpointFilterInvocationContext context, EndpointFilterDelegate next) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Filtros\FiltroValidaciones.cs:line 29
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<ExecuteValueTaskOfObject>g__ExecuteAwaited|129_0(ValueTask`1 valueTask, HttpContext httpContext, JsonTypeInfo`1 jsonTypeInfo)
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<>c__DisplayClass102_2.<<HandleRequestBodyAndCompileRequestDelegateForJson>b__2>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Diagnostics.StatusCodePagesMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddlewareImpl.<Invoke>g__Awaited|10_0(ExceptionHandlerMiddlewareImpl middleware, HttpContext context, Task task)', CAST(N'2024-05-15T21:43:58.9533333' AS DateTime2))
INSERT [dbo].[Errores] ([Id], [MensajeDeError], [StackTrace], [Fecha]) VALUES (N'1d113a50-0413-ef11-b92e-e4f89cfba81e', N'The member Usuario of type Microsoft.AspNetCore.Identity.IdentityUser cannot be used as a parameter value', N'   at Dapper.SqlMapper.LookupDbType(Type type, String name, Boolean demand, ITypeHandler& handler) in /_/Dapper/SqlMapper.cs:line 497
   at Dapper.SqlMapper.CreateParamInfoGenerator(Identity identity, Boolean checkForDuplicates, Boolean removeUnused, IList`1 literals) in /_/Dapper/SqlMapper.cs:line 2656
   at Dapper.SqlMapper.GetCacheInfo(Identity identity, Object exampleParameters, Boolean addToCache) in /_/Dapper/SqlMapper.cs:line 1848
   at Dapper.SqlMapper.ExecuteImplAsync(IDbConnection cnn, CommandDefinition command, Object param) in /_/Dapper/SqlMapper.Async.cs:line 656
   at MinimalApiPeliculas.Repositorios.RepositorioComentarios.Actualizar(Comentario Comentario) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Repositorios\RepositorioComentarios.cs:line 71
   at MinimalApiPeliculas.Endpoints.ComentariosEndpoints.Actualizar(Int32 peliculaId, Int32 id, CrearComentarioDTO crearComentarioDTO, IOutputCacheStore outputCacheStore, IRepositorioComentarios repositorioComentarios, IRepositorioPeliculas repositorioPeliculas, IServicioUsuarios servicioUsuarios) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Endpoints\ComentariosEndpoints.cs:line 118
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<TaskOfTToValueTaskOfObject>g__ExecuteAwaited|92_0[T](Task`1 task)
   at MinimalApiPeliculas.Filtros.FiltroValidaciones`1.InvokeAsync(EndpointFilterInvocationContext context, EndpointFilterDelegate next) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Filtros\FiltroValidaciones.cs:line 29
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<ExecuteValueTaskOfObject>g__ExecuteAwaited|129_0(ValueTask`1 valueTask, HttpContext httpContext, JsonTypeInfo`1 jsonTypeInfo)
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<>c__DisplayClass102_2.<<HandleRequestBodyAndCompileRequestDelegateForJson>b__2>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Diagnostics.StatusCodePagesMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddlewareImpl.<Invoke>g__Awaited|10_0(ExceptionHandlerMiddlewareImpl middleware, HttpContext context, Task task)', CAST(N'2024-05-15T21:44:32.8500000' AS DateTime2))
INSERT [dbo].[Errores] ([Id], [MensajeDeError], [StackTrace], [Fecha]) VALUES (N'b2de4355-0713-ef11-b92e-e4f89cfba81e', N'The member Usuario of type Microsoft.AspNetCore.Identity.IdentityUser cannot be used as a parameter value', N'   at Dapper.SqlMapper.LookupDbType(Type type, String name, Boolean demand, ITypeHandler& handler) in /_/Dapper/SqlMapper.cs:line 497
   at Dapper.SqlMapper.CreateParamInfoGenerator(Identity identity, Boolean checkForDuplicates, Boolean removeUnused, IList`1 literals) in /_/Dapper/SqlMapper.cs:line 2656
   at Dapper.SqlMapper.GetCacheInfo(Identity identity, Object exampleParameters, Boolean addToCache) in /_/Dapper/SqlMapper.cs:line 1848
   at Dapper.SqlMapper.ExecuteImplAsync(IDbConnection cnn, CommandDefinition command, Object param) in /_/Dapper/SqlMapper.Async.cs:line 656
   at MinimalApiPeliculas.Repositorios.RepositorioComentarios.Actualizar(Comentario Comentario) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Repositorios\RepositorioComentarios.cs:line 71
   at MinimalApiPeliculas.Endpoints.ComentariosEndpoints.Actualizar(Int32 peliculaId, Int32 id, CrearComentarioDTO crearComentarioDTO, IOutputCacheStore outputCacheStore, IRepositorioComentarios repositorioComentarios, IRepositorioPeliculas repositorioPeliculas, IServicioUsuarios servicioUsuarios) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Endpoints\ComentariosEndpoints.cs:line 118
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<TaskOfTToValueTaskOfObject>g__ExecuteAwaited|92_0[T](Task`1 task)
   at MinimalApiPeliculas.Filtros.FiltroValidaciones`1.InvokeAsync(EndpointFilterInvocationContext context, EndpointFilterDelegate next) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Filtros\FiltroValidaciones.cs:line 29
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<ExecuteValueTaskOfObject>g__ExecuteAwaited|129_0(ValueTask`1 valueTask, HttpContext httpContext, JsonTypeInfo`1 jsonTypeInfo)
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<>c__DisplayClass102_2.<<HandleRequestBodyAndCompileRequestDelegateForJson>b__2>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Diagnostics.StatusCodePagesMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddlewareImpl.<Invoke>g__Awaited|10_0(ExceptionHandlerMiddlewareImpl middleware, HttpContext context, Task task)', CAST(N'2024-05-15T22:06:09.7733333' AS DateTime2))
INSERT [dbo].[Errores] ([Id], [MensajeDeError], [StackTrace], [Fecha]) VALUES (N'98186de6-0713-ef11-b92e-e4f89cfba81e', N'The member Usuario of type Microsoft.AspNetCore.Identity.IdentityUser cannot be used as a parameter value', N'   at Dapper.SqlMapper.LookupDbType(Type type, String name, Boolean demand, ITypeHandler& handler) in /_/Dapper/SqlMapper.cs:line 497
   at Dapper.SqlMapper.CreateParamInfoGenerator(Identity identity, Boolean checkForDuplicates, Boolean removeUnused, IList`1 literals) in /_/Dapper/SqlMapper.cs:line 2656
   at Dapper.SqlMapper.GetCacheInfo(Identity identity, Object exampleParameters, Boolean addToCache) in /_/Dapper/SqlMapper.cs:line 1848
   at Dapper.SqlMapper.ExecuteImplAsync(IDbConnection cnn, CommandDefinition command, Object param) in /_/Dapper/SqlMapper.Async.cs:line 656
   at MinimalApiPeliculas.Repositorios.RepositorioComentarios.Actualizar(Comentario Comentario) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Repositorios\RepositorioComentarios.cs:line 71
   at MinimalApiPeliculas.Endpoints.ComentariosEndpoints.Actualizar(Int32 peliculaId, Int32 id, CrearComentarioDTO crearComentarioDTO, IOutputCacheStore outputCacheStore, IRepositorioComentarios repositorioComentarios, IRepositorioPeliculas repositorioPeliculas, IServicioUsuarios servicioUsuarios) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Endpoints\ComentariosEndpoints.cs:line 118
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<TaskOfTToValueTaskOfObject>g__ExecuteAwaited|92_0[T](Task`1 task)
   at MinimalApiPeliculas.Filtros.FiltroValidaciones`1.InvokeAsync(EndpointFilterInvocationContext context, EndpointFilterDelegate next) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Filtros\FiltroValidaciones.cs:line 29
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<ExecuteValueTaskOfObject>g__ExecuteAwaited|129_0(ValueTask`1 valueTask, HttpContext httpContext, JsonTypeInfo`1 jsonTypeInfo)
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<>c__DisplayClass102_2.<<HandleRequestBodyAndCompileRequestDelegateForJson>b__2>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Diagnostics.StatusCodePagesMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddlewareImpl.<Invoke>g__Awaited|10_0(ExceptionHandlerMiddlewareImpl middleware, HttpContext context, Task task)', CAST(N'2024-05-15T22:10:13.3366667' AS DateTime2))
INSERT [dbo].[Errores] ([Id], [MensajeDeError], [StackTrace], [Fecha]) VALUES (N'660b270c-0813-ef11-b92e-e4f89cfba81e', N'The member Usuario of type Microsoft.AspNetCore.Identity.IdentityUser cannot be used as a parameter value', N'   at Dapper.SqlMapper.LookupDbType(Type type, String name, Boolean demand, ITypeHandler& handler) in /_/Dapper/SqlMapper.cs:line 497
   at Dapper.SqlMapper.CreateParamInfoGenerator(Identity identity, Boolean checkForDuplicates, Boolean removeUnused, IList`1 literals) in /_/Dapper/SqlMapper.cs:line 2656
   at Dapper.SqlMapper.GetCacheInfo(Identity identity, Object exampleParameters, Boolean addToCache) in /_/Dapper/SqlMapper.cs:line 1848
   at Dapper.SqlMapper.ExecuteImplAsync(IDbConnection cnn, CommandDefinition command, Object param) in /_/Dapper/SqlMapper.Async.cs:line 656
   at MinimalApiPeliculas.Repositorios.RepositorioComentarios.Actualizar(Comentario Comentario) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Repositorios\RepositorioComentarios.cs:line 71
   at MinimalApiPeliculas.Endpoints.ComentariosEndpoints.Actualizar(Int32 peliculaId, Int32 id, CrearComentarioDTO crearComentarioDTO, IOutputCacheStore outputCacheStore, IRepositorioComentarios repositorioComentarios, IRepositorioPeliculas repositorioPeliculas, IServicioUsuarios servicioUsuarios) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Endpoints\ComentariosEndpoints.cs:line 118
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<TaskOfTToValueTaskOfObject>g__ExecuteAwaited|92_0[T](Task`1 task)
   at MinimalApiPeliculas.Filtros.FiltroValidaciones`1.InvokeAsync(EndpointFilterInvocationContext context, EndpointFilterDelegate next) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Filtros\FiltroValidaciones.cs:line 29
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<ExecuteValueTaskOfObject>g__ExecuteAwaited|129_0(ValueTask`1 valueTask, HttpContext httpContext, JsonTypeInfo`1 jsonTypeInfo)
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<>c__DisplayClass102_2.<<HandleRequestBodyAndCompileRequestDelegateForJson>b__2>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Diagnostics.StatusCodePagesMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddlewareImpl.<Invoke>g__Awaited|10_0(ExceptionHandlerMiddlewareImpl middleware, HttpContext context, Task task)', CAST(N'2024-05-15T22:10:39.1100000' AS DateTime2))
INSERT [dbo].[Errores] ([Id], [MensajeDeError], [StackTrace], [Fecha]) VALUES (N'af827768-0913-ef11-b92e-e4f89cfba81e', N'The member Usuario of type Microsoft.AspNetCore.Identity.IdentityUser cannot be used as a parameter value', N'   at Dapper.SqlMapper.LookupDbType(Type type, String name, Boolean demand, ITypeHandler& handler) in /_/Dapper/SqlMapper.cs:line 497
   at Dapper.SqlMapper.CreateParamInfoGenerator(Identity identity, Boolean checkForDuplicates, Boolean removeUnused, IList`1 literals) in /_/Dapper/SqlMapper.cs:line 2656
   at Dapper.SqlMapper.GetCacheInfo(Identity identity, Object exampleParameters, Boolean addToCache) in /_/Dapper/SqlMapper.cs:line 1848
   at Dapper.SqlMapper.ExecuteImplAsync(IDbConnection cnn, CommandDefinition command, Object param) in /_/Dapper/SqlMapper.Async.cs:line 656
   at MinimalApiPeliculas.Repositorios.RepositorioComentarios.Actualizar(Comentario Comentario) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Repositorios\RepositorioComentarios.cs:line 71
   at MinimalApiPeliculas.Endpoints.ComentariosEndpoints.Actualizar(Int32 peliculaId, Int32 id, CrearComentarioDTO crearComentarioDTO, IOutputCacheStore outputCacheStore, IRepositorioComentarios repositorioComentarios, IRepositorioPeliculas repositorioPeliculas, IServicioUsuarios servicioUsuarios) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Endpoints\ComentariosEndpoints.cs:line 118
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<TaskOfTToValueTaskOfObject>g__ExecuteAwaited|92_0[T](Task`1 task)
   at MinimalApiPeliculas.Filtros.FiltroValidaciones`1.InvokeAsync(EndpointFilterInvocationContext context, EndpointFilterDelegate next) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Filtros\FiltroValidaciones.cs:line 29
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<ExecuteValueTaskOfObject>g__ExecuteAwaited|129_0(ValueTask`1 valueTask, HttpContext httpContext, JsonTypeInfo`1 jsonTypeInfo)
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<>c__DisplayClass102_2.<<HandleRequestBodyAndCompileRequestDelegateForJson>b__2>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Diagnostics.StatusCodePagesMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddlewareImpl.<Invoke>g__Awaited|10_0(ExceptionHandlerMiddlewareImpl middleware, HttpContext context, Task task)', CAST(N'2024-05-15T22:20:48.4466667' AS DateTime2))
INSERT [dbo].[Errores] ([Id], [MensajeDeError], [StackTrace], [Fecha]) VALUES (N'beaab171-0c13-ef11-b92e-e4f89cfba81e', N'The member Usuario of type Microsoft.AspNetCore.Identity.IdentityUser cannot be used as a parameter value', N'   at Dapper.SqlMapper.LookupDbType(Type type, String name, Boolean demand, ITypeHandler& handler) in /_/Dapper/SqlMapper.cs:line 497
   at Dapper.SqlMapper.CreateParamInfoGenerator(Identity identity, Boolean checkForDuplicates, Boolean removeUnused, IList`1 literals) in /_/Dapper/SqlMapper.cs:line 2656
   at Dapper.SqlMapper.GetCacheInfo(Identity identity, Object exampleParameters, Boolean addToCache) in /_/Dapper/SqlMapper.cs:line 1848
   at Dapper.SqlMapper.ExecuteImplAsync(IDbConnection cnn, CommandDefinition command, Object param) in /_/Dapper/SqlMapper.Async.cs:line 656
   at MinimalApiPeliculas.Repositorios.RepositorioComentarios.Actualizar(Comentario Comentario) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Repositorios\RepositorioComentarios.cs:line 71
   at MinimalApiPeliculas.Endpoints.ComentariosEndpoints.Actualizar(Int32 peliculaId, Int32 id, CrearComentarioDTO crearComentarioDTO, IOutputCacheStore outputCacheStore, IRepositorioComentarios repositorioComentarios, IRepositorioPeliculas repositorioPeliculas, IServicioUsuarios servicioUsuarios) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Endpoints\ComentariosEndpoints.cs:line 121
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<TaskOfTToValueTaskOfObject>g__ExecuteAwaited|92_0[T](Task`1 task)
   at MinimalApiPeliculas.Filtros.FiltroValidaciones`1.InvokeAsync(EndpointFilterInvocationContext context, EndpointFilterDelegate next) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Filtros\FiltroValidaciones.cs:line 29
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<ExecuteValueTaskOfObject>g__ExecuteAwaited|129_0(ValueTask`1 valueTask, HttpContext httpContext, JsonTypeInfo`1 jsonTypeInfo)
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<>c__DisplayClass102_2.<<HandleRequestBodyAndCompileRequestDelegateForJson>b__2>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Diagnostics.StatusCodePagesMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddlewareImpl.<Invoke>g__Awaited|10_0(ExceptionHandlerMiddlewareImpl middleware, HttpContext context, Task task)', CAST(N'2024-05-15T22:42:44.9666667' AS DateTime2))
INSERT [dbo].[Errores] ([Id], [MensajeDeError], [StackTrace], [Fecha]) VALUES (N'5dfecf79-0f13-ef11-b92e-e4f89cfba81e', N'The member Usuario of type Microsoft.AspNetCore.Identity.IdentityUser cannot be used as a parameter value', N'   at Dapper.SqlMapper.LookupDbType(Type type, String name, Boolean demand, ITypeHandler& handler) in /_/Dapper/SqlMapper.cs:line 497
   at Dapper.SqlMapper.CreateParamInfoGenerator(Identity identity, Boolean checkForDuplicates, Boolean removeUnused, IList`1 literals) in /_/Dapper/SqlMapper.cs:line 2656
   at Dapper.SqlMapper.GetCacheInfo(Identity identity, Object exampleParameters, Boolean addToCache) in /_/Dapper/SqlMapper.cs:line 1848
   at Dapper.SqlMapper.ExecuteImplAsync(IDbConnection cnn, CommandDefinition command, Object param) in /_/Dapper/SqlMapper.Async.cs:line 656
   at MinimalApiPeliculas.Repositorios.RepositorioComentarios.Actualizar(Comentario Comentario) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Repositorios\RepositorioComentarios.cs:line 71
   at MinimalApiPeliculas.Endpoints.ComentariosEndpoints.Actualizar(Int32 peliculaId, Int32 id, CrearComentarioDTO crearComentarioDTO, IOutputCacheStore outputCacheStore, IRepositorioComentarios repositorioComentarios, IRepositorioPeliculas repositorioPeliculas, IServicioUsuarios servicioUsuarios) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Endpoints\ComentariosEndpoints.cs:line 121
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<TaskOfTToValueTaskOfObject>g__ExecuteAwaited|92_0[T](Task`1 task)
   at MinimalApiPeliculas.Filtros.FiltroValidaciones`1.InvokeAsync(EndpointFilterInvocationContext context, EndpointFilterDelegate next) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Filtros\FiltroValidaciones.cs:line 29
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<ExecuteValueTaskOfObject>g__ExecuteAwaited|129_0(ValueTask`1 valueTask, HttpContext httpContext, JsonTypeInfo`1 jsonTypeInfo)
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<>c__DisplayClass102_2.<<HandleRequestBodyAndCompileRequestDelegateForJson>b__2>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Diagnostics.StatusCodePagesMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddlewareImpl.<Invoke>g__Awaited|10_0(ExceptionHandlerMiddlewareImpl middleware, HttpContext context, Task task)', CAST(N'2024-05-15T23:04:27.0566667' AS DateTime2))
INSERT [dbo].[Errores] ([Id], [MensajeDeError], [StackTrace], [Fecha]) VALUES (N'a4f48f9b-0f13-ef11-b92e-e4f89cfba81e', N'The member Usuario of type Microsoft.AspNetCore.Identity.IdentityUser cannot be used as a parameter value', N'   at Dapper.SqlMapper.LookupDbType(Type type, String name, Boolean demand, ITypeHandler& handler) in /_/Dapper/SqlMapper.cs:line 497
   at Dapper.SqlMapper.CreateParamInfoGenerator(Identity identity, Boolean checkForDuplicates, Boolean removeUnused, IList`1 literals) in /_/Dapper/SqlMapper.cs:line 2656
   at Dapper.SqlMapper.GetCacheInfo(Identity identity, Object exampleParameters, Boolean addToCache) in /_/Dapper/SqlMapper.cs:line 1848
   at Dapper.SqlMapper.ExecuteImplAsync(IDbConnection cnn, CommandDefinition command, Object param) in /_/Dapper/SqlMapper.Async.cs:line 656
   at MinimalApiPeliculas.Repositorios.RepositorioComentarios.Actualizar(Comentario Comentario) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Repositorios\RepositorioComentarios.cs:line 71
   at MinimalApiPeliculas.Endpoints.ComentariosEndpoints.Actualizar(Int32 peliculaId, Int32 id, CrearComentarioDTO crearComentarioDTO, IOutputCacheStore outputCacheStore, IRepositorioComentarios repositorioComentarios, IRepositorioPeliculas repositorioPeliculas, IServicioUsuarios servicioUsuarios) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Endpoints\ComentariosEndpoints.cs:line 121
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<TaskOfTToValueTaskOfObject>g__ExecuteAwaited|92_0[T](Task`1 task)
   at MinimalApiPeliculas.Filtros.FiltroValidaciones`1.InvokeAsync(EndpointFilterInvocationContext context, EndpointFilterDelegate next) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Filtros\FiltroValidaciones.cs:line 29
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<ExecuteValueTaskOfObject>g__ExecuteAwaited|129_0(ValueTask`1 valueTask, HttpContext httpContext, JsonTypeInfo`1 jsonTypeInfo)
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<>c__DisplayClass102_2.<<HandleRequestBodyAndCompileRequestDelegateForJson>b__2>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Diagnostics.StatusCodePagesMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddlewareImpl.<Invoke>g__Awaited|10_0(ExceptionHandlerMiddlewareImpl middleware, HttpContext context, Task task)', CAST(N'2024-05-15T23:05:23.7066667' AS DateTime2))
INSERT [dbo].[Errores] ([Id], [MensajeDeError], [StackTrace], [Fecha]) VALUES (N'0ed3da9d-bc13-ef11-b92e-e4f89cfba81e', N'The member Usuario of type Microsoft.AspNetCore.Identity.IdentityUser cannot be used as a parameter value', N'   at Dapper.SqlMapper.LookupDbType(Type type, String name, Boolean demand, ITypeHandler& handler) in /_/Dapper/SqlMapper.cs:line 497
   at Dapper.SqlMapper.CreateParamInfoGenerator(Identity identity, Boolean checkForDuplicates, Boolean removeUnused, IList`1 literals) in /_/Dapper/SqlMapper.cs:line 2656
   at Dapper.SqlMapper.GetCacheInfo(Identity identity, Object exampleParameters, Boolean addToCache) in /_/Dapper/SqlMapper.cs:line 1848
   at Dapper.SqlMapper.ExecuteImplAsync(IDbConnection cnn, CommandDefinition command, Object param) in /_/Dapper/SqlMapper.Async.cs:line 656
   at MinimalApiPeliculas.Repositorios.RepositorioComentarios.Actualizar(Comentario Comentario) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Repositorios\RepositorioComentarios.cs:line 71
   at MinimalApiPeliculas.Endpoints.ComentariosEndpoints.Actualizar(Int32 peliculaId, Int32 id, CrearComentarioDTO crearComentarioDTO, IOutputCacheStore outputCacheStore, IRepositorioComentarios repositorioComentarios, IRepositorioPeliculas repositorioPeliculas, IServicioUsuarios servicioUsuarios) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Endpoints\ComentariosEndpoints.cs:line 122
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<TaskOfTToValueTaskOfObject>g__ExecuteAwaited|92_0[T](Task`1 task)
   at MinimalApiPeliculas.Filtros.FiltroValidaciones`1.InvokeAsync(EndpointFilterInvocationContext context, EndpointFilterDelegate next) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Filtros\FiltroValidaciones.cs:line 29
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<ExecuteValueTaskOfObject>g__ExecuteAwaited|129_0(ValueTask`1 valueTask, HttpContext httpContext, JsonTypeInfo`1 jsonTypeInfo)
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<>c__DisplayClass102_2.<<HandleRequestBodyAndCompileRequestDelegateForJson>b__2>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.StatusCodePagesMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddlewareImpl.<Invoke>g__Awaited|10_0(ExceptionHandlerMiddlewareImpl middleware, HttpContext context, Task task)', CAST(N'2024-05-16T19:43:50.4766667' AS DateTime2))
INSERT [dbo].[Errores] ([Id], [MensajeDeError], [StackTrace], [Fecha]) VALUES (N'fe6fcfe7-ce13-ef11-b92e-e4f89cfba81e', N'The member Usuario of type Microsoft.AspNetCore.Identity.IdentityUser cannot be used as a parameter value', N'   at Dapper.SqlMapper.LookupDbType(Type type, String name, Boolean demand, ITypeHandler& handler) in /_/Dapper/SqlMapper.cs:line 497
   at Dapper.SqlMapper.CreateParamInfoGenerator(Identity identity, Boolean checkForDuplicates, Boolean removeUnused, IList`1 literals) in /_/Dapper/SqlMapper.cs:line 2656
   at Dapper.SqlMapper.GetCacheInfo(Identity identity, Object exampleParameters, Boolean addToCache) in /_/Dapper/SqlMapper.cs:line 1848
   at Dapper.SqlMapper.ExecuteImplAsync(IDbConnection cnn, CommandDefinition command, Object param) in /_/Dapper/SqlMapper.Async.cs:line 656
   at MinimalApiPeliculas.Repositorios.RepositorioComentarios.Actualizar(Comentario Comentario) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Repositorios\RepositorioComentarios.cs:line 71
   at MinimalApiPeliculas.Endpoints.ComentariosEndpoints.Actualizar(Int32 peliculaId, Int32 id, CrearComentarioDTO crearComentarioDTO, IOutputCacheStore outputCacheStore, IRepositorioComentarios repositorioComentarios, IRepositorioPeliculas repositorioPeliculas, IServicioUsuarios servicioUsuarios) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Endpoints\ComentariosEndpoints.cs:line 122
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<TaskOfTToValueTaskOfObject>g__ExecuteAwaited|92_0[T](Task`1 task)
   at MinimalApiPeliculas.Filtros.FiltroValidaciones`1.InvokeAsync(EndpointFilterInvocationContext context, EndpointFilterDelegate next) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Filtros\FiltroValidaciones.cs:line 29
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<ExecuteValueTaskOfObject>g__ExecuteAwaited|129_0(ValueTask`1 valueTask, HttpContext httpContext, JsonTypeInfo`1 jsonTypeInfo)
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<>c__DisplayClass102_2.<<HandleRequestBodyAndCompileRequestDelegateForJson>b__2>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.StatusCodePagesMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddlewareImpl.<Invoke>g__Awaited|10_0(ExceptionHandlerMiddlewareImpl middleware, HttpContext context, Task task)', CAST(N'2024-05-16T21:54:45.4300000' AS DateTime2))
INSERT [dbo].[Errores] ([Id], [MensajeDeError], [StackTrace], [Fecha]) VALUES (N'd4af6f88-d213-ef11-b92e-e4f89cfba81e', N'The member Usuario of type Microsoft.AspNetCore.Identity.IdentityUser cannot be used as a parameter value', N'   at Dapper.SqlMapper.LookupDbType(Type type, String name, Boolean demand, ITypeHandler& handler) in /_/Dapper/SqlMapper.cs:line 497
   at Dapper.SqlMapper.CreateParamInfoGenerator(Identity identity, Boolean checkForDuplicates, Boolean removeUnused, IList`1 literals) in /_/Dapper/SqlMapper.cs:line 2656
   at Dapper.SqlMapper.GetCacheInfo(Identity identity, Object exampleParameters, Boolean addToCache) in /_/Dapper/SqlMapper.cs:line 1848
   at Dapper.SqlMapper.ExecuteImplAsync(IDbConnection cnn, CommandDefinition command, Object param) in /_/Dapper/SqlMapper.Async.cs:line 656
   at MinimalApiPeliculas.Repositorios.RepositorioComentarios.Actualizar(Comentario Comentario) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Repositorios\RepositorioComentarios.cs:line 71
   at MinimalApiPeliculas.Endpoints.ComentariosEndpoints.Actualizar(Int32 peliculaId, Int32 id, CrearComentarioDTO crearComentarioDTO, IOutputCacheStore outputCacheStore, IRepositorioComentarios repositorioComentarios, IRepositorioPeliculas repositorioPeliculas, IServicioUsuarios servicioUsuarios) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Endpoints\ComentariosEndpoints.cs:line 122
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<TaskOfTToValueTaskOfObject>g__ExecuteAwaited|92_0[T](Task`1 task)
   at MinimalApiPeliculas.Filtros.FiltroValidaciones`1.InvokeAsync(EndpointFilterInvocationContext context, EndpointFilterDelegate next) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Filtros\FiltroValidaciones.cs:line 29
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<ExecuteValueTaskOfObject>g__ExecuteAwaited|129_0(ValueTask`1 valueTask, HttpContext httpContext, JsonTypeInfo`1 jsonTypeInfo)
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<>c__DisplayClass102_2.<<HandleRequestBodyAndCompileRequestDelegateForJson>b__2>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.StatusCodePagesMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddlewareImpl.<Invoke>g__Awaited|10_0(ExceptionHandlerMiddlewareImpl middleware, HttpContext context, Task task)', CAST(N'2024-05-16T22:20:43.4433333' AS DateTime2))
INSERT [dbo].[Errores] ([Id], [MensajeDeError], [StackTrace], [Fecha]) VALUES (N'06a3d81b-df13-ef11-b92e-e4f89cfba81e', N'The member Usuario of type Microsoft.AspNetCore.Identity.IdentityUser cannot be used as a parameter value', N'   at Dapper.SqlMapper.LookupDbType(Type type, String name, Boolean demand, ITypeHandler& handler) in /_/Dapper/SqlMapper.cs:line 497
   at Dapper.SqlMapper.CreateParamInfoGenerator(Identity identity, Boolean checkForDuplicates, Boolean removeUnused, IList`1 literals) in /_/Dapper/SqlMapper.cs:line 2656
   at Dapper.SqlMapper.GetCacheInfo(Identity identity, Object exampleParameters, Boolean addToCache) in /_/Dapper/SqlMapper.cs:line 1848
   at Dapper.SqlMapper.ExecuteImplAsync(IDbConnection cnn, CommandDefinition command, Object param) in /_/Dapper/SqlMapper.Async.cs:line 656
   at MinimalApiPeliculas.Repositorios.RepositorioComentarios.Actualizar(Comentario Comentario) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Repositorios\RepositorioComentarios.cs:line 71
   at MinimalApiPeliculas.Endpoints.ComentariosEndpoints.Actualizar(Int32 peliculaId, Int32 id, CrearComentarioDTO crearComentarioDTO, IOutputCacheStore outputCacheStore, IRepositorioComentarios repositorioComentarios, IRepositorioPeliculas repositorioPeliculas, IServicioUsuarios servicioUsuarios) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Endpoints\ComentariosEndpoints.cs:line 122
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<TaskOfTToValueTaskOfObject>g__ExecuteAwaited|92_0[T](Task`1 task)
   at MinimalApiPeliculas.Filtros.FiltroValidaciones`1.InvokeAsync(EndpointFilterInvocationContext context, EndpointFilterDelegate next) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Filtros\FiltroValidaciones.cs:line 29
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<ExecuteValueTaskOfObject>g__ExecuteAwaited|129_0(ValueTask`1 valueTask, HttpContext httpContext, JsonTypeInfo`1 jsonTypeInfo)
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<>c__DisplayClass102_2.<<HandleRequestBodyAndCompileRequestDelegateForJson>b__2>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.StatusCodePagesMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddlewareImpl.<Invoke>g__Awaited|10_0(ExceptionHandlerMiddlewareImpl middleware, HttpContext context, Task task)', CAST(N'2024-05-16T23:50:44.7466667' AS DateTime2))
INSERT [dbo].[Errores] ([Id], [MensajeDeError], [StackTrace], [Fecha]) VALUES (N'88527d31-df13-ef11-b92e-e4f89cfba81e', N'The member Usuario of type Microsoft.AspNetCore.Identity.IdentityUser cannot be used as a parameter value', N'   at Dapper.SqlMapper.LookupDbType(Type type, String name, Boolean demand, ITypeHandler& handler) in /_/Dapper/SqlMapper.cs:line 497
   at Dapper.SqlMapper.CreateParamInfoGenerator(Identity identity, Boolean checkForDuplicates, Boolean removeUnused, IList`1 literals) in /_/Dapper/SqlMapper.cs:line 2656
   at Dapper.SqlMapper.GetCacheInfo(Identity identity, Object exampleParameters, Boolean addToCache) in /_/Dapper/SqlMapper.cs:line 1848
   at Dapper.SqlMapper.ExecuteImplAsync(IDbConnection cnn, CommandDefinition command, Object param) in /_/Dapper/SqlMapper.Async.cs:line 656
   at MinimalApiPeliculas.Repositorios.RepositorioComentarios.Actualizar(Comentario Comentario) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Repositorios\RepositorioComentarios.cs:line 71
   at MinimalApiPeliculas.Endpoints.ComentariosEndpoints.Actualizar(Int32 peliculaId, Int32 id, CrearComentarioDTO crearComentarioDTO, IOutputCacheStore outputCacheStore, IRepositorioComentarios repositorioComentarios, IRepositorioPeliculas repositorioPeliculas, IServicioUsuarios servicioUsuarios) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Endpoints\ComentariosEndpoints.cs:line 122
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<TaskOfTToValueTaskOfObject>g__ExecuteAwaited|92_0[T](Task`1 task)
   at MinimalApiPeliculas.Filtros.FiltroValidaciones`1.InvokeAsync(EndpointFilterInvocationContext context, EndpointFilterDelegate next) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Filtros\FiltroValidaciones.cs:line 29
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<ExecuteValueTaskOfObject>g__ExecuteAwaited|129_0(ValueTask`1 valueTask, HttpContext httpContext, JsonTypeInfo`1 jsonTypeInfo)
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<>c__DisplayClass102_2.<<HandleRequestBodyAndCompileRequestDelegateForJson>b__2>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.StatusCodePagesMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddlewareImpl.<Invoke>g__Awaited|10_0(ExceptionHandlerMiddlewareImpl middleware, HttpContext context, Task task)', CAST(N'2024-05-16T23:51:21.0666667' AS DateTime2))
INSERT [dbo].[Errores] ([Id], [MensajeDeError], [StackTrace], [Fecha]) VALUES (N'b0b7b310-e313-ef11-b92e-e4f89cfba81e', N'The member Usuario of type Microsoft.AspNetCore.Identity.IdentityUser cannot be used as a parameter value', N'   at Dapper.SqlMapper.LookupDbType(Type type, String name, Boolean demand, ITypeHandler& handler) in /_/Dapper/SqlMapper.cs:line 497
   at Dapper.SqlMapper.CreateParamInfoGenerator(Identity identity, Boolean checkForDuplicates, Boolean removeUnused, IList`1 literals) in /_/Dapper/SqlMapper.cs:line 2656
   at Dapper.SqlMapper.GetCacheInfo(Identity identity, Object exampleParameters, Boolean addToCache) in /_/Dapper/SqlMapper.cs:line 1848
   at Dapper.SqlMapper.ExecuteImplAsync(IDbConnection cnn, CommandDefinition command, Object param) in /_/Dapper/SqlMapper.Async.cs:line 656
   at MinimalApiPeliculas.Repositorios.RepositorioComentarios.Actualizar(Comentario Comentario) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Repositorios\RepositorioComentarios.cs:line 71
   at MinimalApiPeliculas.Endpoints.ComentariosEndpoints.Actualizar(Int32 peliculaId, Int32 id, CrearComentarioDTO crearComentarioDTO, IOutputCacheStore outputCacheStore, IRepositorioComentarios repositorioComentarios, IRepositorioPeliculas repositorioPeliculas, IServicioUsuarios servicioUsuarios) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Endpoints\ComentariosEndpoints.cs:line 122
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<TaskOfTToValueTaskOfObject>g__ExecuteAwaited|92_0[T](Task`1 task)
   at MinimalApiPeliculas.Filtros.FiltroValidaciones`1.InvokeAsync(EndpointFilterInvocationContext context, EndpointFilterDelegate next) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Filtros\FiltroValidaciones.cs:line 29
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<ExecuteValueTaskOfObject>g__ExecuteAwaited|129_0(ValueTask`1 valueTask, HttpContext httpContext, JsonTypeInfo`1 jsonTypeInfo)
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<>c__DisplayClass102_2.<<HandleRequestBodyAndCompileRequestDelegateForJson>b__2>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.StatusCodePagesMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddlewareImpl.<Invoke>g__Awaited|10_0(ExceptionHandlerMiddlewareImpl middleware, HttpContext context, Task task)', CAST(N'2024-05-17T00:19:04.0300000' AS DateTime2))
INSERT [dbo].[Errores] ([Id], [MensajeDeError], [StackTrace], [Fecha]) VALUES (N'6ac2251c-e413-ef11-b92e-e4f89cfba81e', N'The member Usuario of type Microsoft.AspNetCore.Identity.IdentityUser cannot be used as a parameter value', N'   at Dapper.SqlMapper.LookupDbType(Type type, String name, Boolean demand, ITypeHandler& handler) in /_/Dapper/SqlMapper.cs:line 497
   at Dapper.SqlMapper.CreateParamInfoGenerator(Identity identity, Boolean checkForDuplicates, Boolean removeUnused, IList`1 literals) in /_/Dapper/SqlMapper.cs:line 2656
   at Dapper.SqlMapper.GetCacheInfo(Identity identity, Object exampleParameters, Boolean addToCache) in /_/Dapper/SqlMapper.cs:line 1848
   at Dapper.SqlMapper.ExecuteImplAsync(IDbConnection cnn, CommandDefinition command, Object param) in /_/Dapper/SqlMapper.Async.cs:line 656
   at MinimalApiPeliculas.Repositorios.RepositorioComentarios.Actualizar(Comentario Comentario) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Repositorios\RepositorioComentarios.cs:line 71
   at MinimalApiPeliculas.Endpoints.ComentariosEndpoints.Actualizar(Int32 peliculaId, Int32 id, CrearComentarioDTO crearComentarioDTO, IOutputCacheStore outputCacheStore, IRepositorioComentarios repositorioComentarios, IRepositorioPeliculas repositorioPeliculas, IServicioUsuarios servicioUsuarios) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Endpoints\ComentariosEndpoints.cs:line 122
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<TaskOfTToValueTaskOfObject>g__ExecuteAwaited|92_0[T](Task`1 task)
   at MinimalApiPeliculas.Filtros.FiltroValidaciones`1.InvokeAsync(EndpointFilterInvocationContext context, EndpointFilterDelegate next) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Filtros\FiltroValidaciones.cs:line 29
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<ExecuteValueTaskOfObject>g__ExecuteAwaited|129_0(ValueTask`1 valueTask, HttpContext httpContext, JsonTypeInfo`1 jsonTypeInfo)
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<>c__DisplayClass102_2.<<HandleRequestBodyAndCompileRequestDelegateForJson>b__2>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.StatusCodePagesMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddlewareImpl.<Invoke>g__Awaited|10_0(ExceptionHandlerMiddlewareImpl middleware, HttpContext context, Task task)', CAST(N'2024-05-17T00:26:32.7333333' AS DateTime2))
INSERT [dbo].[Errores] ([Id], [MensajeDeError], [StackTrace], [Fecha]) VALUES (N'a951cd66-e613-ef11-b92e-e4f89cfba81e', N'The member Usuario of type Microsoft.AspNetCore.Identity.IdentityUser cannot be used as a parameter value', N'   at Dapper.SqlMapper.LookupDbType(Type type, String name, Boolean demand, ITypeHandler& handler) in /_/Dapper/SqlMapper.cs:line 497
   at Dapper.SqlMapper.CreateParamInfoGenerator(Identity identity, Boolean checkForDuplicates, Boolean removeUnused, IList`1 literals) in /_/Dapper/SqlMapper.cs:line 2656
   at Dapper.SqlMapper.GetCacheInfo(Identity identity, Object exampleParameters, Boolean addToCache) in /_/Dapper/SqlMapper.cs:line 1848
   at Dapper.SqlMapper.ExecuteImplAsync(IDbConnection cnn, CommandDefinition command, Object param) in /_/Dapper/SqlMapper.Async.cs:line 656
   at MinimalApiPeliculas.Repositorios.RepositorioComentarios.Actualizar(Comentario Comentario) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Repositorios\RepositorioComentarios.cs:line 71
   at MinimalApiPeliculas.Endpoints.ComentariosEndpoints.Actualizar(Int32 peliculaId, Int32 id, CrearComentarioDTO crearComentarioDTO, IOutputCacheStore outputCacheStore, IRepositorioComentarios repositorioComentarios, IRepositorioPeliculas repositorioPeliculas, IServicioUsuarios servicioUsuarios) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Endpoints\ComentariosEndpoints.cs:line 122
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<TaskOfTToValueTaskOfObject>g__ExecuteAwaited|92_0[T](Task`1 task)
   at MinimalApiPeliculas.Filtros.FiltroValidaciones`1.InvokeAsync(EndpointFilterInvocationContext context, EndpointFilterDelegate next) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Filtros\FiltroValidaciones.cs:line 29
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<ExecuteValueTaskOfObject>g__ExecuteAwaited|129_0(ValueTask`1 valueTask, HttpContext httpContext, JsonTypeInfo`1 jsonTypeInfo)
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<>c__DisplayClass102_2.<<HandleRequestBodyAndCompileRequestDelegateForJson>b__2>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.StatusCodePagesMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddlewareImpl.<Invoke>g__Awaited|10_0(ExceptionHandlerMiddlewareImpl middleware, HttpContext context, Task task)', CAST(N'2024-05-17T00:42:56.9700000' AS DateTime2))
INSERT [dbo].[Errores] ([Id], [MensajeDeError], [StackTrace], [Fecha]) VALUES (N'9d9937b4-e713-ef11-b92e-e4f89cfba81e', N'The member Usuario of type Microsoft.AspNetCore.Identity.IdentityUser cannot be used as a parameter value', N'   at Dapper.SqlMapper.LookupDbType(Type type, String name, Boolean demand, ITypeHandler& handler) in /_/Dapper/SqlMapper.cs:line 497
   at Dapper.SqlMapper.CreateParamInfoGenerator(Identity identity, Boolean checkForDuplicates, Boolean removeUnused, IList`1 literals) in /_/Dapper/SqlMapper.cs:line 2656
   at Dapper.SqlMapper.GetCacheInfo(Identity identity, Object exampleParameters, Boolean addToCache) in /_/Dapper/SqlMapper.cs:line 1848
   at Dapper.SqlMapper.ExecuteImplAsync(IDbConnection cnn, CommandDefinition command, Object param) in /_/Dapper/SqlMapper.Async.cs:line 656
   at MinimalApiPeliculas.Repositorios.RepositorioComentarios.Actualizar(Comentario Comentario) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Repositorios\RepositorioComentarios.cs:line 72
   at MinimalApiPeliculas.Endpoints.ComentariosEndpoints.Actualizar(Int32 peliculaId, Int32 id, CrearComentarioDTO crearComentarioDTO, IOutputCacheStore outputCacheStore, IRepositorioComentarios repositorioComentarios, IRepositorioPeliculas repositorioPeliculas, IServicioUsuarios servicioUsuarios) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Endpoints\ComentariosEndpoints.cs:line 151
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<TaskOfTToValueTaskOfObject>g__ExecuteAwaited|92_0[T](Task`1 task)
   at MinimalApiPeliculas.Filtros.FiltroValidaciones`1.InvokeAsync(EndpointFilterInvocationContext context, EndpointFilterDelegate next) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Filtros\FiltroValidaciones.cs:line 29
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<ExecuteValueTaskOfObject>g__ExecuteAwaited|129_0(ValueTask`1 valueTask, HttpContext httpContext, JsonTypeInfo`1 jsonTypeInfo)
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<>c__DisplayClass102_2.<<HandleRequestBodyAndCompileRequestDelegateForJson>b__2>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.StatusCodePagesMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddlewareImpl.<Invoke>g__Awaited|10_0(ExceptionHandlerMiddlewareImpl middleware, HttpContext context, Task task)', CAST(N'2024-05-17T00:52:16.3533333' AS DateTime2))
INSERT [dbo].[Errores] ([Id], [MensajeDeError], [StackTrace], [Fecha]) VALUES (N'97b295ce-ea13-ef11-b92e-e4f89cfba81e', N'The member Usuario of type Microsoft.AspNetCore.Identity.IdentityUser cannot be used as a parameter value', N'   at Dapper.SqlMapper.LookupDbType(Type type, String name, Boolean demand, ITypeHandler& handler) in /_/Dapper/SqlMapper.cs:line 497
   at Dapper.SqlMapper.CreateParamInfoGenerator(Identity identity, Boolean checkForDuplicates, Boolean removeUnused, IList`1 literals) in /_/Dapper/SqlMapper.cs:line 2656
   at Dapper.SqlMapper.GetCacheInfo(Identity identity, Object exampleParameters, Boolean addToCache) in /_/Dapper/SqlMapper.cs:line 1848
   at Dapper.SqlMapper.ExecuteImplAsync(IDbConnection cnn, CommandDefinition command, Object param) in /_/Dapper/SqlMapper.Async.cs:line 656
   at MinimalApiPeliculas.Repositorios.RepositorioComentarios.Actualizar(Comentario Comentario) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Repositorios\RepositorioComentarios.cs:line 72
   at MinimalApiPeliculas.Endpoints.ComentariosEndpoints.Actualizar(Int32 peliculaId, Int32 id, CrearComentarioDTO crearComentarioDTO, IOutputCacheStore outputCacheStore, IRepositorioComentarios repositorioComentarios, IRepositorioPeliculas repositorioPeliculas, IServicioUsuarios servicioUsuarios) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Endpoints\ComentariosEndpoints.cs:line 187
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<TaskOfTToValueTaskOfObject>g__ExecuteAwaited|92_0[T](Task`1 task)
   at MinimalApiPeliculas.Filtros.FiltroValidaciones`1.InvokeAsync(EndpointFilterInvocationContext context, EndpointFilterDelegate next) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Filtros\FiltroValidaciones.cs:line 29
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<ExecuteValueTaskOfObject>g__ExecuteAwaited|129_0(ValueTask`1 valueTask, HttpContext httpContext, JsonTypeInfo`1 jsonTypeInfo)
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<>c__DisplayClass102_2.<<HandleRequestBodyAndCompileRequestDelegateForJson>b__2>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.StatusCodePagesMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddlewareImpl.<Invoke>g__Awaited|10_0(ExceptionHandlerMiddlewareImpl middleware, HttpContext context, Task task)', CAST(N'2024-05-17T01:14:29.0800000' AS DateTime2))
INSERT [dbo].[Errores] ([Id], [MensajeDeError], [StackTrace], [Fecha]) VALUES (N'cfce0cb8-eb13-ef11-b92e-e4f89cfba81e', N'The member Usuario of type Microsoft.AspNetCore.Identity.IdentityUser cannot be used as a parameter value', N'   at Dapper.SqlMapper.LookupDbType(Type type, String name, Boolean demand, ITypeHandler& handler) in /_/Dapper/SqlMapper.cs:line 497
   at Dapper.SqlMapper.CreateParamInfoGenerator(Identity identity, Boolean checkForDuplicates, Boolean removeUnused, IList`1 literals) in /_/Dapper/SqlMapper.cs:line 2656
   at Dapper.SqlMapper.GetCacheInfo(Identity identity, Object exampleParameters, Boolean addToCache) in /_/Dapper/SqlMapper.cs:line 1848
   at Dapper.SqlMapper.ExecuteImplAsync(IDbConnection cnn, CommandDefinition command, Object param) in /_/Dapper/SqlMapper.Async.cs:line 656
   at MinimalApiPeliculas.Repositorios.RepositorioComentarios.Actualizar(Comentario comentario) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Repositorios\RepositorioComentarios.cs:line 81
   at MinimalApiPeliculas.Endpoints.ComentariosEndpoints.Actualizar(Int32 peliculaId, Int32 id, CrearComentarioDTO crearComentarioDTO, IOutputCacheStore outputCacheStore, IRepositorioComentarios repositorioComentarios, IRepositorioPeliculas repositorioPeliculas, IServicioUsuarios servicioUsuarios) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Endpoints\ComentariosEndpoints.cs:line 151
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<TaskOfTToValueTaskOfObject>g__ExecuteAwaited|92_0[T](Task`1 task)
   at MinimalApiPeliculas.Filtros.FiltroValidaciones`1.InvokeAsync(EndpointFilterInvocationContext context, EndpointFilterDelegate next) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Filtros\FiltroValidaciones.cs:line 29
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<ExecuteValueTaskOfObject>g__ExecuteAwaited|129_0(ValueTask`1 valueTask, HttpContext httpContext, JsonTypeInfo`1 jsonTypeInfo)
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<>c__DisplayClass102_2.<<HandleRequestBodyAndCompileRequestDelegateForJson>b__2>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.StatusCodePagesMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddlewareImpl.<Invoke>g__Awaited|10_0(ExceptionHandlerMiddlewareImpl middleware, HttpContext context, Task task)', CAST(N'2024-05-17T01:21:00.7700000' AS DateTime2))
INSERT [dbo].[Errores] ([Id], [MensajeDeError], [StackTrace], [Fecha]) VALUES (N'b3f8110f-ef13-ef11-b92e-e4f89cfba81e', N'The member Usuario of type Microsoft.AspNetCore.Identity.IdentityUser cannot be used as a parameter value', N'   at Dapper.SqlMapper.LookupDbType(Type type, String name, Boolean demand, ITypeHandler& handler) in /_/Dapper/SqlMapper.cs:line 497
   at Dapper.SqlMapper.CreateParamInfoGenerator(Identity identity, Boolean checkForDuplicates, Boolean removeUnused, IList`1 literals) in /_/Dapper/SqlMapper.cs:line 2656
   at Dapper.SqlMapper.GetCacheInfo(Identity identity, Object exampleParameters, Boolean addToCache) in /_/Dapper/SqlMapper.cs:line 1848
   at Dapper.SqlMapper.ExecuteImplAsync(IDbConnection cnn, CommandDefinition command, Object param) in /_/Dapper/SqlMapper.Async.cs:line 656
   at MinimalApiPeliculas.Repositorios.RepositorioComentarios.Actualizar(Comentario Comentario) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Repositorios\RepositorioComentarios.cs:line 72
   at MinimalApiPeliculas.Endpoints.ComentariosEndpoints.Actualizar(Int32 peliculaId, Int32 id, CrearComentarioDTO crearComentarioDTO, IOutputCacheStore outputCacheStore, IRepositorioComentarios repositorioComentarios, IRepositorioPeliculas repositorioPeliculas, IServicioUsuarios servicioUsuarios) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Endpoints\ComentariosEndpoints.cs:line 151
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<TaskOfTToValueTaskOfObject>g__ExecuteAwaited|92_0[T](Task`1 task)
   at MinimalApiPeliculas.Filtros.FiltroValidaciones`1.InvokeAsync(EndpointFilterInvocationContext context, EndpointFilterDelegate next) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Filtros\FiltroValidaciones.cs:line 29
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<ExecuteValueTaskOfObject>g__ExecuteAwaited|129_0(ValueTask`1 valueTask, HttpContext httpContext, JsonTypeInfo`1 jsonTypeInfo)
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<>c__DisplayClass102_2.<<HandleRequestBodyAndCompileRequestDelegateForJson>b__2>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.StatusCodePagesMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddlewareImpl.<Invoke>g__Awaited|10_0(ExceptionHandlerMiddlewareImpl middleware, HttpContext context, Task task)', CAST(N'2024-05-17T01:44:55.2566667' AS DateTime2))
INSERT [dbo].[Errores] ([Id], [MensajeDeError], [StackTrace], [Fecha]) VALUES (N'1961338a-ef13-ef11-b92e-e4f89cfba81e', N'The member Usuario of type Microsoft.AspNetCore.Identity.IdentityUser cannot be used as a parameter value', N'   at Dapper.SqlMapper.LookupDbType(Type type, String name, Boolean demand, ITypeHandler& handler) in /_/Dapper/SqlMapper.cs:line 497
   at Dapper.SqlMapper.CreateParamInfoGenerator(Identity identity, Boolean checkForDuplicates, Boolean removeUnused, IList`1 literals) in /_/Dapper/SqlMapper.cs:line 2656
   at Dapper.SqlMapper.GetCacheInfo(Identity identity, Object exampleParameters, Boolean addToCache) in /_/Dapper/SqlMapper.cs:line 1848
   at Dapper.SqlMapper.ExecuteImplAsync(IDbConnection cnn, CommandDefinition command, Object param) in /_/Dapper/SqlMapper.Async.cs:line 656
   at MinimalApiPeliculas.Repositorios.RepositorioComentarios.Actualizar(Comentario Comentario) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Repositorios\RepositorioComentarios.cs:line 72
   at MinimalApiPeliculas.Endpoints.ComentariosEndpoints.Actualizar(Int32 peliculaId, Int32 id, CrearComentarioDTO crearComentarioDTO, IOutputCacheStore outputCacheStore, IRepositorioComentarios repositorioComentarios, IRepositorioPeliculas repositorioPeliculas, IServicioUsuarios servicioUsuarios) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Endpoints\ComentariosEndpoints.cs:line 151
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<TaskOfTToValueTaskOfObject>g__ExecuteAwaited|92_0[T](Task`1 task)
   at MinimalApiPeliculas.Filtros.FiltroValidaciones`1.InvokeAsync(EndpointFilterInvocationContext context, EndpointFilterDelegate next) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Filtros\FiltroValidaciones.cs:line 29
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<ExecuteValueTaskOfObject>g__ExecuteAwaited|129_0(ValueTask`1 valueTask, HttpContext httpContext, JsonTypeInfo`1 jsonTypeInfo)
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<>c__DisplayClass102_2.<<HandleRequestBodyAndCompileRequestDelegateForJson>b__2>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.StatusCodePagesMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddlewareImpl.<Invoke>g__Awaited|10_0(ExceptionHandlerMiddlewareImpl middleware, HttpContext context, Task task)', CAST(N'2024-05-17T01:47:53.2766667' AS DateTime2))
INSERT [dbo].[Errores] ([Id], [MensajeDeError], [StackTrace], [Fecha]) VALUES (N'1dba24ce-ef13-ef11-b92e-e4f89cfba81e', N'The member Usuario of type Microsoft.AspNetCore.Identity.IdentityUser cannot be used as a parameter value', N'   at Dapper.SqlMapper.LookupDbType(Type type, String name, Boolean demand, ITypeHandler& handler) in /_/Dapper/SqlMapper.cs:line 497
   at Dapper.SqlMapper.CreateParamInfoGenerator(Identity identity, Boolean checkForDuplicates, Boolean removeUnused, IList`1 literals) in /_/Dapper/SqlMapper.cs:line 2656
   at Dapper.SqlMapper.GetCacheInfo(Identity identity, Object exampleParameters, Boolean addToCache) in /_/Dapper/SqlMapper.cs:line 1848
   at Dapper.SqlMapper.ExecuteImplAsync(IDbConnection cnn, CommandDefinition command, Object param) in /_/Dapper/SqlMapper.Async.cs:line 656
   at MinimalApiPeliculas.Repositorios.RepositorioComentarios.Actualizar(Comentario Comentario) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Repositorios\RepositorioComentarios.cs:line 72
   at MinimalApiPeliculas.Endpoints.ComentariosEndpoints.Actualizar(Int32 peliculaId, Int32 id, CrearComentarioDTO crearComentarioDTO, IOutputCacheStore outputCacheStore, IRepositorioComentarios repositorioComentarios, IRepositorioPeliculas repositorioPeliculas, IServicioUsuarios servicioUsuarios) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Endpoints\ComentariosEndpoints.cs:line 151
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<TaskOfTToValueTaskOfObject>g__ExecuteAwaited|92_0[T](Task`1 task)
   at MinimalApiPeliculas.Filtros.FiltroValidaciones`1.InvokeAsync(EndpointFilterInvocationContext context, EndpointFilterDelegate next) in E:\Apis\Nueva carpeta\minimalApiPeliculas\MinimalApiPeliculas\Filtros\FiltroValidaciones.cs:line 29
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<ExecuteValueTaskOfObject>g__ExecuteAwaited|129_0(ValueTask`1 valueTask, HttpContext httpContext, JsonTypeInfo`1 jsonTypeInfo)
   at Microsoft.AspNetCore.Http.RequestDelegateFactory.<>c__DisplayClass102_2.<<HandleRequestBodyAndCompileRequestDelegateForJson>b__2>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.StatusCodePagesMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddlewareImpl.<Invoke>g__Awaited|10_0(ExceptionHandlerMiddlewareImpl middleware, HttpContext context, Task task)', CAST(N'2024-05-17T01:50:15.8300000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Generos] ON 

INSERT [dbo].[Generos] ([Id], [Nombre]) VALUES (1, N'Acción')
INSERT [dbo].[Generos] ([Id], [Nombre]) VALUES (2, N'Drama')
INSERT [dbo].[Generos] ([Id], [Nombre]) VALUES (3, N'Comedia')
INSERT [dbo].[Generos] ([Id], [Nombre]) VALUES (4, N'Biografía')
INSERT [dbo].[Generos] ([Id], [Nombre]) VALUES (6, N'Ciencia Ficción')
INSERT [dbo].[Generos] ([Id], [Nombre]) VALUES (9, N'Documental')
SET IDENTITY_INSERT [dbo].[Generos] OFF
GO
INSERT [dbo].[GenerosPeliculas] ([PeliculaId], [GeneroId]) VALUES (1, 1)
INSERT [dbo].[GenerosPeliculas] ([PeliculaId], [GeneroId]) VALUES (1, 2)
INSERT [dbo].[GenerosPeliculas] ([PeliculaId], [GeneroId]) VALUES (1, 6)
GO
SET IDENTITY_INSERT [dbo].[Peliculas] ON 

INSERT [dbo].[Peliculas] ([Id], [Titulo], [EnCines], [FechaLanzamiento], [Poster]) VALUES (1, N'Spider-Man: Far From Home', 1, CAST(N'2019-07-02T00:00:00.0000000' AS DateTime2), N'https://localhost:7047/peliculas/e2eee666-cd1b-4085-bd05-90d85e066df3.jpg')
INSERT [dbo].[Peliculas] ([Id], [Titulo], [EnCines], [FechaLanzamiento], [Poster]) VALUES (2, N'Spider-Man: No Way Home', 0, CAST(N'2021-05-02T00:00:00.0000000' AS DateTime2), N'https://localhost:7047/peliculas/c3718c4f-c49b-44ec-aaab-a77ff115ffde.jpg')
INSERT [dbo].[Peliculas] ([Id], [Titulo], [EnCines], [FechaLanzamiento], [Poster]) VALUES (3, N'Luca', 1, CAST(N'2022-07-02T00:00:00.0000000' AS DateTime2), N'https://localhost:7047/peliculas/20bc42ca-bc38-4c11-b0cf-c2886ff5d4bd.jpg')
INSERT [dbo].[Peliculas] ([Id], [Titulo], [EnCines], [FechaLanzamiento], [Poster]) VALUES (4, N'Toy Story 4', 1, CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), N'https://localhost:7047/peliculas/069e33a1-c58b-436d-8c58-56c293476705.jpg')
SET IDENTITY_INSERT [dbo].[Peliculas] OFF
GO
INSERT [dbo].[Usuarios] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'52ef6e20-08b5-440b-8ae7-39d558397887', N'matu@hotmail.com', N'MATU@HOTMAIL.COM', N'matu@hotmail.com', N'MATU@HOTMAIL.COM', 0, N'AQAAAAIAAYagAAAAEDrfau9zOHhHKBCeSx44+ZThWiy1VwY1g97q29kS7Uy6gbxYyf++s7QwaifxfIIfEQ==', NULL, NULL, NULL, 0, 0, NULL, 0, 0)
INSERT [dbo].[Usuarios] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'be84d562-6bad-4ab5-a015-0bd8dfd20387', N'matias@hotmail', N'MATIAS@HOTMAIL', N'matias@hotmail', N'MATIAS@HOTMAIL', 0, N'AQAAAAIAAYagAAAAEJ87zghc8CSXkdYij8fkKRG7j37yB1eVz46R5YWYIlRIhAbj6EPF0sY9vjPgJxPkXg==', NULL, NULL, NULL, 0, 0, NULL, 0, 0)
GO
ALTER TABLE [dbo].[Errores] ADD  CONSTRAINT [DF_Errores_Id]  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_EmailConfirmed]  DEFAULT ('false') FOR [EmailConfirmed]
GO
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_PhoneNumberConfirmed]  DEFAULT ('false') FOR [PhoneNumberConfirmed]
GO
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_TwoFactorEnabled]  DEFAULT ('false') FOR [TwoFactorEnabled]
GO
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_LockoutEnabled]  DEFAULT ('false') FOR [LockoutEnabled]
GO
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_AccessFailedCount]  DEFAULT ((0)) FOR [AccessFailedCount]
GO
ALTER TABLE [dbo].[ActoresPeliculas]  WITH CHECK ADD  CONSTRAINT [FK_ActoresPeliculas_Actores] FOREIGN KEY([ActorId])
REFERENCES [dbo].[Actores] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActoresPeliculas] CHECK CONSTRAINT [FK_ActoresPeliculas_Actores]
GO
ALTER TABLE [dbo].[ActoresPeliculas]  WITH CHECK ADD  CONSTRAINT [FK_ActoresPeliculas_Peliculas] FOREIGN KEY([PeliculaId])
REFERENCES [dbo].[Peliculas] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActoresPeliculas] CHECK CONSTRAINT [FK_ActoresPeliculas_Peliculas]
GO
ALTER TABLE [dbo].[Comentarios]  WITH CHECK ADD  CONSTRAINT [FK_Comentarios_Peliculas] FOREIGN KEY([PeliculaId])
REFERENCES [dbo].[Peliculas] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comentarios] CHECK CONSTRAINT [FK_Comentarios_Peliculas]
GO
ALTER TABLE [dbo].[Comentarios]  WITH CHECK ADD  CONSTRAINT [FK_Comentarios_Usuarios] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comentarios] CHECK CONSTRAINT [FK_Comentarios_Usuarios]
GO
ALTER TABLE [dbo].[GenerosPeliculas]  WITH CHECK ADD  CONSTRAINT [FK_GenerosPeliculas_Generos1] FOREIGN KEY([GeneroId])
REFERENCES [dbo].[Generos] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GenerosPeliculas] CHECK CONSTRAINT [FK_GenerosPeliculas_Generos1]
GO
ALTER TABLE [dbo].[GenerosPeliculas]  WITH CHECK ADD  CONSTRAINT [FK_GenerosPeliculas_Peliculas1] FOREIGN KEY([PeliculaId])
REFERENCES [dbo].[Peliculas] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GenerosPeliculas] CHECK CONSTRAINT [FK_GenerosPeliculas_Peliculas1]
GO
ALTER TABLE [dbo].[RolesClaims]  WITH CHECK ADD  CONSTRAINT [FK_RolesClaims_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RolesClaims] CHECK CONSTRAINT [FK_RolesClaims_Roles_RoleId]
GO
ALTER TABLE [dbo].[UsuariosClaims]  WITH CHECK ADD  CONSTRAINT [FK_UsuariosClaims_Usuarios_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsuariosClaims] CHECK CONSTRAINT [FK_UsuariosClaims_Usuarios_UserId]
GO
ALTER TABLE [dbo].[UsuariosLogins]  WITH CHECK ADD  CONSTRAINT [FK_UsuariosLogins_Usuarios_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsuariosLogins] CHECK CONSTRAINT [FK_UsuariosLogins_Usuarios_UserId]
GO
ALTER TABLE [dbo].[UsuariosRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsuariosRoles_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsuariosRoles] CHECK CONSTRAINT [FK_UsuariosRoles_Roles_RoleId]
GO
ALTER TABLE [dbo].[UsuariosRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsuariosRoles_Usuarios_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsuariosRoles] CHECK CONSTRAINT [FK_UsuariosRoles_Usuarios_UserId]
GO
ALTER TABLE [dbo].[UsuariosTokens]  WITH CHECK ADD  CONSTRAINT [FK_UsuariosTokens_Usuarios_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsuariosTokens] CHECK CONSTRAINT [FK_UsuariosTokens_Usuarios_UserId]
GO
/****** Object:  StoredProcedure [dbo].[Actores_Actualizar]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actores_Actualizar]
	-- Add the parameters for the stored procedure here
	@Nombre nvarchar(150),
	@FechaNacimiento datetime2,
	@Foto nvarchar(max),
	@Id int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Actores
	SET Nombre = @Nombre, FechaNacimiento = @FechaNacimiento, Foto = @Foto
	WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[Actores_Borrar]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actores_Borrar] 
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete Actores
	Where Id=@Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Actores_Cantidad]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actores_Cantidad]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT COUNT(*)
	FROM Actores
END
GO
/****** Object:  StoredProcedure [dbo].[Actores_Crear]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actores_Crear] 
	@Nombre nvarchar(150),
	@FechaNacimiento datetime2,
	@Foto nvarchar(max)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Actores(Nombre,FechaNacimiento,Foto)
	VALUES (@Nombre,@FechaNacimiento,@Foto)

	SELECT SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[Actores_ExistePorId]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actores_ExistePorId]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS (Select 1 FROM Actores WHERE Id = @Id)
		SELECT 1
		ELSE
		SELECT 0
END
GO
/****** Object:  StoredProcedure [dbo].[Actores_ObtenerPorId]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actores_ObtenerPorId]
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Actores
	WHERE Id=@Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Actores_ObtenerPorNombre]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actores_ObtenerPorNombre]
	-- Add the parameters for the stored procedure here
	@Nombre nvarchar(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * 
FROM Actores
WHERE Nombre LIke '%'+@Nombre+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[Actores_ObtenerTodos]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actores_ObtenerTodos]
	@pagina int,
@recordsPorPagina int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Actores
	ORDER BY Nombre
	OFFSET ((@pagina -1)*@recordsPorPagina) ROWS FETCH NEXT @recordsPorPagina ROWS ONLY

END
GO
/****** Object:  StoredProcedure [dbo].[Actores_ObtenerVariosPorId]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Actores_ObtenerVariosPorId]
	-- Add the parameters for the stored procedure here
	@actoresIds ListadoEnteros READONLY
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id
	FROM Actores
	WHERE Id in (SELECT Id from  @actoresIds);
END
GO
/****** Object:  StoredProcedure [dbo].[Comentarios_Actualizar]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Comentarios_Actualizar]
	-- Add the parameters for the stored procedure here
	@Cuerpo nvarchar (max),
	@PeliculaId int,
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Comentarios
	SET Cuerpo =@Cuerpo, PeliculaId= @PeliculaId
	WHERE Id =@Id; 
END
GO
/****** Object:  StoredProcedure [dbo].[Comentarios_Borrar]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Comentarios_Borrar]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE Comentarios WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Comentarios_Crear]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Comentarios_Crear]
	-- Add the parameters for the stored procedure here
	@Cuerpo nvarchar (Max),
	@PeliculaId int,
	@UsuarioId nvarchar(450)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Comentarios(Cuerpo, PeliculaId, UsuarioId)
	VALUES (@Cuerpo, @PeliculaId, @UsuarioId)

	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Comentarios_ExistePorId]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Comentarios_ExistePorId]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS (SELECT 1 FROM Comentarios WHERE Id = @Id)
	  SELECT 1;
	ELSE
	  SELECT 0;
END
GO
/****** Object:  StoredProcedure [dbo].[Comentarios_ObtenerPorId]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Comentarios_ObtenerPorId]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Comentarios
	WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Comentarios_ObtenerTodos]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Comentarios_ObtenerTodos]
	-- Add the parameters for the stored procedure here
	@PeliculaId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT*
	FROM Comentarios
	WHERE PeliculaId =@PeliculaId;
END
GO
/****** Object:  StoredProcedure [dbo].[Errores_Crear]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Errores_Crear]
	-- Add the parameters for the stored procedure here
	@MensajeDeError nvarchar(MAX),
	@StackTrace nvarchar(MAX),
	@Fecha datetime2
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Errores(MensajeDeError, StackTrace, Fecha)
	Values (@MensajeDeError, @StackTrace, @Fecha);
END
GO
/****** Object:  StoredProcedure [dbo].[Generos_Actualizar]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Generos_Actualizar]
	-- Add the parameters for the stored procedure here
	@Id int,
	@Nombre nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Generos
	SET Nombre =@Nombre
	 WHERE Id=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[Generos_Borrar]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Generos_Borrar]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE Generos
	WHERE Id=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[Generos_Crear]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Generos_Crear]
	-- Add the parameters for the stored procedure here
	@Nombre nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Generos (Nombre)
    VALUES (@Nombre);
    SELECT SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[Generos_ExistenPorIdYNombre]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Generos_ExistenPorIdYNombre] 
	-- Add the parameters for the stored procedure here
	@Id int,
	@Nombre nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS (SELECT  1 FROM Generos WHERE Id <> @Id AND Nombre = @Nombre)
		SELECT 1;
	ELSE
	   SELECT 0;
END
GO
/****** Object:  StoredProcedure [dbo].[Generos_ExisteporId]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Generos_ExisteporId]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS (SELECT 1 FROM Generos WHERE Id=@Id)
        SELECT 1
    ELSE
        SELECT 0
END
GO
/****** Object:  StoredProcedure [dbo].[Generos_ObtenerPorId]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Generos_ObtenerPorId] 
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id, Nombre
    FROM Generos
    WHERE Id=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[Generos_ObtenerTodos]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Generos_ObtenerTodos] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id, Nombre
    FROM Generos
    ORDER BY Nombre
END
GO
/****** Object:  StoredProcedure [dbo].[Generos_ObtenerVariosPorId]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Generos_ObtenerVariosPorId] 
	-- Add the parameters for the stored procedure here
	@generosIds ListadoEnteros READONLY
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id
	FROM Generos 
	WHERE Id in (SELECT Id FROM @generosIds);
END
GO
/****** Object:  StoredProcedure [dbo].[Pelicula_ObtenerTodos]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Pelicula_ObtenerTodos]
	-- Add the parameters for the stored procedure here
	@Pagina int,
	@RecordsPorPagina int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Peliculas
	ORDER BY Titulo
	OFFSET ((@Pagina -1)* @RecordsPorPagina) ROWS FETCH NEXT @RecordsPorPagina ROWS ONLY
END
GO
/****** Object:  StoredProcedure [dbo].[Peliculas_Actualizar]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Peliculas_Actualizar] 
	-- Add the parameters for the stored procedure here
	@Titulo nvarchar(150),
	@EnCines bit,
	@FechaLanzamiento datetime2,
	@Poster nvarchar(max),
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Peliculas
	SET Titulo=@Titulo, FechaLanzamiento=@FechaLanzamiento, Poster=@Poster, EnCines=@EnCines
	WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Peliculas_AsignarActores]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Peliculas_AsignarActores]
	-- Add the parameters for the stored procedure here
	@PeliculaId int,
	@actores ListadoActores READONLY
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete ActoresPeliculas WHERE PeliculaId = @PeliculaId;

	INSERT INTO ActoresPeliculas (ActorId, PeliculaId, Orden, Personaje)
	SELECT ActorId, @PeliculaId, Orden, Personaje FROM @actores;

END
GO
/****** Object:  StoredProcedure [dbo].[Peliculas_AsignarGeneros]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Peliculas_AsignarGeneros]
	-- Add the parameters for the stored procedure here
	@peliculaId int,
	@generosIds ListadoEnteros READONLY
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete GenerosPeliculas WHERE PeliculaId = @peliculaId

	INSERT INTO GenerosPeliculas (GeneroId, PeliculaId)
	SELECT Id, @peliculaId FROM @generosIds
END
GO
/****** Object:  StoredProcedure [dbo].[Peliculas_Borrar]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Peliculas_Borrar] 
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE Peliculas WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[Peliculas_Cantidad]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Peliculas_Cantidad]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT COUNT(*)
	FROM Peliculas;
END
GO
/****** Object:  StoredProcedure [dbo].[Peliculas_Crear]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Peliculas_Crear]
	-- Add the parameters for the stored procedure here
	@Titulo nvarchar(150),
	@EnCines bit,
	@FechaLanzamiento datetime2,
	@Poster nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Peliculas(Titulo, EnCines, FechaLanzamiento, Poster)
	VALUES (@Titulo, @EnCines, @FechaLanzamiento, @Poster);

	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Peliculas_ExistePorId]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Peliculas_ExistePorId] 
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS (SELECT 1 FROM Peliculas WHERE Id = @Id )
	  SELECT 1;
	ELSE
	  SELECT 0;
END
GO
/****** Object:  StoredProcedure [dbo].[Peliculas_ObtenerPorId]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Peliculas_ObtenerPorId] 
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM Peliculas
	WHERE Id=@id;

	SELECT *
	FROM Comentarios
	WHERE PeliculaId = @Id;

	SELECT Id, Nombre
	FROM Generos
	INNER JOIN GenerosPeliculas
	ON GenerosPeliculas.GeneroId=Id
	WHERE PeliculaId = @Id;

	SELECT Id, Nombre, Personaje
	FROM Actores
	INNER JOIN ActoresPeliculas
	ON ActoresPeliculas.ActorId=Id
	WHERE PeliculaId=@Id
	ORDER BY Orden

END
GO
/****** Object:  StoredProcedure [dbo].[Usuarios_BuscarPorEmail]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Usuarios_BuscarPorEmail]
	-- Add the parameters for the stored procedure here
	@normalizedEmail nvarchar(256)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT*
	From Usuarios
	WHERE NormalizedEmail = @normalizedEmail;
END
GO
/****** Object:  StoredProcedure [dbo].[Usuarios_Crear]    Script Date: 17/5/2024 20:06:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Usuarios_Crear]
	-- Add the parameters for the stored procedure here
	@Id nvarchar(450),
	@Email nvarchar(256),
	@NormalizedEmail nvarchar(256),
	@UserName nvarchar(256),
	@NormalizedUserName nvarchar(256),
	@PasswordHash nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Usuarios(Id, Email, NormalizedEmail, UserName, NormalizedUserName, PasswordHash)
	VALUES (@Id, @Email, @NormalizedEmail, @UserName, @NormalizedUserName, @PasswordHash);
END
GO
