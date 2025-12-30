using System;

namespace LibrarySystem_72886
{
    class Program
    {
        static void Main(string[] args)
        {
            // Konfiguracja
            DatabaseService ds = new DatabaseService(@"LENOVOAVG\SQLEXPRESS", "library_72886");

            Console.Title = "System Biblioteczny 72886";

            if (!ds.TestConnection())
            {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine("BŁĄD POŁĄCZENIA Z BAZĄ!");
                Console.ReadKey();
                return;
            }

            while (true)
            {
                Console.Clear();
                Console.WriteLine("=== BIBLIOTEKA 72886 - MENU ===");
                Console.WriteLine("1. Lista książek");
                Console.WriteLine("2. Dodaj książkę");
                Console.WriteLine("3. Usuń książkę");
                Console.WriteLine("0. Wyjście");
                Console.Write("\nWybór: ");

                string choice = Console.ReadLine();
                if (choice == "0") break;

                switch (choice)
                {
                    case "1":
                        ds.ShowBooks();
                        break;
                    case "2":
                        try
                        {
                            Console.Write("Tytuł: "); string t = Console.ReadLine();
                            Console.Write("ID Autora: "); int a = int.Parse(Console.ReadLine());
                            Console.Write("Rok: "); int y = int.Parse(Console.ReadLine());
                            ds.AddBook(t, a, y);
                            Console.WriteLine("Dodano!");
                        }
                        catch { Console.WriteLine("Błąd danych!"); }
                        System.Threading.Thread.Sleep(1500);
                        break;
                    case "3":
                        try
                        {
                            Console.Write("ID do usunięcia: ");
                            int id = int.Parse(Console.ReadLine());
                            if (ds.DeleteBook(id)) Console.WriteLine("Usunięto.");
                            else Console.WriteLine("Nie znaleziono ID.");
                        }
                        catch { Console.WriteLine("Błąd!"); }
                        System.Threading.Thread.Sleep(1500);
                        break;
                }
            }
        }
    }
}