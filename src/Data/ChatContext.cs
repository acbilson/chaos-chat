using Microsoft.EntityFrameworkCore;
namespace src.Data;

public class ChatContext : DbContext
{
  public DbSet<ChatUser> ChatUsers { get; set; }
  public DbSet<ChatRecord> ChatRecords { get; set; }

  public string DbPath { get; }

  public ChatContext()
  {
    var folder = Environment.SpecialFolder.LocalApplicationData;
    var path = Environment.GetFolderPath(folder);
    DbPath = System.IO.Path.Join(path, "chat.db");
  }

  protected override void OnConfiguring(DbContextOptionsBuilder options)
  {
    options.UseSqlite($"Data Source={DbPath}");
    options.LogTo(Console.WriteLine, LogLevel.Information);
  }
}
