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
    public partial class PatientList : Form
    {
        DataTable dataTable;
        int currRec = 0;
        int totalRec = 0;
        int close = 0;

        static string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source= diagnostic.accdb";

        OleDbConnection conn = new OleDbConnection(connectionString);

        public PatientList()
        {
            InitializeComponent();
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            try
            {
                NewPatient newPatient = new NewPatient();
                //newPatient.MdiParent = this.ParentForm;
                //newPatient.StartPosition = FormStartPosition.Manual;
                //newPatient.Location = new Point(180, 150);
                //newPatient.Show();
                //this.Close();
                newPatient.ShowDialog();
            }
            catch
            {
                NewPatient newPatient = new NewPatient();
                newPatient.MdiParent = this.ParentForm;
                newPatient.StartPosition = FormStartPosition.Manual;
                newPatient.Location = new Point(180, 150);
                newPatient.Show();
            }
        }

        private void Retrieve()
        {
            DataSet ds = new DataSet();

            string commandString = "SELECT fname,lname,minitial,address,contact,birthday,gender,civilstatus from patient order by ID ASC";

            OleDbDataAdapter dataAdapter = new OleDbDataAdapter(commandString, conn);

            dataAdapter.Fill(ds, "prog");
            dataTable = ds.Tables["prog"];

            currRec = 0;

            totalRec = dataTable.Rows.Count;

            patientData.DataSource = dataTable;

        }

        private void PatientList_Load(object sender, EventArgs e)
        {
            Retrieve();
        }

       
    }
}
