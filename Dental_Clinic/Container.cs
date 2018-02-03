using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Dental_Clinic
{
    public partial class Container : Form
    {
        public Container()
        {
            InitializeComponent();
        }

        private void Container_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }

      

      


       
        private void Container_Load(object sender, EventArgs e)
        {
           
        }

        private void button2_Click(object sender, EventArgs e)
        {

            PatientList patienList = new PatientList();
            patienList.MdiParent = this;
            patienList.StartPosition = FormStartPosition.Manual;
            patienList.Location = new Point(150, 0);
            patienList.Show();
        }

        private void btnAppointment_Click(object sender, EventArgs e)
        {

            Consultation consultationForm = new Consultation();
            consultationForm.MdiParent = this;
            consultationForm.StartPosition = FormStartPosition.Manual;
            consultationForm.Location = new Point(150, 0);
            consultationForm.Show();
        }

        private void btnSummary_Click(object sender, EventArgs e)
        {

        }

       

      
        
        
       

     

     
    }
}
