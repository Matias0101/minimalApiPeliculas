namespace MinimalApiPeliculas.Validaciones
{
    public static class Utilidades
    {
        public static string CampoRequeridoMensaje = "El campo {PropertyName} es requerido";
        public static string MaximunLengthMensaje = "El campo {PropertyName} debe tener menos de {MaxLength} caracteres";
        public static string PrimeraLetraMayusculaMensaje = "El Campo {PropertyName} debe comenzar con Mayusculas";
        public static string EmailMensaje = "El Campo {PropertyName} debe ser un email válido";
        public static string GreaterThanOrEqualToMensaje(DateTime fechaMinima)
        {
            return "El campo {PropertyName} debe ser posterior a " + fechaMinima.ToString("yyyy-MM-dd");
        }
        public static bool PrimeraLetraEnMayuscula(string valor)
        {
            if (string.IsNullOrWhiteSpace(valor))
            {
                return true;
            }
            var primerLetra = valor[0].ToString();

            return primerLetra == primerLetra.ToUpper();
        }
    }
}
