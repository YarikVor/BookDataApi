using BookDataApi.Controllers;
using BookDataApi.Entities;
using Microsoft.AspNetCore.Mvc;

namespace BookDataApi.Tests.ForApiController;

[TestClass]
public class DeleteMethod
{
  static readonly ApiController controller = Ts.Controller;

  [DataTestMethod]
  [DataRow(0, "")]
  [DataRow(3, "")]
  [DataRow(3, "eqe23232")]
  public void ReturnedBadRequest(int id, string key)
  {
    var actual = controller.Delete(id, key).Result;
    Assert.IsNotNull(actual);
    Assert.IsInstanceOfType(actual, typeof(BadRequestResult));
  }

  [TestMethod]
  public void ReturnedOk()
  {
    Book book = new()
    {
      Id = 0,
      Title = "ForDelete",
      Author = "ForDelete",
      Content = "ForDelete",
      Cover = Array.Empty<byte>(),
      Genre = "ForDelete"
    };

    Ts.Db.Book.Add(book);
    Ts.Db.SaveChanges();

    var actual = controller.Delete(book.Id, Ts.SECRET).Result;
    Assert.IsInstanceOfType(actual, typeof(OkResult));
  }



}