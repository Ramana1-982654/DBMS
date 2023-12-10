using System;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
    
namespace Autozone
{
    public partial class Interface : Form
    {
        private MySqlConnection connection = new MySqlConnection("datasource=localhost;port=3306;username=root;password=''");
        private int[] radioButtonValues;
        private int orderid;
        private int total;

        public Interface()
        {
            InitializeComponent();
            InitializeRadioButtonValues();
            total = 0;
        }

        private void InitializeRadioButtonValues()
        {
            radioButtonValues = new int[]
            {
                5700, 5100, 4700, 13000, 19000, 999, 999, 3000, 3500, 2400, 400, 6800, 10500, 14000, 18000, 1399, 1200, 2400, 200, 700, 3000, 4300, 4000, 2300, 1800, 1000, 300, 100, 50, 50, 20
            };
        }

        private void button1_Click(object sender, EventArgs e)
        {
            connection.Open();

            // Calculate total
            total = CalculateTotal();

            // Insert data into the database
            string insertQuery = "INSERT INTO autozone.client(total, date) VALUES (@total, NOW())";
            MySqlCommand insertCmd = new MySqlCommand(insertQuery, connection);
            insertCmd.Parameters.AddWithValue("@total", total);
            insertCmd.ExecuteNonQuery();

            // Retrieve the orderid
            string getLastInsertedIdQuery = "SELECT LAST_INSERT_ID();";
            MySqlCommand getLastInsertedIdCmd = new MySqlCommand(getLastInsertedIdQuery, connection);
            orderid = Convert.ToInt32(getLastInsertedIdCmd.ExecuteScalar());

            if (orderid != 0)
            {
                MessageBox.Show($"Date: {DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")}\nOrderID: {orderid}\nTotal: {total}\n");
                this.Close();
            }
            else
            {
                MessageBox.Show("Data Not Saved");
            }

            connection.Close();
        }
        private int CalculateTotal()
        {
            int calculatedTotal = 0;

            void FindRadioButtons(Control parentControl)
            {
                foreach (Control control in parentControl.Controls)
                {
                    if (control is RadioButton radioButton)
                    {
                        Console.WriteLine($"RadioButton Name: {radioButton.Name}, Checked: {radioButton.Checked}");

                        if (radioButton.Checked)
                        {
                            int index;
                            if (int.TryParse(radioButton.Name.Replace("radioButton", ""), out index))
                            {
                                index--;
                                calculatedTotal += radioButtonValues[index];
                            }
                        }
                    }

                    //Search if radio buttons are checked
                    if (control.HasChildren)
                    {
                        FindRadioButtons(control);
                    }
                }
            }

            //Print the Total
            FindRadioButtons(this);

            Console.WriteLine($"Calculated Total: {calculatedTotal}");
            return calculatedTotal;
        }

    }
}

