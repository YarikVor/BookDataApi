using AutoMapper;
using BookDataApi.Entities;

namespace BookDataApi;

public class MappingModelProfile : Profile
{

  public MappingModelProfile()
  {
    CreateMapBookCreatingModelToBook();
    CreateBookCreatingModelToBook();

  }

  void CreateMapBookCreatingModelToBook()
  {
    CreateMap<BookCreatingModel, Book>()
      .ForMember(e => e.Id, par => par.MapFrom(e => e.id))
      .ForMember(e => e.Author, par => par.MapFrom(e => e.author))
      .ForMember(e => e.Title, par => par.MapFrom(e => e.title))
      .ForMember(e => e.Genre, par => par.MapFrom(e => e.genre))
      .ForMember(e => e.Content, par => par.MapFrom(e => e.content))
      .ForMember(e => e.Cover, par => par.MapFrom(e => Convert.FromBase64String(e.cover))); ;



  }

  void CreateBookCreatingModelToBook()
  {
    CreateMap<ReviewCreatingModel, Review>()
      .ForMember(e => e.Message, par => par.MapFrom(e => e.message))
      .ForMember(e => e.Reviewer, par => par.MapFrom(e => e.message));
  }

}


