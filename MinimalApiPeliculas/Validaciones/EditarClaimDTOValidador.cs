using FluentValidation;
using MinimalApiPeliculas.DTOs;

namespace MinimalApiPeliculas.Validaciones
{
    public class EditarClaimDTOValidador: AbstractValidator<EditarClaimDto>
    {
        public EditarClaimDTOValidador() 
        {
            RuleFor(x => x.Email).NotEmpty().WithMessage(Utilidades.CampoRequeridoMensaje)
                .MaximumLength(256).WithMessage(Utilidades.MaximunLengthMensaje)
                .EmailAddress().WithMessage(Utilidades.EmailMensaje);
        }
    }
}
