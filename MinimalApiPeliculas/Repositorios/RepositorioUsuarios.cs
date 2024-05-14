using Dapper;
using Microsoft.AspNetCore.Identity;
using Microsoft.Data.SqlClient;
using System.Data;

namespace MinimalApiPeliculas.Repositorios
{
    public class RepositorioUsuarios : IRepositorioUsuarios
    {
        private readonly string connectionString;

        public RepositorioUsuarios(IConfiguration configuration)
        {
            connectionString = configuration.GetConnectionString("DefaultConnection")!;
        }

        public async Task<IdentityUser?> BuscarUsuarioPorEmail(string normalizedEmail)
        {
            using (var conexion = new SqlConnection(connectionString))
            {
                return await conexion.QuerySingleOrDefaultAsync<IdentityUser>
                    ("Usuarios_BuscarPorEmail", new { normalizedEmail },
                    commandType: CommandType.StoredProcedure);
            }
        }
        public async Task<string> Crear(IdentityUser usuario)
        {
            using (var conexion = new SqlConnection(connectionString))
            {
                usuario.Id = Guid.NewGuid().ToString();

                await conexion.ExecuteAsync("Usuarios_Crear", new
                {
                    usuario.Id,
                    usuario.Email,
                    usuario.NormalizedEmail,
                    usuario.UserName,
                    usuario.NormalizedUserName,
                    usuario.PasswordHash

                }, commandType: CommandType.StoredProcedure);

                return usuario.Id;
            }

        }
    }
}
