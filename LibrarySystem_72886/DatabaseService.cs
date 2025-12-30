using System;
using Microsoft.Data.SqlClient;

namespace LibrarySystem_72886
{
    public class DatabaseService
    {
        private string connectionString;

        public DatabaseService(string server, string db)
        {
            connectionString = $"Server={server};Database={db};Trusted_Connection=True;TrustServerCertificate=True;";
        }

        public bool TestConnection()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    return true;
                }
            }
            catch { return false; }
        }

        public void ShowBooks()
        {
            Console.Clear();
            Console.WriteLine("--- AKTUALNY STAN TABELI 'BOOKS' ---");
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT BookID, Title, year_of_pub FROM Books";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (!reader.HasRows) Console.WriteLine("Brak danych.");
                    else
                    {
                        Console.WriteLine("{0,-5} | {1,-30} | {2}", "ID", "TYTUŁ", "ROK");
                        Console.WriteLine(new string('-', 50));
                        while (reader.Read())
                            Console.WriteLine("{0,-5} | {1,-30} | {2}", reader["BookID"], reader["Title"], reader["year_of_pub"]);
                    }
                }
            }
            Console.WriteLine("\nNaciśnij dowolny klawisz...");
            Console.ReadKey();
        }

        public void AddBook(string title, int authorId, int year)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Books (Title, AuthorID, year_of_pub) VALUES (@title, @authorId, @year)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@title", title);
                cmd.Parameters.AddWithValue("@authorId", authorId);
                cmd.Parameters.AddWithValue("@year", year);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public bool DeleteBook(int id)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Books WHERE BookID = @id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", id);
                conn.Open();
                return cmd.ExecuteNonQuery() > 0;
            }
        }
    }
}