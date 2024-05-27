using Microsoft.IdentityModel.Tokens;
using MinimalApiPeliculas.Utilidades;
using System.Threading.Tasks;

namespace MinimalApiPeliculas.DTOs
{
    public class PaginacionDTO
    {
        public const int paginaValorInicial = 1;
        public const int recordsPorPaginaValorInicial = 10;
        public int Pagina { get; set; } = paginaValorInicial;
        private int recordsPorPagina = recordsPorPaginaValorInicial;
        private readonly int cantidadMaximaRecordsPorPagina = 50;

        public int RecordsPorpagina
        {
            get { return recordsPorPagina; }
            set { recordsPorPagina = (value > cantidadMaximaRecordsPorPagina) ? cantidadMaximaRecordsPorPagina : value; }
        }
        public static ValueTask<PaginacionDTO> BindAsync(HttpContext context)
        {
            var pagina = context.ExtraerValorODefecto(nameof(Pagina), paginaValorInicial);
            var recordsPorPagina = context.ExtraerValorODefecto(nameof(RecordsPorpagina),
                recordsPorPaginaValorInicial);
            
            //var paginaInt = pagina.IsNullOrEmpty() ? paginaValorInicial:int.Parse(pagina.ToString());
            //var recordsPorPaginaInt = recordsPorPagina.IsNullOrEmpty() 
            //    ? recordsPorPaginaValorInicial : int.Parse(recordsPorPagina.ToString());

            var resultado = new PaginacionDTO
            {
                Pagina = pagina,
                RecordsPorpagina = recordsPorPagina,
            };
            return ValueTask.FromResult(resultado);

        }
    }
    
}
