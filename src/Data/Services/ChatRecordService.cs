using Microsoft.EntityFrameworkCore;
namespace src.Data;

public class ChatRecordService
{
    public List<ChatRecord> GetChatRecords()
    {
      using (var db = new ChatContext())
      {
	return db.ChatRecords.AsNoTracking().ToList();
      }
    }

    public void AddChatRecord(ChatRecord record)
    {
      using (var db = new ChatContext())
      {
	db.ChatRecords.Add(record);
	db.SaveChanges();
      }
    }
}
