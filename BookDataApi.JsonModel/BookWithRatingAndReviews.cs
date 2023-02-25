namespace BookDataApi.JsonModel
{
  public class BookWithRatingAndReviews
  {
    public int? id { get; set; }
    public string? title { get; set; }
    public string? author { get; set; }
    public string? cover { get; set; }
    public string? content { get; set; }
    public decimal rating { get; set; }
    public ShortReview[]? reviews { get; set; }

  }


}
