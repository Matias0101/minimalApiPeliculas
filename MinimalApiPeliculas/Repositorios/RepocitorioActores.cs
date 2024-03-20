using Dapper;
using Microsoft.Data.SqlClient;
using MinimalApiPeliculas.DTOs;
using MinimalApiPeliculas.Entidades;
using System.Data;
using System.Data.Common;

namespace MinimalApiPeliculas.Repositorios
{
    public class RepocitorioActores : IRepocitorioActores
    {
        private readonly string connectionString;
        private readonly HttpContext httpContext;

        public RepocitorioActores(IConfiguration configuration,
            IHttpContextAccessor httpContextAccessor)
        {
            connectionString = configuration.GetConnectionString("DefaultConnection")!;
            httpContext = httpContextAccessor.HttpContext!;
        }

        public async Task<List<Actor>> ObtenerTodos(PaginacionDTO paginacionDTO)
        {
            using (var conexion = new SqlConnection(connectionString))
            {
                var actores = await conexion.QueryAsync<Actor>("Actores_ObtenerTodos",
                    new {paginacionDTO.Pagina, paginacionDTO.RecordsPorpagina},
                    commandType: CommandType.StoredProcedure);

                var cantidadActores =await conexion.QuerySingleAsync<int>(
                    "Actores_Cantidad", commandType: CommandType.StoredProcedure);

                httpContext.Response.Headers.Append("cantidadTotalRegistros",
                    cantidadActores.ToString());

                return actores.ToList();
            }
        }
        public async Task<Actor?> ObtenerPorId(int id)
        {
            using (var conexion = new SqlConnection(connectionString))
            {
                var actor = await conexion.QueryFirstOrDefaultAsync<Actor>("Actores_ObtenerPorId",
                    new { id }, commandType: CommandType.StoredProcedure);
                return actor;
            }
        }
        public async Task<List<Actor>> ObtenerPorNombre(string nombre)
        {
            using (var conexion = new SqlConnection(connectionString))
            {
                var actores = await conexion.QueryAsync<Actor>("Actores_ObtenerPorNombre",
                    new
                    {
                        nombre
                    }, commandType: CommandType.StoredProcedure);
                return actores.ToList();
            }
        }

        public async Task<int> Crear(Actor actor)
        {
            using (var conexion = new SqlConnection(connectionString))
            {
                var id = await conexion.QuerySingleAsync<int>("Actores_Crear",
                    new
                    {
                        actor.Nombre,
                        actor.FechaNacimiento,
                        actor.Foto
                    },
                    commandType: CommandType.StoredProcedure);
                return id;

            }

        }
        public async Task Actualizar(Actor actor)
        {
            using (var conexion = new SqlConnection(connectionString))
            {
                await conexion.ExecuteAsync("Actores_Actualizar", actor,
                    commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<bool> Existe(int id)
        {
            using (var conexion = new SqlConnection(connectionString))
            {
                var existe = await conexion.QuerySingleAsync<bool>("Actores_ExistePorId",
                    new { id }, commandType: CommandType.StoredProcedure);
                return existe;
            }
        }
        public async Task Borrar(int id)
        {
            using (var conexion = new SqlConnection(connectionString))
            {
                await conexion.ExecuteAsync("Actores_Borrar", new { id });
            }
        }
    }
}
