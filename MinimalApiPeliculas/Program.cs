using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.OutputCaching;
using MinimalApiPeliculas.Endpoints;
using MinimalApiPeliculas.Entidades;
using MinimalApiPeliculas.Repositorios;
using MinimalApiPeliculas.Servicios;

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

builder.Services.AddScoped<IAlmacenadorArchivos, AlmacnadorArchivosLocal>();
builder.Services.AddHttpContextAccessor();

builder.Services.AddAutoMapper(typeof(Program));

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

app.UseStaticFiles();

app.UseCors();


app.UseOutputCache();

app.MapGroup("/generos").MapGeneros();//configura todos los endpoints de generos
app.MapGroup("/actores").MapActores();



app.Run();

