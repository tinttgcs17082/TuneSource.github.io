using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Management_CD
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //connect to accountDAO.cs
        Models.accountDAO dao = new Models.accountDAO();

        protected void btnRegistration_Click(object sender, EventArgs e)
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
            else if(dao.checkName(txtUser.Text))//Check User exists in database
            {
                Response.Write("<script> alert ('Account is existed...')</script>");
            }
            else
            {
                dao.addAccount(txtUser.Text, txtPass.Text);
                Response.Write("<script> alert ('Create Account Success...')</script>");
                Response.Redirect("Login.aspx");
            }
        }
    }
}