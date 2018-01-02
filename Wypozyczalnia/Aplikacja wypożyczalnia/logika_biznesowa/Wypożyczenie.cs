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
		public string Data_wypożyczenia;
		/// <summary>
		/// data planowanego zwrotu samochodu
		/// </summary>
		public string Data_planowanego_zwrotu;
		/// <summary>
		/// cena za wypożyczenie samochodu
		/// </summary>
		public float Cena_za_wypozyczenie;

		/// <summary>
		/// metoda dodająca wypożyczenie do bazy
		/// </summary>
		public void DodajWypozyczenie() {
			throw new System.Exception("Not implemented");
		}
		/// <summary>
		/// metoda usuwająca wypożyczenie z bazy
		/// </summary>
		public void UsunWypozyczenie() {
			throw new System.Exception("Not implemented");
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

	}

}
