using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookDataApi.Entities;

public class Rating
{
  public int Id { get; set; }
  public Book BookId { get; set; }
  public sbyte Score { get; set; }
}
