using System.Reflection.Metadata;

namespace BookDataApi.Entities;

public class Book
{
  public int Id { get; set; }
  public string Title { get; set; }
  public byte[] Cover { get; set; }

  public string Content { get; set; }

  public string Author { get; set; }
  public string Genre { get; set; }

}