using BookDataApi.Entities;
using Microsoft.EntityFrameworkCore;



namespace BookDataApi.Context
{
  public class BookContext : DbContext
  {
    public DbSet<Book> Book { get; set; }
    public DbSet<Rating> Rating { get; set; }
    public DbSet<Review> Review { get; set; }

    public BookContext()
    {
      Database.EnsureCreated();
    }
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
      optionsBuilder.UseMySql("Server=localhost;Database=booksdb;Uid=root;Pwd=;", new MySqlServerVersion("5.2.0"));
    }
  }
}
