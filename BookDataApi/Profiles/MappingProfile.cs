using AutoMapper;
using BookDataApi.Context;
using BookDataApi.Entities;
using BookDataApi.JsonModel;
using Microsoft.EntityFrameworkCore;

namespace BookDataApi;

public class MappingProfile : Profile
{
  private readonly BookContext db;

  public MappingProfile(BookContext bookContext)
  {
    this.db = bookContext;

    CreateMapBookToBookWithRating();
    CreateMapBookToBookWithRatingAndReviews();
    CreateMapBookToBookWithRatingAndCover();
    CreateMapBookToFullBook();
  }

  private void CreateMapBookToBookWithRatingAndCover()
  {
    CreateMap<Book, BookWithRatingAndCover>()
    .ForMember(e => e.id, (par) => par.MapFrom(e => e.Id))
    .ForMember(e => e.title, (par) => par.MapFrom(e => e.Title))
    .ForMember(e => e.author, (par) => par.MapFrom(e => e.Author))
    .ForMember(e => e.cover, (par) => par.MapFrom(e => Convert.ToBase64String(e.Cover)))
    .ForMember(e => e.rating, (par) => par.MapFrom(e => db.Rating.AsNoTracking().Where(r => r.BookId == e.Id).Select(k => k.Score).DefaultIfEmpty().Average(e => (decimal)e)))
    .ForMember(e => e.reviewsNumber, (par) => par.MapFrom(e => db.Review.Count(r => r.BookId == e.Id)));
  }

  private void CreateMapBookToBookWithRatingAndReviews()
  {
    CreateMap<Book, BookWithRatingAndReviews>()
    .ForMember(e => e.id, (par) => par.MapFrom(e => e.Id))
    .ForMember(e => e.title, (par) => par.MapFrom(e => e.Title))
    .ForMember(e => e.author, (par) => par.MapFrom(e => e.Author))
    .ForMember(e => e.cover, (par) => par.MapFrom(e => Convert.ToBase64String(e.Cover)))
    .ForMember(e => e.rating, (par) => par.MapFrom(e => db.Rating.Where(r => r.BookId == e.Id).Select(k => k.Score).DefaultIfEmpty().Average(e => (decimal)e)))
    .ForMember(e => e.reviews, par => par.MapFrom(e => db.Review.Where(k => k.BookId == e.Id).Select(k => new ShortReview(k.Id, k.Message, k.Reviewer)).ToArray()));
  }

  void CreateMapBookToBookWithRating()
  {
    CreateMap<Book, BookWithRating>()
    .ForMember(e => e.id, (par) => par.MapFrom(e => e.Id))
    .ForMember(e => e.title, (par) => par.MapFrom(e => e.Title))
    .ForMember(e => e.author, (par) => par.MapFrom(e => e.Author))
    .ForMember(e => e.rating, (par) => par.MapFrom(e => db.Rating.Where(r => r.BookId == e.Id).Select(k => k.Score).DefaultIfEmpty().Average(e => (decimal)e)))
    .ForMember(e => e.reviewsNumber, (par) => par.MapFrom(e => db.Review.Count(r => r.BookId == e.Id)));
  }


  private void CreateMapBookToFullBook()
  {
    CreateMap<Book, FullBookWithRatingAndReviews>()
    .ForMember(e => e.id, (par) => par.MapFrom(e => e.Id))
    .ForMember(e => e.title, (par) => par.MapFrom(e => e.Title))
    .ForMember(e => e.author, (par) => par.MapFrom(e => e.Author))
    .ForMember(e => e.cover, (par) => par.MapFrom(e => Convert.ToBase64String(e.Cover)))
    .ForMember(e => e.rating, (par) => par.MapFrom(e => db.Rating.Where(r => r.BookId == e.Id).Select(k => k.Score).DefaultIfEmpty().Average(e => (decimal)e)))
    .ForMember(e => e.reviews, par => par.MapFrom(e => db.Review.Where(k => k.BookId == e.Id).Select(k => new ShortReview(k.Id, k.Message, k.Reviewer)).ToArray()))
    .ForMember(e => e.reviewsNumber, (par) => par.MapFrom(e => db.Review.Count(r => r.BookId == e.Id)))
    .ForMember(e => e.genre, (par) => par.MapFrom(e => e.Genre));
  }

}


