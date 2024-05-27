using AutoMapper;
using Microsoft.AspNetCore.OutputCaching;
using MinimalApiPeliculas.Repositorios;

namespace MinimalApiPeliculas.DTOs
{
    public class CrearGeneroPeticionDTO
    {
       public IRepositorioGeneros RepositorioGeneros {  get; set; }
           public IOutputCacheStore OutputCacheStore { get; set; }
           public IMapper Mapper { get; set; }
    }
}
