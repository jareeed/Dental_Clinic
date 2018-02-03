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

        DataTable dataTable;
        int currRec = 0;
        int totalRec = 0;
        int close = 0;

        static string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source= diagnostic.accdb";

        OleDbConnection conn = new OleDbConnection(connectionString);

        public NewPatient()
        {
            InitializeComponent();
        }

        private void NewPatient_Load(object sender, EventArgs e)
        {

        }
    }
}
