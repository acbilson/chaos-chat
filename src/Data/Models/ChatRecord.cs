namespace src.Data;

public class ChatRecord
{
    public int Id { get; set; }
    public string Content { get; set; }
    public DateTime CreatedOn { get; set; }
    public virtual ChatUser CreatedBy { get; set; }
}

public class ChatUser
{
    public int Id { get; set; }
    public string Name { get; set; }
    public virtual List<ChatRecord> ChatRecords { get; set; }
}
