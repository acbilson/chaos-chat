namespace src.Data;

public class ChatUserService
{
    public List<ChatUser> GetChatUsers()
    {
      using (var db = new ChatContext())
      {
	Console.WriteLine($"Database path: {db.DbPath}");

	return db.ChatUsers.ToList();
      }
    }

    public void AddChatUser(ChatUser record)
    {
      using (var db = new ChatContext())
      {
	db.ChatUsers.Add(record);
	db.SaveChanges();
      }
    }

}
