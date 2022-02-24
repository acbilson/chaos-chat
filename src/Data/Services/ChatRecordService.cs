namespace src.Data;

public class ChatRecordService
{
    public List<ChatRecord> GetChatRecords()
    {
      using (var db = new ChatContext())
      {
	Console.WriteLine($"Database path: {db.DbPath}");

	return db.ChatRecords.ToList();
      }
    }

    public void AddChatRecord(ChatRecord record)
    {
      using (var db = new ChatContext())
      {
	Console.WriteLine($"content: {record.Content}, date: {record.CreatedOn}, userId:{record.CreatedBy.Id}, userName:{record.CreatedBy.Name}");
	db.ChatRecords.Add(record);
	db.SaveChanges();
      }
    }

}
