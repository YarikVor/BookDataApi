using System.ComponentModel.DataAnnotations;

namespace BookDataApi
{
  public class ReviewCreatingModel
  {
    [MaxLength(512)]
    [Required]
    public string? message { get; set; }
    [MaxLength(64)]
    [Required]
    public string? reviewer { get; set; }
  }
}
