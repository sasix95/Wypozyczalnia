using System;
namespace logika_biznesowa {
	public class Wypożyczenie {
		/// <summary>
		/// numer id wypożyczenia
		/// </summary>
		public int ID_wypożyczenia;
		/// <summary>
		/// data wypożyczenia samochodu
		/// </summary>
		public DateTime Data_wypożyczenia;
		/// <summary>
		/// data planowanego zwrotu samochodu
		/// </summary>
		public DateTime Data_planowanego_zwrotu;
		/// <summary>
		/// cena za wypożyczenie samochodu
		/// </summary>
		public double Cena_za_wypozyczenie;


        public Wypożyczenie()
        {
            ID_wypożyczenia = 0;
            Data_wypożyczenia = new DateTime(1, 1, 1);
            Data_planowanego_zwrotu = new DateTime(1, 1, 1);
            Cena_za_wypozyczenie = 0.0;
        }

        /// <summary>
        /// konstruktor Wypozyczenie
        /// </summary>
        public Wypożyczenie(int id, DateTime dw, DateTime dpz, float czp)
        {
            ID_wypożyczenia = id;
            Data_wypożyczenia = dw;
            Data_planowanego_zwrotu = dpz;
            Cena_za_wypozyczenie = czp;
        }

		/// <summary>
		/// metoda dodająca wypożyczenie do bazy
		/// </summary>

        public string DodajWypozyczenie()
        {
            string exmsg = "";
            string zapytanie = @"insert into [dbo].[Wypożyczenie] ([ID_wypożyczenia], [Data_wypożyczenia], [Data_planowanego_zwrotu], [Cena_za_wypozyczenie], [CzyUsuniete])" +
                @"values (" + ID_wypożyczenia + ", " + Data_wypożyczenia + " , " + Data_planowanego_zwrotu + ", " + Cena_za_wypozyczenie + " , 0)";
            FunkcjePomicnicze.WstawDaneSQL(zapytanie, ref exmsg);
            return exmsg;
        }
		
		/// <summary>
		/// metoda usuwająca wypożyczenie z bazy
		/// </summary>
		public static string UsunWypozyczenie(int identyfikator)
        {
            string zapytanieCzyWypozyczenieIstnieje = @"SELECT count(*) FROM [dbo].[Wypożyczenie] WHERE [ID_wypożyczenia] = " + identyfikator;
            string exmsgTest = "";
            string zwrotZapytanieCzyWypozyczenieIstnieje = FunkcjePomicnicze.PobierzDaneSQLPojedyncze(zapytanieCzyWypozyczenieIstnieje, ref exmsgTest);
            if (!string.IsNullOrWhiteSpace(exmsgTest)) // zapytanie testujące, czy w bazie jest wypożyczenie o danym ID zwróciło błąd
                return exmsgTest;
            else // zapytanie nie zwróciło błędu
            {
                int licznik;
                if (int.TryParse(zwrotZapytanieCzyWypozyczenieIstnieje, out licznik) == true) // uzyskaną wartość da się przekonwetować na inta
                {
                    if (licznik == 1) // zapytanie zwróciło znalezienie w bazie wypożyczeń rekordu o podanym ID
                    {
                        string exmsg = "", exmsg1 = "", exmsg2 = "";
                        // usunięcie danych z tabeli Wypożyczenie
                        string zapytanie1 = @"UPDATE [dbo].[Wypożyczenie] SET [CzyUsuniete] = 1 WHERE [ID_wypożyczenia] = " + identyfikator;
                        FunkcjePomicnicze.WstawDaneSQL(zapytanie1, ref exmsg1);
                        // budowa informacji wyjściowej z funkcji
                        if (!string.IsNullOrWhiteSpace(exmsg1))
                            exmsg += "\n" + exmsg1;
                        if (!string.IsNullOrWhiteSpace(exmsg2))
                            exmsg += "\n" + exmsg2;
                        return exmsg;
                    }
                    else
                        return "Nie odnaleziono wypożyczenia o podanym ID";
                }
                else
                    return "Nie odnaleziono wypożyczenia o podanym ID";
            }
		}
		/// <summary>
		/// metoda edytująca wypożyczenie w bazie
		/// </summary>
		public void EdytujWypozyczenie() {
			throw new System.Exception("Not implemented");
		}
		/// <summary>
		/// metoda wyszukująca wypożyczenie w bazie
		/// </summary>
		public void WyszukajWypozyczenie() {
			throw new System.Exception("Not implemented");
		}
		/// <summary>
		/// metoda pokazująca wypożyczenie w bazie
		/// </summary>
		public void PokazWypozyczenie() {
			throw new System.Exception("Not implemented");
		}

		private Rezerwacja rezerwacja;

		private Klient_indywidualny klient_indywidualny;
		private Rozliczenie rozliczenie;


        public static int MaksymalnyNumerIdentyfikatoraWBazie()
        {
            string zapytanie = @"select max([ID_wypożyczenia]) from [dbo].[Wypożyczenie]";
            string exmsg = "";
            string numerZBazy = FunkcjePomicnicze.PobierzDaneSQLPojedyncze(zapytanie, ref exmsg);
            if (!string.IsNullOrWhiteSpace(numerZBazy))
                return int.Parse(numerZBazy);
            else
                return 0;
        }
	}

}
