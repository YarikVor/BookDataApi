namespace BookDataApi.JsonModel
{
  public class BookWithRating
  {
    public int id { get; set; }
    public string? title { get; set; }
    public string? author { get; set; }
    public decimal rating { get; set; }
    public int reviewsNumber { get; set; }
  }
}
