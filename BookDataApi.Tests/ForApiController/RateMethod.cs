using BookDataApi.Controllers;
using Microsoft.AspNetCore.Mvc;

namespace BookDataApi.Tests.ForApiController;

[TestClass]
public class RateMethod
{
  static readonly ApiController controller = Ts.Controller;

  [TestMethod]
  public void InvalidId_ReturnedBadRequest()
  {
    int id = 0;

    var actual = controller.Rate(id).Result;
    Assert.IsNotNull(actual);
    Assert.IsInstanceOfType(actual, typeof(BadRequestResult));
  }

  [TestMethod]
  public void ValidId_ReturnedJsonResult()
  {
    int id = 2;

    var actual = controller.Rate(id).Result;
    Assert.IsNotNull(actual);
    Assert.IsInstanceOfType(actual, typeof(JsonResult));
  }

  [TestMethod]
  public void ValidId_ReturnedReviewId()
  {
    int id = 2;

    var actual = controller.Rate(id).Result;
    var result = (JsonResult)actual;

    double score = (double)result.Value.GetType().GetProperty("score").GetValue(result.Value);
    Assert.IsTrue(score is 0d or >= 1d and <= 5d);

  }



}