using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;

namespace Management_CD
{
    public partial class Details : System.Web.UI.Page
    {



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["USER_ID"] != null)
                {
                    cdDetails();
                }
                else
                {
                    Response.Redirect("~/index.aspx");
                }

            }
        }
        
        private void cdDetails()//Display song information according to the song ID
        {
            var conn = new SqlConnection("server=DESKTOP-66CSFNK; database=TuneSource; uid=sa; pwd=123456");
            var sqlda = new SqlDataAdapter("select * from tbCD where Id = '" + Request.QueryString["Id"] + "'", conn);
            var ds = new DataSet();
            sqlda.Fill(ds, "tbCD");
            dvDetails.DataSource = ds;
            dvDetails.DataBind();
        }


        protected void lbDownload_Command(object sender, CommandEventArgs e)
        {
            string pathfile = e.CommandArgument.ToString();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + pathfile);
            Response.WriteFile(pathfile);
        }

    }
}