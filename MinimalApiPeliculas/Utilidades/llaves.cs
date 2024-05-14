using Microsoft.IdentityModel.Tokens;

namespace MinimalApiPeliculas.Utilidades
{
    public static class Llaves
    {
        public const string IssuerPropio = "nuestra-app";
        public const string SeccionLlaves = "Authentication:Schemes:Bearer:SigningKeys";
        public const string SeccionLlaves_Emisor = "Issuer";
        public const string SeccionLlaves_Valor = "Value";

        public static IEnumerable<SecurityKey> ObtenerLlave(IConfiguration configuration)
            => ObtenerLlave(configuration, IssuerPropio);

        public static IEnumerable<SecurityKey>ObtenerLlave(IConfiguration configuration, string issuer)
        {
            var signingKey = configuration.GetSection(SeccionLlaves)
                .GetChildren()
                .SingleOrDefault(llave => llave[SeccionLlaves_Emisor] == issuer);

            if (signingKey is not null && signingKey[SeccionLlaves_Valor]is string valorLlave)
            {
                yield return new SymmetricSecurityKey(Convert.FromBase64String(valorLlave));
            }
        }

        public static IEnumerable<SecurityKey> ObtenerTodasLasLlave(IConfiguration configuration)
        {
            var signningKeys = configuration.GetSection(SeccionLlaves)
                .GetChildren();

            foreach (var signingKey in signningKeys) 
            {
                if (signingKey[SeccionLlaves_Valor] is string valorLlave)
                {
                    yield return new SymmetricSecurityKey(Convert.FromBase64String(valorLlave));
                }
            }
                
            
        }

    }
}
/*
 "Authentication:Schemes:Bearer:SigningKeys": [
    {
      "Id": "LK4LM3S2",
      "Issuer": "nuestra-app",
      "Value": "nTn8R8L71UaVfuMYcrGVXVVQrgt9tZXAoHsxEXeW4Gc=",
      "Length": 32
    } */