using FluentValidation;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Identity;

//using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.OutputCaching;
using Microsoft.IdentityModel.Tokens;
using MinimalApiPeliculas.Endpoints;
using MinimalApiPeliculas.Entidades;
using MinimalApiPeliculas.Repositorios;
using MinimalApiPeliculas.Servicios;
using MinimalApiPeliculas.Utilidades;

var builder = WebApplication.CreateBuilder(args);

// Inicio de área de los servicios

builder.Services.AddCors(opciones =>
opciones.AddDefaultPolicy(configuracion =>
{
    configuracion.AllowAnyOrigin().AllowAnyHeader().AllowAnyMethod();
}));//cualquier pagina web podra comunicarce 

builder.Services.AddOutputCache();//configuro cache
builder.Services.AddEndpointsApiExplorer();//configurmos swagger
builder.Services.AddSwaggerGen();// a midleware

builder.Services.AddScoped<IRepositorioGeneros, RepositorioGeneros>();
builder.Services.AddScoped<IRepocitorioActores,RepocitorioActores>();
builder.Services.AddScoped<IRepositorioPeliculas, RepositorioPeliculas>();
builder.Services.AddScoped<IRepositorioComentarios, RepositorioComentarios>();
builder.Services.AddScoped<IRepocitorioErrores, RepocitorioErrores>();
builder.Services.AddScoped<IRepositorioUsuarios, RepositorioUsuarios>();

builder.Services.AddScoped<IAlmacenadorArchivos, AlmacnadorArchivosLocal>();

builder.Services.AddTransient<IServicioUsuarios, ServicioUsuarios>();

builder.Services.AddHttpContextAccessor();

builder.Services.AddAutoMapper(typeof(Program));

builder.Services.AddValidatorsFromAssemblyContaining<Program>();
builder.Services.AddProblemDetails();

//builder.Services.AddAuthentication().AddJwtBearer(opciones=>
//{
//    opciones.MapInboundClaims = false;

//    opciones.TokenValidationParameters = new TokenValidationParameters
//    {
//        ValidateIssuer = false,
//        ValidateAudience = false,
//        ValidateLifetime = true,
//        ValidateIssuerSigningKey = true,
//        //IssuerSigningKey=Llaves.ObtenerLlave(builder.Configuration).First(),
//        IssuerSigningKeys = Llaves.ObtenerTodasLasLlave(builder.Configuration),
//        ClockSkew = TimeSpan.Zero

//    };
//});//para poteger endpoint
builder.Services.AddAuthentication().AddJwtBearer(opciones =>
{
    opciones.MapInboundClaims = false;

    opciones.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuer = false,
        ValidateAudience = false,
        ValidateLifetime = true,
        ValidateIssuerSigningKey = true,
        //IssuerSigningKey = Llaves.ObtenerLlave(builder.Configuration).First(),
        IssuerSigningKeys = Llaves.ObtenerTodasLasLlave(builder.Configuration),
        ClockSkew = TimeSpan.Zero
    };
});
builder.Services.AddAuthorization();

builder.Services.AddTransient<IUserStore<IdentityUser>, UsuarioStore>();
builder.Services.AddIdentityCore<IdentityUser>();
builder.Services.AddTransient<SignInManager<IdentityUser>>();

//Fin del área de los servicios

var app = builder.Build();

// Inicio de área de los middleware

//if (builder.Environment.IsDevelopment())// solo para development
//{
//    app.UseSwagger();
//    app.UseSwaggerUI();

//}

app.UseSwagger();
app.UseSwaggerUI();

app.UseExceptionHandler(exceptionHandlerApp=> exceptionHandlerApp.Run(async context => 
{
    var exceptionHandlerFeature = context.Features.Get<IExceptionHandlerFeature>();

    var excepcion = exceptionHandlerFeature?.Error!;

    var error = new Error();
    error.Fecha = DateTime.UtcNow;
    error.MensajeDeError = excepcion.Message;
    error.StackTrace = excepcion.StackTrace;

    var repositorio = context.RequestServices.GetRequiredService<IRepocitorioErrores>();
    await repositorio.Crear(error);

    //await TypedResults.BadRequest(
    await Results.BadRequest(
        new { tipo = "error", mensaje = "ha ocurrido un mensaje de error inesperado", estatus = 500 })
    .ExecuteAsync(context);
}));

app.UseStatusCodePages();

app.UseStaticFiles();

app.UseCors();


app.UseOutputCache();

app.UseAuthorization();//esquema tojken nugget 

app.MapGet("/error", () =>
{
    throw new InvalidOperationException("error de ejemplo");
});

app.MapGroup("/generos").MapGeneros();//configura todos los endpoints de generos
app.MapGroup("/actores").MapActores();
app.MapGroup("/peliculas").MapPeliculas();
app.MapGroup("/pelicula/{PeliculaId:int}/comentarios").MapComentarios();
app.MapGroup("/usuarios").MapUsuarios();

//fin de área de los middleware

app.Run();

