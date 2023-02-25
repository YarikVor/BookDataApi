namespace BookDataApi.JsonModel
{
  public record class SavedBook(int id, string title, string cover, string content, string genre, string author);

}