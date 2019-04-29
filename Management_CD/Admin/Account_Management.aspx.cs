using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Management_CD.Models;

namespace Management_CD.Admin
{
    public partial class Account_Management : System.Web.UI.Page
    {
        Models.accountDAO dao = new Models.accountDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if(Session["ADMIN_ID"] != null)
                {
                    getAccount();
                }
                else if(Session["USER_ID"] != null)
                {
                    Response.Redirect("~/home.aspx");
                }
                else
                {
                    Response.Redirect("~/login.aspx");
                }
                
            }
        }

        private void getAccount()
        {
            GVlistAccount.DataSource = dao.getData();
            GVlistAccount.DataBind();
        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtUser.Text))
            {
                lbMess.Text = "Username is required...";
                txtUser.Focus();
                return;
            }
            else if (string.IsNullOrEmpty(txtPassword.Text))
            {
                lbMess.Text = "Password is required...";
                txtUser.Focus();
                return;
            }
            else if (dao.checkName(txtUser.Text))
            {
                Response.Write("<script> alert ('Account is existed...')</script>");
            }
            else
            {
                dao.addAccount(txtUser.Text, txtPassword.Text);
                Response.Write("<script> alert('Add user success!') </script>");
                getAccount();
                Response.Redirect("~/Admin/Account_Management.aspx");
            }
        }

        protected void GVlistAccount_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GVlistAccount.EditIndex = e.NewEditIndex;
            getAccount();
        }


        protected void GVlistAccount_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string id = GVlistAccount.DataKeys[e.RowIndex].Value.ToString();
            GridViewRow row = (GridViewRow)GVlistAccount.Rows[e.RowIndex];
            Label lblId = (Label)row.FindControl("lb_Id");
            Label User = GVlistAccount.Rows[e.RowIndex].FindControl("lb_Username") as Label;
            TextBox Pass = GVlistAccount.Rows[e.RowIndex].FindControl("txt_Password") as TextBox;
            DropDownList Role = GVlistAccount.Rows[e.RowIndex].FindControl("ddl_Role") as DropDownList;
            SqlConnection conn = new SqlConnection("server=DESKTOP-66CSFNK; database=TuneSource; uid=sa; pwd=123456");
            conn.Open();
            var sql = "Update Account set Username='"+User.Text+"', Password='" + Pass.Text + "', Role='" + Role.Text + "' where Id= '" + id +"'";
            var sqlda = new SqlDataAdapter(sql, conn);
            var ds = new DataSet();
            sqlda.Fill(ds, "Account");
            conn.Close();
            GVlistAccount.EditIndex = -1;
            getAccount();
            Response.Redirect("~/Admin/Account_Management.aspx");

        }

        public string checkRole(object obj)
        {
            bool b = bool.Parse(obj.ToString());
            if (b)
            {
                return "Administrators";
            }
            else
                return "Member";
        }

        protected void GVlistAccount_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GVlistAccount.EditIndex = -1;
            getAccount();
        }

        protected void GVlistAccount_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string row = GVlistAccount.Rows[e.RowIndex].Cells[1].Text;
            if (dao.delAccount(row))
            {
                Response.Write("<script>alert('Delete user success!')</script>");
                GVlistAccount.EditIndex = -1;
                getAccount();

            }

        }
    }
}