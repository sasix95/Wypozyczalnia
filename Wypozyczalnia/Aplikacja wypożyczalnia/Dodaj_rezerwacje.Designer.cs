﻿namespace Aplikacja_wypożyczalnia
{
    partial class Dodaj_rezerwacje
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.dateTimePicker1 = new System.Windows.Forms.DateTimePicker();
            this.dateTimePicker2 = new System.Windows.Forms.DateTimePicker();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.wstecz = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label1.Location = new System.Drawing.Point(290, 119);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(100, 20);
            this.label1.TabIndex = 26;
            this.label1.Text = "ID rezerwacji";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label2.Location = new System.Drawing.Point(146, 160);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(244, 20);
            this.label2.TabIndex = 27;
            this.label2.Text = "Data planowanego wypożyczenia";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F);
            this.label3.Location = new System.Drawing.Point(196, 199);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(194, 20);
            this.label3.TabIndex = 28;
            this.label3.Text = "Data planowanego zwrotu";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(422, 121);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(180, 20);
            this.textBox1.TabIndex = 37;
            // 
            // dateTimePicker1
            // 
            this.dateTimePicker1.Location = new System.Drawing.Point(422, 160);
            this.dateTimePicker1.Name = "dateTimePicker1";
            this.dateTimePicker1.Size = new System.Drawing.Size(200, 20);
            this.dateTimePicker1.TabIndex = 38;
            // 
            // dateTimePicker2
            // 
            this.dateTimePicker2.Location = new System.Drawing.Point(422, 198);
            this.dateTimePicker2.Name = "dateTimePicker2";
            this.dateTimePicker2.Size = new System.Drawing.Size(200, 20);
            this.dateTimePicker2.TabIndex = 39;
            // 
            // button1
            // 
            this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.button1.Location = new System.Drawing.Point(231, 259);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(125, 65);
            this.button1.TabIndex = 40;
            this.button1.Text = "Wybierz klienta";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.button2.Location = new System.Drawing.Point(459, 259);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(125, 65);
            this.button2.TabIndex = 41;
            this.button2.Text = "Wybierz samochód";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // button3
            // 
            this.button3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.button3.Location = new System.Drawing.Point(459, 407);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(125, 65);
            this.button3.TabIndex = 42;
            this.button3.Text = "Zapisz";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // wstecz
            // 
            this.wstecz.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.wstecz.Location = new System.Drawing.Point(231, 407);
            this.wstecz.Name = "wstecz";
            this.wstecz.Size = new System.Drawing.Size(125, 65);
            this.wstecz.TabIndex = 43;
            this.wstecz.Text = "Wstecz";
            this.wstecz.UseVisualStyleBackColor = true;
            this.wstecz.Click += new System.EventHandler(this.wstecz_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 20F, System.Drawing.FontStyle.Bold);
            this.label4.Image = global::Aplikacja_wypożyczalnia.Properties.Resources._26653464_1222776397822724_926715336_o;
            this.label4.Location = new System.Drawing.Point(321, 47);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(240, 31);
            this.label4.TabIndex = 44;
            this.label4.Text = "Dodaj rezerwację";
            // 
            // Dodaj_rezerwacje
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = global::Aplikacja_wypożyczalnia.Properties.Resources._26653464_1222776397822724_926715336_o1;
            this.ClientSize = new System.Drawing.Size(888, 484);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.wstecz);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.dateTimePicker2);
            this.Controls.Add(this.dateTimePicker1);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "Dodaj_rezerwacje";
            this.Text = "Dodaj_rezerwacje";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.DateTimePicker dateTimePicker1;
        private System.Windows.Forms.DateTimePicker dateTimePicker2;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button wstecz;
        private System.Windows.Forms.Label label4;
    }
}