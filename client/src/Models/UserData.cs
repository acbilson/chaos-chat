using System;
using System.ComponentModel.DataAnnotations;

public class UserData {

    [Required]
    public string? Username { get; set; }

    [Required]
    public string? Password { get; set; }
}