using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Autozone
{
    public partial class Login : Form
    {
        // Fixed username and password
        private const string CorrectUsername = "admin";
        private const string CorrectPassword = "admin";
        public Login()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string enteredUsername = textBox1.Text;
            string enteredPassword = textBox2.Text;

            // Check if the entered username and password are correct
            if (enteredUsername == CorrectUsername && enteredPassword == CorrectPassword)
            {
                MessageBox.Show($"Login successful.", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);

                // Open Interface (Form2) after successful login
                Interface interfaceForm = new Interface();
                interfaceForm.Show();

                // Hide the login form
                this.Hide();
            }
            else
            {
                MessageBox.Show("Login failed. Incorrect Username or Password.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }
    }
}
