using Microsoft.AspNetCore.Mvc;

namespace BookDataApi.Controllers
{
  [ApiController]
  [Route(nameof(BookController))]
  public class BookController : Controller
  {
    [HttpGet]
    public IActionResult Index()
    {
      return Content("text");
    }
  }
}
