using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.OleDb;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Dental_Clinic
{
    public partial class NewPatient : Form
    {

     

        static string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source= diagnostic.accdb";

        OleDbConnection conn = new OleDbConnection(connectionString);

        public NewPatient()
        {
            InitializeComponent();
        }

        private void NewPatient_Load(object sender, EventArgs e)
        {

        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (txtLname.Text == "" || txtFname.Text == "" || txtMI.Text == "" || txtAddress.Text == ""
               || txtContact.Text == "" || bday.Text == "" || cmbGender.Text == "" || cmbStatus.Text == "")
            {
                MessageBox.Show("Please fill up all fields.");
                return;
            }
            else
            {
                try
                {
                    OleDbDataAdapter addAdapter = new OleDbDataAdapter();
                    string addSql = "INSERT into patient(fname,lname, minitial, address,contact,birthday,gender,civilstatus,created_at,updated_at) values('" + txtFname.Text.ToUpper() + "','" + txtLname.Text.ToUpper() + "','" + txtMI.Text.ToUpper() + "','"
                        + txtAddress.Text.ToUpper() + "','" + txtContact.Text.ToUpper() + "','" + bday.Value + "','" + cmbGender.Text.ToUpper() + "','" + cmbStatus.Text.ToUpper() + "', NOW(), NOW())";


                    conn.Open();
                    addAdapter.InsertCommand = new OleDbCommand(addSql, conn);
                    addAdapter.InsertCommand.ExecuteNonQuery();
                    MessageBox.Show("Added...");
                    conn.Close();

                    PatientList patienList = new PatientList();
                   
                    patienList.StartPosition = FormStartPosition.Manual;
                    patienList.Location = new Point(150, 0);
                    patienList.Show();

                    this.Close();
                }
                catch
                {

                }
               
                

            }
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

      

       
    }
}
