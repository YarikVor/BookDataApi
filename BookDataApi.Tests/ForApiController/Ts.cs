using AutoMapper;
using BookDataApi.Context;
using BookDataApi.Controllers;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System.Diagnostics.CodeAnalysis;

namespace BookDataApi.Tests.ForApiController;

/// <summary>
/// Ts -> TestStatic which has static values and initializes them
/// </summary>

public static class Ts
{
  [NotNull]
  public static IMapper? Mapper { get; private set; }
  public static BookContext? Db { get; private set; }
  public static IConfiguration? Configuration { get; private set; }

  public static ApiController? Controller { get; private set; }

  const string CONNECTION_STRING = "Server=localhost;Database=booksdb;Uid=root;Pwd=;";
  const string MYSQL_VERSION = "5.2.0";

  public const string SECRET = "yarikvor";

  static Ts()
  {
    Init();
  }

  public static void Init()
  {
    InitDb();
    InitConfig();
    InitMapper();
    InitController();
  }

  private static void InitController()
  {
    Controller = new ApiController(Db, Mapper, Configuration);
  }

  private static void InitDb()
  {
    var builder = new DbContextOptionsBuilder<BookContext>();
    builder.UseMySql(CONNECTION_STRING, new MySqlServerVersion(MYSQL_VERSION));

    Db = new BookContext(builder.Options);
  }

  private static void InitConfig()
  {
    Configuration = new ConfigurationManager();
    Configuration["Secret"] = SECRET;
  }

  public static void InitMapper()
  {
    var config = new MapperConfiguration(
      cfg =>
      {
        cfg.AddProfile<MappingModelProfile>();
        cfg.AddProfile(new MappingProfile(Db));
      }
    );

    Mapper = new Mapper(config);

  }
}