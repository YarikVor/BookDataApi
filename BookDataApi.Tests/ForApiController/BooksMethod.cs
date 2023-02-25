using BookDataApi.Controllers;
using BookDataApi.JsonModel;
using Microsoft.AspNetCore.Mvc;

namespace BookDataApi.Tests.ForApiController;

[TestClass]
public class BooksManager
{
  static readonly ApiController controller = Ts.Controller;

  [DataTestMethod]
  [DataRow("")]
  [DataRow("fsdfds")]
  [DataRow("title")]
  [DataRow("author")]
  public void ReturnedJson(string order)
  {
    var actual = controller.Books(order).Result;
    Assert.IsNotNull(actual);
    Assert.IsInstanceOfType(actual, typeof(JsonResult));
  }

  [TestMethod]
  public void ReturnedBooksWithRating()
  {
    var actual = ((JsonResult)controller.Books("title").Result).Value;
    Assert.IsNotNull(actual);
    Assert.IsTrue(actual is IEnumerable<BookWithRating>);
  }


}