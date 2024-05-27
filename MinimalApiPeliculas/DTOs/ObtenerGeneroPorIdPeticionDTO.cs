using AutoMapper;
using MinimalApiPeliculas.Repositorios;

namespace MinimalApiPeliculas.DTOs
{
    public class ObtenerGeneroPorIdPeticionDTO
    {
       public int Id { get; set; }
        public IRepositorioGeneros Repocitorio { get; set; }
        public IMapper Mapper { get; set; }
    }
}
