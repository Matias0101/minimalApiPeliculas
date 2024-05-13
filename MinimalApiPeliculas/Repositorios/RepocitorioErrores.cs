using Dapper;
using Microsoft.Data.SqlClient;
using MinimalApiPeliculas.Entidades;

namespace MinimalApiPeliculas.Repositorios
{
    public class RepocitorioErrores : IRepocitorioErrores
    {
        private readonly string connectionString;

        public RepocitorioErrores(IConfiguration configuration)
        {
            connectionString = configuration.GetConnectionString("DefaultConnection")!;
        }
        public async Task Crear(Error error)
        {
            using (var conexion = new SqlConnection(connectionString))
            {
                await conexion.ExecuteAsync("Errores_Crear",
                    new { error.MensajeDeError, error.StackTrace, error.Fecha },
                    commandType: System.Data.CommandType.StoredProcedure);
            }
        }
    }
}
