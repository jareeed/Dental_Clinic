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
    public partial class Consultation : Form
    {
        DataTable dataTable, dtDoctors;
        int currRec = 0, totalRec = 0, close = 0;
        static string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source= diagnostic.accdb";
        string dateMax = DateTime.Now.ToString();

        OleDbConnection conn = new OleDbConnection(connectionString);

        public Consultation()
        {
            InitializeComponent();
        }

        private void Consultation_Load(object sender, EventArgs e)
        {
            getPatient();
            getDoctor();
            lblDateNow.Text = dateMax;
        }

        private void getPatient()
        {
            DataSet ds = new DataSet(); 
            string commandString = "SELECT fname,lname,mid_initial from patients order by ID ASC";
            OleDbDataAdapter dataAdapter = new OleDbDataAdapter(commandString, conn);
            dataAdapter.Fill(ds, "prog");
            dataTable = ds.Tables["prog"];
            totalRec = dataTable.Rows.Count;
       
        }

        private void getDoctor()
        {
            string strSql = "SELECT * FROM doctors";
            OleDbDataAdapter adapter = new OleDbDataAdapter(new OleDbCommand(strSql, conn));
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            cboDoctors.DataSource = ds.Tables[0];
            cboDoctors.DisplayMember = "fullname";
            cboDoctors.ValueMember = "id";
        }

        private void getServices()
        {
            string strSql = "SELECT * FROM services";
            OleDbDataAdapter adapter = new OleDbDataAdapter(new OleDbCommand(strSql, conn));
            DataSet dsServ = new DataSet();
            adapter.Fill(dsServ);
           // clbServices.DataSource = dsServ.Tables[2];
            //clbServices.DisplayMember = "fullname";
            //clbServices.ValueMember = "id";
        }
   
    }
}
