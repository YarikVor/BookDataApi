namespace BookDataApi.JsonModel;

public class ShortReview
{
  public int Id { get; set; }
  public string Message { get; set; }
  public string Reviewer { get; set; }

  public ShortReview(int id, string message, string reviewer)
  {
    Id = id;
    Message = message;
    Reviewer = reviewer;
  }
}
