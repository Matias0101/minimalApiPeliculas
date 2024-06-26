﻿using Microsoft.Data.SqlClient;
using MinimalApiPeliculas.Entidades;
using System.Data;
using System.Data.Common;
using Dapper;

namespace MinimalApiPeliculas.Repositorios
{
    public class RepositorioComentarios
        : IRepositorioComentarios
    {
        private readonly string connectionString;

        public RepositorioComentarios(IConfiguration configuration)
        {
            connectionString = configuration.GetConnectionString("DefaultConnection")!;
        }

        public async Task<List<Comentario>> ObtenerTodos(int peliculaId)
        {
            using (var conexion = new SqlConnection(connectionString))
            {
                var comentarios = await conexion
                    .QueryAsync<Comentario>("Comentarios_ObtenerTodos",
                    new {peliculaId},
                    commandType: CommandType.StoredProcedure);
                return comentarios.ToList();

            }
        }
        public async Task<Comentario?> ObtenerPorId(int id)
        {
            using (var conexion = new SqlConnection(connectionString))
            {
                var comentario = await conexion
                    .QueryFirstOrDefaultAsync<Comentario>(
                    "Comentarios_ObtenerPorId", new { id },
                    commandType: CommandType.StoredProcedure);
                return comentario;

            }
        }
        public async Task<int> Crear(Comentario comentario)
        {
            using (var conexion = new SqlConnection(connectionString))
            {
                var id = await conexion.QuerySingleAsync<int>("Comentarios_Crear",
                    new { comentario.Cuerpo, comentario.PeliculaId, comentario.UsuarioId },
                    commandType: CommandType.StoredProcedure);
                comentario.Id = id;
                return id;

            }
        }
        public async Task<bool> Existe(int id)
        {
            using (var conexion = new SqlConnection(connectionString))
            {
                var existe = await conexion
                    .QuerySingleAsync<bool>("Comentarios_ExistePorId",
                    new { id },
                    commandType: CommandType.StoredProcedure);
                return existe;

            }
        }

        public async Task Actualizar(Comentario comentario)
        {
            using (var conexion = new SqlConnection(connectionString))
            {
                //await conexion.ExecuteAsync("Comentarios_Actualizar", comentario,
                await conexion.ExecuteAsync("Comentarios_Actualizar", new
                {
                    comentario.Cuerpo,
                    comentario.PeliculaId,
                    comentario.Id
                },
                  commandType: CommandType.StoredProcedure);

            }
        }

        public async Task Borrar(int id)
        {
            using (var conexion = new SqlConnection(connectionString))
            {
                await conexion.QueryAsync<Comentario>("Comentarios_Borrar", new { id },
                    commandType: CommandType.StoredProcedure);

            }
        }
    }
}
