using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.OleDb;

namespace Dental_Clinic
{
    public partial class Login : Form
    {
        public static string username;

        //database connection
        DataTable dataTable;
        static string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=diagnostic.accdb";
        OleDbConnection conn = new OleDbConnection(connectionString);

        public Login()
        {
            InitializeComponent();
        }

        private void Login_Load(object sender, EventArgs e)
        {
            txtUserName.Text = "";
            txtPassword.Text = "";
        }

        //confirm login function
        private void loginConfirm()
        {
            DataSet ds = new DataSet();

            string userName = txtUserName.Text;
            string userPassword = txtPassword.Text;

            if (userName == "" || userPassword == "")
                MessageBox.Show("Must fill in required fields!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            else
            {
                string searchString = "SELECT * FROM users WHERE username = '" + userName + "' AND password = '" + userPassword + "'";

                OleDbDataAdapter searchAdapter = new OleDbDataAdapter(searchString, conn);

                searchAdapter.Fill(ds,"dtResult");
                dataTable = ds.Tables["dtResult"];

                int totalRec = dataTable.Rows.Count;

                if (totalRec > 0)
                {
                    username = userName;

                    this.Hide();
                    Container container = new Container();
                    container.ShowDialog();
                }
                else
                    MessageBox.Show("Either username or password is invalid. Please try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void cmdLogIn_Click(object sender, EventArgs e)
        {
            //this.Hide();
            //Container container = new Container();
            //container.Show();

            loginConfirm();
        }    
    }
}
