using BookDataApi.Controllers;
using BookDataApi.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BookDataApi.Tests.ForApiController;

[TestClass]
public class SaveMethod
{
  static readonly ApiController controller = Ts.Controller;
  [TestMethod]
  public void InvalidValue_ReturnedBadRequest()
  {
    var bookModel = new BookCreatingModel()
    {
      id = 0,
      author = "",
      content = "",
      cover = "e",
      genre = "",
      title = ""
    };

    var actual = controller.Save(bookModel).Result;
    Assert.IsNotNull(actual);
    Assert.IsInstanceOfType(actual, typeof(BadRequestResult));
  }

  [TestMethod]
  public void ValidValue_AddedElementAndJsonResult()
  {
    var bookModel = new BookCreatingModel()
    {
      id = 0,
      author = "2w",
      content = "2w",
      cover = "e2==",
      genre = "w2",
      title = "2w"
    };

    var actual = controller.Save(bookModel).Result;
    Assert.IsNotNull(actual);
    Assert.IsInstanceOfType(actual, typeof(JsonResult));

    var result = (JsonResult)actual;

    var book = Ts.Db.Book.OrderBy(e => e.Id).Last();
    int id = (int)result.Value.GetType().GetProperty("id").GetValue(result.Value);
    Assert.AreEqual(book.Id, id);
  }

  [TestMethod]
  public void ValidValue_UpdatedElementAndJsonResult()
  {
    Book book = Ts.Db.Book.AsNoTracking().OrderByDescending(e => e.Id).First();

    var bookCreateModel = new BookCreatingModel()
    {
      id = book.Id,
      author = book.Author,
      content = book.Content,
      cover = "",
      genre = book.Genre,
      title = Guid.NewGuid().ToString()
    };

    var actual = controller.Save(bookCreateModel).Result;
    Assert.IsInstanceOfType(actual, typeof(JsonResult));

    var result = (JsonResult)actual;

    int id = (int)result.Value.GetType().GetProperty("id").GetValue(result.Value);
    Assert.AreEqual(bookCreateModel.id, id);
    Book newBook = Ts.Db.Book.OrderBy(e => e.Id).Last();
    Assert.AreEqual(bookCreateModel.title, newBook.Title);
  }



}