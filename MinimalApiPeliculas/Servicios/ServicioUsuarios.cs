using Microsoft.AspNetCore.Identity;

namespace MinimalApiPeliculas.Servicios
{
    public class ServicioUsuarios : IServicioUsuarios
    {
        private readonly IHttpContextAccessor httpContextAccessor;
        private readonly UserManager<IdentityUser> userManager;

        public ServicioUsuarios(IHttpContextAccessor httpContextAccessor, UserManager<IdentityUser> userManager)
        {
            this.httpContextAccessor = httpContextAccessor;
            this.userManager = userManager;
        }

        public async Task<IdentityUser?> ObtenerUsuario()
        {
            var emailClain = httpContextAccessor.HttpContext!.User.Claims
                .Where(x => x.Type == "email").FirstOrDefault();

            if (emailClain is null)
            {
                return null;
            }

            var email = emailClain.Value;
            return await userManager.FindByEmailAsync(email);
        }
    }
}
