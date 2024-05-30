using Microsoft.AspNetCore.Builder;
using Microsoft.OpenApi.Any;
using Microsoft.OpenApi.Models;

namespace MinimalApiPeliculas.Utilidades
{
    public static class SwaggerExtensions
    {
        public static TBuilder AgregarParametrosPeliculasOpenApi<TBuilder>(this TBuilder builder)
           where TBuilder : IEndpointConventionBuilder
        {
            return builder.WithOpenApi(opciones =>
            {

                opciones.Parameters.Add(new OpenApiParameter
                {
                    Name = "pagina",
                    In = ParameterLocation.Query,
                    Schema = new OpenApiSchema
                    {
                        Type = "integer",
                        Default = new OpenApiInteger(1)
                    }
                });
                opciones.Parameters.Add(new OpenApiParameter
                {
                    Name = "RecordsPorPagina",
                    In = ParameterLocation.Query,
                    Schema = new OpenApiSchema
                    {
                        Type = "integer",
                        Default = new OpenApiInteger(10)
                    }
                });
                opciones.Parameters.Add(new OpenApiParameter
                {
                    Name = "titulo",
                    In = ParameterLocation.Query,
                    Schema = new OpenApiSchema
                    {
                        Type = "String"
                       
                    }
                });
                opciones.Parameters.Add(new OpenApiParameter
                {
                    Name = "enCines",
                    In = ParameterLocation.Query,
                    Schema = new OpenApiSchema
                    {
                        Type = "boolean"

                    }
                });
                opciones.Parameters.Add(new OpenApiParameter
                {
                    Name = "proximosExtrenos",
                    In = ParameterLocation.Query,
                    Schema = new OpenApiSchema
                    {
                        Type = "boolean"

                    }
                });
                opciones.Parameters.Add(new OpenApiParameter
                {
                    Name = "generosId",
                    In = ParameterLocation.Query,
                    Schema = new OpenApiSchema
                    {
                        Type = "integer"

                    }
                });
                opciones.Parameters.Add(new OpenApiParameter
                {
                    Name = "campoOrdenar",
                    In = ParameterLocation.Query,
                    Schema = new OpenApiSchema
                    {
                        Type = "string",
                        Enum= new List<IOpenApiAny>()
                        {
                            new OpenApiString("Titulo"),
                            new OpenApiString("FechaLanzamiento")
                        }

                    }
                });
                opciones.Parameters.Add(new OpenApiParameter
                {
                    Name = "OrdenAscendente",
                    In = ParameterLocation.Query,
                    Schema = new OpenApiSchema
                    {
                        Type = "boolean",
                        Default = new OpenApiBoolean(true)

                    }
                });

                return opciones;
            });
        }
        ///

        public static TBuilder AgregarParametrosPaginacionOpenApi<TBuilder>(this TBuilder builder)
            where TBuilder : IEndpointConventionBuilder
        {
            return builder.WithOpenApi(opciones =>
            {

                opciones.Parameters.Add(new OpenApiParameter
                {
                    Name = "pagina",
                    In = ParameterLocation.Query,
                    Schema = new OpenApiSchema
                    {
                        Type = "integer",
                        Default= new OpenApiInteger(1)
                    }
                });
                opciones.Parameters.Add(new OpenApiParameter
                {
                    Name = "RecordsPorPagina",
                    In = ParameterLocation.Query,
                    Schema = new OpenApiSchema
                    {
                        Type = "integer",
                        Default = new OpenApiInteger(10)
                    }
                });

                return opciones;
            });
        }
    }
}
