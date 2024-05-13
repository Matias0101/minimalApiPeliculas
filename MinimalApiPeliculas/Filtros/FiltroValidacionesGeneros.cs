﻿
using FluentValidation;
using MinimalApiPeliculas.DTOs;

namespace MinimalApiPeliculas.Filtros
{
    public class FiltroValidacionesGeneros : IEndpointFilter
    {
        public async ValueTask<object?> InvokeAsync(EndpointFilterInvocationContext context, EndpointFilterDelegate next)
        {
            return await next(context);
            
        }
    }
}
