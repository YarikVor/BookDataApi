using System.ComponentModel.DataAnnotations;

namespace BookDataApi;

public class BookCreatingModel
{

  public int id { get; set; }

  [StringLength(128, MinimumLength = 1)]
  [Required]
  public string? title { get; set; }
  [MaxLength(((65536 * 8 / 6 + 1 + 3) >> 2) << 2)]
  [Required]

  public string? cover { get; set; }
  [MaxLength(65536 * 256)]
  [Required]
  public string? content { get; set; }
  [MaxLength(128)]
  [Required]
  public string? genre { get; set; }
  [MaxLength(64)]
  [Required]
  public string? author { get; set; }
}
