using Microsoft.AspNetCore.Identity;

namespace MinimalApiPeliculas.Repositorios
{
    public interface IRepositorioUsuarios
    {
        Task<IdentityUser?> BuscarUsuarioPorEmail(string normalizedEmail);
        Task<string> Crear(IdentityUser usuario);
    }
}