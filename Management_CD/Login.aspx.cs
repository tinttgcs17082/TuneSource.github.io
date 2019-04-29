using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

using Management_CD.Models;

namespace Management_CD
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtUser.Text))
            {
                lbUser.Text = "Username is required...";
                txtUser.Focus();
                return;
            }
            else if (string.IsNullOrEmpty(txtPass.Text))
            {
                lbPass.Text = "Password is required...";
                txtUser.Focus();
                return;
            }
            else
            {
                //Check User and Password
                var conn = new SqlConnection("server=DESKTOP-66CSFNK; database=TuneSource; uid=sa; pwd=123456");
                var sqlda1 = new SqlDataAdapter("select * from Account Where Username = '" + txtUser.Text + "' and Password = '" + txtPass.Text + "'", conn);
                var dt1 = new DataTable();
                sqlda1.Fill(dt1);

                //Check Role
                var sqlda2 = new SqlDataAdapter("select * from Account Where Username = '" + txtUser.Text + "' and Role = 'true'", conn);
                var dt2 = new DataTable();
                sqlda2.Fill(dt2);
                if (dt1.Rows.Count > 0)
                {
                    
                    if (dt2.Rows.Count > 0)//Log in as an administrators
                    {
                        Session["ADMIN_ID"] = txtUser.Text;
                        Response.Redirect("~/admin/CD_Management.aspx");
                       
                    }
                    else//Log in as an member
                    {
                        Session["USER_ID"] = txtUser.Text;
                        Response.Redirect("~/Home.aspx");
                    }
                }
                else
                {
                    lbMess.Text = "Username or Password does not exist!";
                }
            }
            

        }
    }
}