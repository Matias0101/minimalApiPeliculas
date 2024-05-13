
using AutoMapper;
using MinimalApiPeliculas.Repositorios;

namespace MinimalApiPeliculas.Filtros
{
    public class FiltrosDePrueba : IEndpointFilter
    {
        public async ValueTask<object?> InvokeAsync(EndpointFilterInvocationContext context, 
            EndpointFilterDelegate next)
        {
            //Este codigo se ejecuta antes del endpoint
            var paramRepositorioGeneros = context.Arguments.OfType<IRepositorioGeneros>().FirstOrDefault();
            var paramEntero = context.Arguments.OfType<int>().FirstOrDefault();
            var paramMapper = context.Arguments.OfType<IMapper>().FirstOrDefault();
            var resultado = await next(context);
            //Este codigo se ejecuta despues del endpoint
            return resultado;
        }
    }
}
