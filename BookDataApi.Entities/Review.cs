namespace BookDataApi.Entities;

public class Review
{
  public int Id { get; set; }
  public string Message { get; set; }
  public Book BookId { get; set; }
  public string Reviewer { get; set; }
}
