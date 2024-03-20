
namespace MinimalApiPeliculas.Servicios
{
    public class AlmacnadorArchivosLocal : IAlmacenadorArchivos
    {
        private readonly IWebHostEnvironment env;
        private readonly IHttpContextAccessor httpContextAccessor;

        public AlmacnadorArchivosLocal(IWebHostEnvironment env, IHttpContextAccessor httpContextAccessor)
        {
            this.env = env;
            this.httpContextAccessor = httpContextAccessor;
        }
        public async Task<string> Almacenar(string contenedor, IFormFile archivo)
        {
            var extencion = Path.GetExtension(archivo.FileName);
            var nombreArchivo= $"{Guid.NewGuid()}{extencion}";//archiva siempre uno nombre nuevo
            string folder = Path.Combine(env.WebRootPath, contenedor);

            if (!Directory.Exists(folder))
            {
                Directory.CreateDirectory(folder);
            }

            string ruta = Path.Combine(folder, nombreArchivo);
            using (var ms =new MemoryStream()) 
            {
            await archivo.CopyToAsync(ms);
                var contenido = ms.ToArray();
                await File.WriteAllBytesAsync(ruta, contenido);
            }
            var url = $"{httpContextAccessor.HttpContext!.Request.Scheme}://{httpContextAccessor.HttpContext.Request.Host}";
            var arlArchivo = Path.Combine(url, contenedor, nombreArchivo).Replace("\\", "/");

            return arlArchivo;
        }

        public Task Borrar(string? ruta, string contenedor)
        {
            if (string.IsNullOrEmpty(ruta))
            {
                return Task.CompletedTask;
            }

            var nombreArchivo =Path.GetFileName(ruta);
            var directorioArchivo = Path.Combine(env.WebRootPath, contenedor, nombreArchivo);

            if (File.Exists(directorioArchivo))
            {
                File.Delete(directorioArchivo);
            }
            return Task .CompletedTask;
        }
    }
}
