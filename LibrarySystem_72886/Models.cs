using System;

namespace LibrarySystem_72886
{
    public abstract class LibraryItem
    {
        public int Id { get; set; }
        public string Title { get; set; }
    }

    public class Book : LibraryItem
    {
        public int AuthorId { get; set; }
        public int YearOfPub { get; set; }
    }

    public class EBook : Book
    {
        public string FileFormat { get; set; }
    }

    public class AudioBook : Book
    {
        public int DurationMinutes { get; set; }
    }

    public class Magazine : LibraryItem
    {
        public int IssueNumber { get; set; }
    }

    public class Author { public int Id { get; set; } public string LastName { get; set; } }
    public class Client { public int Id { get; set; } public string LastName { get; set; } }
}