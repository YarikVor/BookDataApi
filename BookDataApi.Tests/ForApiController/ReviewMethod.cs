using BookDataApi.Controllers;
using Microsoft.AspNetCore.Mvc;

namespace BookDataApi.Tests.ForApiController;

[TestClass]
public class ReviewMethod
{
  static readonly ApiController controller = Ts.Controller;

  [DataTestMethod]
  [DataRow(0, "", "")]
  [DataRow(0, "132", "132")]
  public void InvalidArgs_ReturnedBadRequest(int id, string message, string reviewer)
  {
    var bookModel = new ReviewCreatingModel()
    {
      message = message,
      reviewer = reviewer
    };

    var actual = controller.Review(id, bookModel).Result;
    Assert.IsNotNull(actual);
    Assert.IsInstanceOfType(actual, typeof(BadRequestResult));
  }

  [TestMethod]
  public void ValidArgs_ReturnedJsonResult()
  {
    var bookModel = new ReviewCreatingModel()
    {
      message = "123",
      reviewer = "132"
    };
    int id = 2;

    var actual = controller.Review(id, bookModel).Result;
    Assert.IsNotNull(actual);
    Assert.IsInstanceOfType(actual, typeof(JsonResult));
  }

  [TestMethod]
  public void ValidArgs_ReturnedReviewId()
  {
    var bookModel = new ReviewCreatingModel()
    {
      message = "123",
      reviewer = "132"
    };
    int id = 2;

    var actual = controller.Review(id, bookModel).Result;
    var result = (JsonResult)actual;

    var rewiew = Ts.Db.Review.OrderBy(e => e.Id).Last();
    int reviewId = (int)result.Value.GetType().GetProperty("id").GetValue(result.Value);
    Assert.AreEqual(rewiew.Id, reviewId);
    Assert.AreEqual(rewiew.BookId, id);
  }



}