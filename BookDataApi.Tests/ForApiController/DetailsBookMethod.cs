using BookDataApi.Controllers;
using BookDataApi.JsonModel;
using Microsoft.AspNetCore.Mvc;

namespace BookDataApi.Tests.ForApiController;

[TestClass]
public class DetailsBookMethod
{
  static readonly ApiController controller = Ts.Controller;

  [DataTestMethod]
  [DataRow(0)]
  [DataRow(2)]
  public void ReturnedJsonResult(int id)
  {
    var actual = controller.DetailsBook(id).Result;
    Assert.IsNotNull(actual);
    Assert.IsInstanceOfType(actual, typeof(JsonResult));
  }

  [TestMethod]
  public void ReturnedBookWithRatingAndReviews()
  {
    var actual = ((JsonResult)controller.DetailsBook(2).Result).Value;
    Assert.IsNotNull(actual);
    Assert.IsTrue(actual is BookWithRatingAndReviews);
  }


  [TestMethod]
  public void EmptyValue_ReturnedEmptyObject()
  {
    var actual = ((JsonResult)controller.DetailsBook(0).Result).Value;

    Assert.IsNull(actual.GetType().GetProperty(nameof(BookWithRatingAndReviews.id)));
  }


  [TestMethod]
  public void HasReview()
  {
    var actual = (BookWithRatingAndReviews)((JsonResult)controller.DetailsBook(2).Result).Value;

    Assert.IsTrue(actual.reviews.Length >= 1);
  }

}