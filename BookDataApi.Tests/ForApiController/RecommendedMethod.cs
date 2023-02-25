using BookDataApi.Controllers;
using BookDataApi.JsonModel;
using Microsoft.AspNetCore.Mvc;

namespace BookDataApi.Tests.ForApiController;

[TestClass]
public class RecommendedMethod
{
  static readonly ApiController controller = Ts.Controller;

  [TestMethod]
  public void ReturnedJsonResult()
  {
    var actual = controller.Recommended("").Result;
    Assert.IsNotNull(actual);
    Assert.IsInstanceOfType(actual, typeof(JsonResult));
  }

  [TestMethod]
  public void ReturnedBooksWithRating()
  {
    var actual = ((JsonResult)controller.Recommended("Fiction").Result).Value;
    Assert.IsNotNull(actual);
    Assert.IsTrue(actual is IEnumerable<BookWithRating>);
  }


  [TestMethod]
  public void Returned_ThatMore10Reviews()
  {
    var actual = (IEnumerable<BookWithRating>)((JsonResult)controller.Recommended("Fiction").Result).Value;

    Assert.IsTrue(actual.All(e => e.reviewsNumber >= 10));
  }

  [TestMethod]
  public void ReturnedSameGenre()
  {
    var actual = (IEnumerable<BookWithRating>)((JsonResult)controller.Recommended("Fiction").Result).Value;

    Assert.IsTrue(actual.All(e => Ts.Db.Book.First(f => f.Id == e.id).Genre == "Fiction"));
  }




}