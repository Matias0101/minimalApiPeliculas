using AutoMapper;
using MinimalApiPeliculas.DTOs;
using MinimalApiPeliculas.Entidades;

namespace MinimalApiPeliculas.Utilidades
{
    public class AutoMapperProfiles: Profile
    {
        public AutoMapperProfiles() 
        {
            CreateMap<CrearGeneroDTO, Genero>();
            CreateMap< Genero, GeneroDTO>();

            CreateMap<CrearActorDTO, Actor>()
            .ForMember(x => x.Foto, opciones => opciones.Ignore());// ignore discrepancia de string/IFormFile
            CreateMap<Actor, ActorDTO>();
        }
    }
}
