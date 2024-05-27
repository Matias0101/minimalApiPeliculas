using AutoMapper;
using FluentValidation;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.OutputCaching;
using MinimalApiPeliculas.DTOs;
using MinimalApiPeliculas.Entidades;
using MinimalApiPeliculas.Filtros;
using MinimalApiPeliculas.Repositorios;

namespace MinimalApiPeliculas.Endpoints
{
    public static class GenerosEndpoints
    {
        public static RouteGroupBuilder MapGeneros(this RouteGroupBuilder group)
        {
            group.MapGet("/", ObtenerGeneros)
                .CacheOutput(c => c.Expire(TimeSpan.FromSeconds(60)).Tag("generos-get"));//.RequireAuthorization();// establese una duracion de 15 segundos de memoria para no volver a llamar al endpoint

            group.MapGet("/{id:int}", ObtenerGenerosPorId);

            group.MapPost("/", CrearGenero)
                .AddEndpointFilter<FiltroValidaciones<CrearGeneroDTO>>()
                .RequireAuthorization("esadmin");// al filtro le paso el dto a validar para <T>

            group.MapPut("/{id:int}", ActualizarGenero)
                .AddEndpointFilter<FiltroValidaciones<CrearGeneroDTO>>()
                .RequireAuthorization("esadmin")
                .WithOpenApi(opciones =>
                {
                    opciones.Summary = "Actualizar un genero";
                    opciones.Description = "Con este endpoint podemos actualizar un genero";
                    opciones.Parameters[0].Description = "El id del género a actualizar";
                    opciones.RequestBody.Description = "El género que se desea actualizar";

                    return opciones;
                });

            group.MapDelete("/{id:int}", BorrarGenero).RequireAuthorization("esadmin");
            return group;
        }
        static async Task<Ok<List<GeneroDTO>>> ObtenerGeneros
            (IRepositorioGeneros repositorio, IMapper mapper, ILoggerFactory loggerFactory)
        {
            var tipo = typeof(GenerosEndpoints);
            var logger = loggerFactory.CreateLogger(tipo.FullName!);
            //logger.LogInformation("Obteniendo el listado de generos");

            logger.LogTrace("Este es un mensaje de  Trace");
            logger.LogDebug("Este es un mensaje de Debug");
            logger.LogInformation("Este es un mensaje de informacion");
            logger.LogWarning("Este es un mensaje de Warning");
            logger.LogError("Este es un mensaje de error");
            logger.LogCritical("Este es un mensaje de critical");






            var generos = await repositorio.ObtenerTodos();

            //var generosDTO = generos
            //    .Select(x => new GeneroDTO { Id = x.Id, Nombre = x.Nombre }).ToList();
            var generosDTO=mapper.Map<List<GeneroDTO>>(generos);

            return TypedResults.Ok(generosDTO);

        }


        static async Task<Results<Ok<GeneroDTO>, NotFound>> ObtenerGenerosPorId( 
            [AsParameters] ObtenerGeneroPorIdPeticionDTO modelo)
        {

            var genero = await modelo.Repocitorio.ObtenerPorId(modelo.Id);
            if (genero is null)
            {
                return TypedResults.NotFound();
            }

            //var generoDTO = new GeneroDTO
            //{
            //    Id = id,
            //    Nombre = genero.Nombre
            //};
            var generoDTO =modelo.Mapper.Map<GeneroDTO>(genero);   

            return TypedResults.Ok(generoDTO);
        }


        static async Task<Results<Created<GeneroDTO>,ValidationProblem>> 
            CrearGenero(CrearGeneroDTO crearGeneroDTO, [AsParameters] CrearGeneroPeticionDTO modelo )
        {
            
            var genero = modelo.Mapper.Map<Genero>(crearGeneroDTO); //mapea desde crearGenero a Genero

            var id = await modelo.RepositorioGeneros.CrearGenero(genero);
            await modelo.OutputCacheStore.EvictByTagAsync("generos-get", default);//limpiamos el cache despues de un muevo genero
            var generoDTO =modelo.Mapper.Map<GeneroDTO>(genero);
            return TypedResults.Created($"/generos/{id}", generoDTO);
        }

        static async Task<Results<NoContent, NotFound, ValidationProblem>> ActualizarGenero(int id, 
            CrearGeneroDTO crearGeneroDTO, 
            IRepositorioGeneros repositorio,
            IOutputCacheStore outputCacheStore,IMapper mapper)
        {
            
            var existe = await repositorio.Existe(id);

            if (!existe)
            {
                return TypedResults.NotFound();
            }
            //var genero = new Genero
            //{
            //    Id = id,
            //    Nombre = crearGeneroDTO.Nombre
            //};
            var genero = mapper.Map<Genero>(crearGeneroDTO);
            genero.Id = id;

            await repositorio.Actualizar(genero);
            await outputCacheStore.EvictByTagAsync("generos-get", default);
            return TypedResults.NoContent();
        }


        static async Task<Results<NoContent, NotFound>> BorrarGenero(int id, IRepositorioGeneros repositorio,
           IOutputCacheStore outputCacheStore)
        {
            var existe = await repositorio.Existe(id);

            if (!existe)
            {
                return TypedResults.NotFound();
            }

            await repositorio.Borrar(id);
            await outputCacheStore.EvictByTagAsync("generos-get", default);
            return TypedResults.NoContent();

        }
    }
}
