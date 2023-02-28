using AutoMapper;
using BookDataApi.Context;
using BookDataApi.Entities;
using BookDataApi.JsonModel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BookDataApi.Controllers;

[ApiController]
[Route("api")]
public class ApiController : Controller
{
  readonly BookContext db;
  readonly IMapper mapper;
  private readonly IConfiguration configRoot;

  public ApiController(BookContext Db, IMapper Mapper, IConfiguration ConfigRoot)
  {
    db = Db;
    mapper = Mapper;
    configRoot = ConfigRoot
      ?? throw new ArgumentNullException(nameof(ConfigRoot));
  }


  [HttpGet("books")]
  public async Task<IActionResult> Books(string? order)
  {
    IQueryable<Book> queryable = order switch
    {
      "title" => db.Book.OrderBy(e => e.Title),
      "author" => db.Book.OrderBy(e => e.Author),
      _ => db.Book
    };

    var books = await queryable
      .Take(10)
      .ToArrayAsync();

    var booksWithRating = books
      .Select(e => mapper.Map<Book, BookWithRating>(e));

    return Json(booksWithRating);
  }

  [HttpGet("recommended")]
  public async Task<IActionResult> Recommended(string? genre)
  {
    IQueryable<Book> queryable =
      string.IsNullOrEmpty(genre) ? db.Book : db.Book.Where(e => e.Genre == genre);

    var books = await queryable
      .Where(e => db.Rating.Where(k => k.BookId == e.Id).Count() >= 10)
      .OrderByDescending(e => db.Rating.Where(k => k.BookId == e.Id).Count())
      .Take(10)
      .ToArrayAsync();

    var booksWithRating = books
      .Select(e => mapper.Map<Book, BookWithRatingAndCover>(e));

    return Json(booksWithRating);
  }

  [HttpGet("books/{id}")]
  public async Task<IActionResult> DetailsBook(int id)
  {
    var entity = await db.Book.FirstOrDefaultAsync(e => e.Id == id);
    if (entity == null)
    {
      return Json(new object());
    }
    var res = mapper.Map<Book, BookWithRatingAndReviews>(entity);
    return Json(res);
  }

  [HttpGet("books/{id}/full")]
  public async Task<IActionResult> FullDetailsBook(int id)
  {
    var entity = await db.Book.FirstOrDefaultAsync(e => e.Id == id);
    if (entity == null)
    {
      return Json(new object());
    }
    var res = mapper.Map<Book, FullBookWithRatingAndReviews>(entity);
    return Json(res);
  }

  [HttpDelete("books/{id}")]
  public async Task<IActionResult> Delete(int id, string secret)
  {
    if (secret == configRoot.GetValue<string>("Secret"))
    {
      var book = await db.Book.FindAsync(id);
      if (book != null)
      {
        db.Book.Remove(book);
        await db.SaveChangesAsync();
        return Ok();
      }
    }

    return BadRequest();
  }

  [HttpPost("books/save")]
  public async Task<IActionResult> Save(BookCreatingModel model)
  {
    if (!ModelState.IsValid)
    {
      return BadRequest();
    }

    Book book;
    try
    {
      book = mapper.Map<BookCreatingModel, Book>(model);
    }
    catch
    {
      return BadRequest();
    }

    if (model.id == 0)
    {
      await db.Book.AddAsync(book);
    }
    else if (await db.Book.AnyAsync(e => e.Id == model.id))
    {
      db.Book.Update(book);
    }
    else
    {
      return BadRequest();
    }

    await db.SaveChangesAsync();

    return Json(new { id = book.Id });
  }

  [HttpPut("books/{id}/review")]
  public async Task<IActionResult> Review(int id, ReviewCreatingModel model)
  {
    if (!ModelState.IsValid || !await db.Book.AnyAsync(e => e.Id == id))
      return BadRequest();

    var rewiew = mapper.Map<ReviewCreatingModel, Review>(model);
    rewiew.BookId = id;

    await db.Review.AddAsync(rewiew);
    await db.SaveChangesAsync();

    return Json(new { id = rewiew.Id });
  }

  [HttpPut("books/{id}/rate")]
  public async Task<IActionResult> Rate(int id)
  {
    if (!await db.Book.AnyAsync(e => e.Id == id) || id == 0)
    {
      return BadRequest();
    }

    double score = await db.Rating
      .Where(e => e.BookId == id)
      .Select(e => e.Score)
      .DefaultIfEmpty()
      .AverageAsync(e => (double)e);

    return Json(new { score = score });
  }

  [HttpGet("books/all")]
  public async Task<IActionResult> GetAll()
  {
    var array = await db.Book.AsNoTracking().ToArrayAsync();
    var result = array.Select(e => mapper.Map<Book, BookWithRatingAndCover>(e));
    return Json(result);
  }
}


