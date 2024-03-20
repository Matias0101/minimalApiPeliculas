using Dapper;
using Microsoft.Data.SqlClient;
using MinimalApiPeliculas.Entidades;
using System.Data;
using System.Data.Common;

namespace MinimalApiPeliculas.Repositorios
{
    public class RepositorioGeneros : IRepositorioGeneros
    {
        private readonly string? ConnectionString;

        public RepositorioGeneros(IConfiguration configuration)
        {
            ConnectionString = configuration.GetConnectionString("DefaultConnection");
        }

        //metodo select all
        public async Task<List<Genero>> ObtenerTodos()
        {
            using(var conexion = new SqlConnection(ConnectionString)) 
            {
                //var generos = await conexion.QueryAsync<Genero>(
                //                                                 @"SELECT Id, Nombre
                //                                                   FROM Generos
                //                                                   ORDER BY Nombre");
                var generos = await conexion.QueryAsync<Genero>(@"Generos_ObtenerTodos", 
                    commandType: CommandType.StoredProcedure);
                return generos.ToList();
            }
        }
        public async Task<Genero?>ObtenerPorId(int id)
        {
            using (var conexion = new SqlConnection(ConnectionString))
            {
                var genero = await conexion
                    .QueryFirstOrDefaultAsync<Genero>(@"Generos_ObtenerPorId", new { id },
                    commandType: CommandType.StoredProcedure);

                return genero;
            }
        }
        public async Task<int> CrearGenero(Genero genero)
        {
            using (var conexion = new SqlConnection(ConnectionString))
            {
                //var query = conexion.Query("SELECT 1").FirstOrDefault();
                var id = await conexion.QuerySingleAsync<int>(
                    "Generos_Crear", 
                    new { genero.Nombre }, 
                    commandType: CommandType.StoredProcedure);
                
                genero.Id = id;
                return id;
            }
          
        }

        public async Task<bool> Existe(int id)
        {
           using (var conexion = new SqlConnection (ConnectionString))
            {
                var existe = await conexion.QuerySingleAsync<bool>(
                    "Generos_ExisteporId", new { id }, commandType: CommandType.StoredProcedure);
                return existe;
            }
        }

        public async Task Actualizar(Genero genero)
        {
            using (var conexion = new SqlConnection(ConnectionString))
            {
                await conexion.ExecuteAsync("Generos_Actualizar", genero, 
                    commandType: CommandType.StoredProcedure);
            }
        }

        public async Task Borrar(int id)
        {
            using (var conexion = new SqlConnection(ConnectionString))
            {
                await conexion.ExecuteAsync("Generos_Borrar", new { id },
                    commandType: CommandType.StoredProcedure);
            }
        }
    }
}
