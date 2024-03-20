﻿using AutoMapper;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.OutputCaching;
using MinimalApiPeliculas.DTOs;
using MinimalApiPeliculas.Entidades;
using MinimalApiPeliculas.Repositorios;

namespace MinimalApiPeliculas.Endpoints
{
    public static class GenerosEndpoints
    {
        public static RouteGroupBuilder MapGeneros(this RouteGroupBuilder group)
        {
            group.MapGet("/", ObtenerGeneros).CacheOutput(c => c.Expire(TimeSpan.FromSeconds(60)).Tag("generos-get"));// establese una duracion de 15 segundos de memoria para no volver a llamar al endpoint

            group.MapGet("/{id:int}", ObtenerGenerosPorId);

            group.MapPost("/", CrearGenero);

            group.MapPut("/{id:int}", ActualizarGenero);

            group.MapDelete("/{id:int}", BorrarGenero);
            return group;
        }
        static async Task<Ok<List<GeneroDTO>>> ObtenerGeneros(IRepositorioGeneros repositorio, IMapper mapper)
        {

            var generos = await repositorio.ObtenerTodos();

            //var generosDTO = generos
            //    .Select(x => new GeneroDTO { Id = x.Id, Nombre = x.Nombre }).ToList();
            var generosDTO=mapper.Map<List<GeneroDTO>>(generos);

            return TypedResults.Ok(generosDTO);

        }


        static async Task<Results<Ok<GeneroDTO>, NotFound>> ObtenerGenerosPorId( 
            IRepositorioGeneros repositorio, int id, IMapper mapper)
        {

            var genero = await repositorio.ObtenerPorId(id);
            if (genero is null)
            {
                return TypedResults.NotFound();
            }

            //var generoDTO = new GeneroDTO
            //{
            //    Id = id,
            //    Nombre = genero.Nombre
            //};
            var generoDTO =mapper.Map<GeneroDTO>(genero);   

            return TypedResults.Ok(generoDTO);
        }


        static async Task<Created<GeneroDTO>> CrearGenero(CrearGeneroDTO crearGeneroDTO, 
            IRepositorioGeneros repositorioGeneros,
            IOutputCacheStore outputCacheStore, IMapper mapper)
        {
            //var genero = new Genero
            //{
            //    Nombre = crearGeneroDTO.Nombre
            //};
            var genero = mapper.Map<Genero>(crearGeneroDTO); //mapea desde crearGenero a Genero

            var id = await repositorioGeneros.CrearGenero(genero);
            await outputCacheStore.EvictByTagAsync("generos-get", default);//limpiamos el cache despues de un muevo genero

            //var generoDTO = new GeneroDTO
            //{
            //    Id = id,
            //    Nombre = genero.Nombre
            //};reemplazo por AutoMapper
            var generoDTO =mapper.Map<GeneroDTO>(genero);

            return TypedResults.Created($"/generos/{id}", generoDTO);
        }


        static async Task<Results<NoContent, NotFound>> ActualizarGenero(int id, 
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