using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Management_CD.Models;

namespace Management_CD
{
    public partial class Home : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["USER_ID"] != null)
                {
                    lb_User.Text = Session["USER_ID"].ToString();
                    getCD();
                    lblDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
                    lbVisitor.Text = Application["Visitor"].ToString();
                }
                else
                {
                    Response.Redirect("~/index.aspx");
                }
                
            }

        }

        private void getCD()
        {
            dlCD.DataSource = cdDAO.getData();
            dlCD.DataBind();
        }


        protected void dlCD_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName.Equals("Details"))
            {
                Response.Redirect("~/Details.aspx?ID=" + e.CommandArgument);
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            dlCD.DataSource = cdDAO.searchCD(tbSearch.Text);
            dlCD.DataBind();
        }
    }
}