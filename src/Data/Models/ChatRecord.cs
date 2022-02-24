namespace src.Data;

public class ChatRecord
{
    public int ChatRecordId { get; set; }
    public string Content { get; set; }
    public DateTime CreatedOn { get; set; }
    public int ChatUserId { get; set; }
    public virtual ChatUser ChatUser { get; set; }
}

public class ChatUser
{
    public int ChatUserId { get; set; }
    public string Name { get; set; }
    public virtual List<ChatRecord> ChatRecords { get; set; }
}
