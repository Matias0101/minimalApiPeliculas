using MinimalApiPeliculas.Entidades;

namespace MinimalApiPeliculas.Repositorios
{
    public interface IRepocitorioErrores
    {
        Task Crear(Error error);
    }
}