﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Aplikacja_wypożyczalnia
{
    public partial class Samochody : Form
    {
        public Samochody()
        {
            InitializeComponent();
        }

        private void DodajSamochód_Click(object sender, EventArgs e)
        {
            this.Hide();
            DodajSamochód ds = new DodajSamochód();
            ds.Show();
        }

        private void EdytujSamochód_Click(object sender, EventArgs e)
        {
            this.Hide();
            EdytujSamochód es = new EdytujSamochód();
            es.Show();
        }

        private void UsuńSamochód_Click(object sender, EventArgs e)
        {
            this.Hide();
            UsuńSamochód us = new UsuńSamochód();
            us.Show();
        }

        private void WyszukajSamochód_Click(object sender, EventArgs e)
        {
            this.Hide();
            WyszukajSamochód ws = new WyszukajSamochód();
            ws.Show();
        }

        private void MenuGłówne_Click(object sender, EventArgs e)
        {
            this.Hide();
            Menu_po_zalogowaniu mn = new Menu_po_zalogowaniu();
            mn.Show();
        }
    }
}
