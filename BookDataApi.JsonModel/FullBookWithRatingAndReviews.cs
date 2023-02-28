namespace BookDataApi.JsonModel
{
  public class FullBookWithRatingAndReviews: BookWithRatingAndReviews
  {
    public decimal rating { get; set; }
    public int reviewsNumber { get; set; }
    public string genre { get; set; }
  }


}
