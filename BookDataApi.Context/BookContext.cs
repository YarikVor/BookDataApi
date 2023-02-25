using BookDataApi.Entities;
using Microsoft.EntityFrameworkCore;



namespace BookDataApi.Context
{
  public class BookContext : DbContext
  {
    public DbSet<Book> Book { get; set; }
    public DbSet<Rating> Rating { get; set; }
    public DbSet<Review> Review { get; set; }

    public BookContext(DbContextOptions options) : base(options)
    {

    }
  }
}
