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

        private void button1_Click(object sender, EventArgs e)
        {

            if (menuPanel.Height == 481 && menuPanel.Width == 150)
            {

                menuPanel.Height = 481;
                menuPanel.Width = 46;
                clientPanel.Visible = false;
                button5.Visible = true;
            }
            else
            {
                menuPanel.Height = 481;
                menuPanel.Width = 150;
            }
        }

        private void button2_MouseHover(object sender, EventArgs e)
        {
            if (menuPanel.Height == 481 && menuPanel.Width == 46)
            {

                menuPanel.Height = 481;
                menuPanel.Width = 150;
                button5.Visible = false;
            }

           
        }

        private void button3_MouseHover(object sender, EventArgs e)
        {
            if (menuPanel.Height == 481 && menuPanel.Width == 46)
            {

                menuPanel.Height = 481;
                menuPanel.Width = 150;
                button5.Visible = false;
            }
        }

        private void button4_MouseHover(object sender, EventArgs e)
        {
            if (menuPanel.Height == 481 && menuPanel.Width == 46)
            {

                menuPanel.Height = 481;
                menuPanel.Width = 150;
                button5.Visible = false;
            }
        }

        private void button2_MouseLeave(object sender, EventArgs e)
        {
           
        }

        private void button2_Click(object sender, EventArgs e)
        {

            if (menuPanel.Height == 481 && menuPanel.Width == 150)
            {
                clientPanel.Visible = true;
                
            }

           

        }

        private void addClient_Click(object sender, EventArgs e)
        {
            try
            {
                ActiveMdiChild.Close();

                NewClient newClient = new NewClient();
                clientPanel.Visible = false;
                newClient.MdiParent = this;
                newClient.Show();
            }
            catch
            {
                NewClient newClient = new NewClient();
                clientPanel.Visible = false;
                newClient.MdiParent = this;
                newClient.Show();
            }
        }

        private void Container_Load(object sender, EventArgs e)
        {
           
        }

        private void selectClient_Click(object sender, EventArgs e)
        {
            try
            {
                ActiveMdiChild.Close();

                SelectClient selectClient = new SelectClient();
                clientPanel.Visible = false;
                selectClient.MdiParent = this;
                selectClient.Show();
            }
            catch
            {
                SelectClient selectClient = new SelectClient();
                clientPanel.Visible = false;
                selectClient.MdiParent = this;
                selectClient.Show();
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            if (menuPanel.Height == 481 && menuPanel.Width == 46)
            {

                menuPanel.Height = 481;
                menuPanel.Width = 150;

                button5.Visible = false;
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            try
            {
                ActiveMdiChild.Close();

                Appointment appointment = new Appointment();
                clientPanel.Visible = false;
                appointment.MdiParent = this;
                appointment.Show();
            }
            catch
            {
                Appointment appointment = new Appointment();
                clientPanel.Visible = false;
                appointment.MdiParent = this;
                appointment.Show();
            }

        }

        private void button4_Click(object sender, EventArgs e)
        {
             try
            {
                ActiveMdiChild.Close();

                Services services = new Services();
                clientPanel.Visible = false;
                services.MdiParent = this;
                services.Show();
            }
            catch{


                Services services = new Services();
                clientPanel.Visible = false;
                services.MdiParent = this;
                services.Show();
            }
        }

      

     

     
    }
}
