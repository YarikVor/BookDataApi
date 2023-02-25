using AutoMapper;
using BookDataApi;
using BookDataApi.Context;
using BookDataApi.Controllers;
using Microsoft.EntityFrameworkCore;


internal class Program
{
  private static void Main(string[] args)
  {
    var builder = WebApplication.CreateBuilder(args);
    builder.Logging.ClearProviders();
    builder.Logging.AddConsole();

    ConfigService(builder.Services);
    builder.Services.AddDbContext<BookContext>(c => ConfigDb(c, builder.Configuration));

    var app = builder.Build();
    if (app.Environment.IsDevelopment())
    {
      ConfigAppIfDev(app);
    }
    ConfigApp(app);

    ConfigLog(app);

    app.Run();

  }

  static void ConfigDb(DbContextOptionsBuilder dbContextOptions, ConfigurationManager config)
  {
    string connectionString =
      config.GetConnectionString("MySql") ??
      throw new ArgumentNullException();

    string mySqlVersion =
      config.GetConnectionString("MySqlVersion") ??
      throw new ArgumentNullException();


  }

  static void ConfigService(IServiceCollection services)
  {

    services.AddControllers();

    services.AddEndpointsApiExplorer();

    services.AddSwaggerGen();

    services.AddHttpClient();

    services.AddScoped<Profile, MappingProfile>();
    services.AddScoped<IMapper, Mapper>(
      e => new Mapper(
        new MapperConfiguration(
          k =>
          {
            k.AddProfile(e.GetRequiredService<Profile>());
            k.AddProfile<MappingModelProfile>();
          }
        )
      )
    );



  }

  static void ConfigApp(WebApplication app)
  {
    app.UseHttpsRedirection();

    app.UseAuthorization();

    app.MapControllers();
  }

  static void ConfigAppIfDev(WebApplication app)
  {
    app.UseSwagger();
    app.UseSwaggerUI();
  }

  public static void ConfigLog(IApplicationBuilder app)
  {
    var logger = app.ApplicationServices.GetRequiredService<ILogger<ApiController>>();

    app.Use(async (context, next) =>
    {
      Stream stream = new MemoryStream();
      await context.Request.Body.CopyToAsync(stream);
      stream.Seek(0, SeekOrigin.Begin);
      var reader = new StreamReader(stream);

      logger.LogInformation(
        $"\nPath request: {context.Request.Path}\n" +
        $"Http method: {context.Request.Method}\n" +
        string.Format("Header:\n{0}\n",
          string.Join("\n\t", context.Request.Headers.Select(e => $"{e.Key}: {e.Value}"))) +
        $"Query params: {context.Request.QueryString.Value}\n" +
        $"Body: \n" + reader.ReadToEnd()
        );

      stream.Seek(0, SeekOrigin.Begin);
      context.Request.Body = stream;

      await next.Invoke();
    });
  }
}