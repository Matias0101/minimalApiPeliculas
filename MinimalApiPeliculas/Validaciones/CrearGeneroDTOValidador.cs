﻿using FluentValidation;
using MinimalApiPeliculas.DTOs;
using MinimalApiPeliculas.Repositorios;

namespace MinimalApiPeliculas.Validaciones
{
    public class CrearGeneroDTOValidador : AbstractValidator<CrearGeneroDTO>
    {
        public CrearGeneroDTOValidador(IRepositorioGeneros repositorioGeneros, 
            IHttpContextAccessor httpContextAccessor)
        {
            var valorDeRutaId = httpContextAccessor.HttpContext?.Request.RouteValues["id"];
            var id = 0;

            if (valorDeRutaId is string valorString)
            {
                int.TryParse(valorString, out id);
            }


            RuleFor(x => x.Nombre).NotEmpty().WithMessage(Utilidades.CampoRequeridoMensaje)
                                  .MaximumLength(50).WithMessage(Utilidades.MaximunLengthMensaje)
                                  .Must(Utilidades.PrimeraLetraEnMayuscula).WithMessage(Utilidades.PrimeraLetraMayusculaMensaje)
                                  .MustAsync(async (nombre, _) =>
                                  {
                                      var existe = await repositorioGeneros.Existe(id, nombre);
                                      return !existe;
                                  }).WithMessage(g => $"Ya existe un género con el nombre {g.Nombre}");
        }

        
    }
}
