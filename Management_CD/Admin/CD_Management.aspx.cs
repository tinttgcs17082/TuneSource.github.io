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
    public partial class CD_Management : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["ADMIN_ID"] != null)
                {
                    getCDs();
                }
                else if (Session["USER_ID"] != null)
                {
                    Response.Redirect("~/home.aspx");
                }
                else
                {
                    Response.Redirect("~/login.aspx");
                }

            }
        }
        
        private void getCDs()
        {
            GVlistCDs.DataSource = cdDAO.getData();
            GVlistCDs.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtTitle.Text))
            {
                lbMess.Text = "Title is required...";
                txtTitle.Focus();
                return;
            }
            else if (string.IsNullOrEmpty(txtSinger.Text))
            {
                lbMess.Text = "Singer is required...";
                txtTitle.Focus();
                return;
            }
            else if (string.IsNullOrEmpty(TxtPrice.Text))
            {
                lbMess.Text = "Price is required...";
                txtTitle.Focus();
                return;
            }
            else if (string.IsNullOrEmpty(FUCDs.FileName))
            {
                lbMess.Text = "Music is required...";
                txtTitle.Focus();
                return;
            }
            else if (string.IsNullOrEmpty(FUImg.FileName))
            {
                lbMess.Text = "Picture is required...";
                txtTitle.Focus();
                return;
            }
            else
            {
                cdDAO.addCD(txtTitle.Text, txtSinger.Text, float.Parse(TxtPrice.Text), "Musics/" + FUCDs.FileName, "Img/" + FUImg.FileName);
                Response.Write("<script> alert('Add CD success!') </script>");
                SaveCD();
                clearControls();
                getCDs();
                Response.Redirect("~/Admin/CD_Management.aspx");
            }
        }

        protected void GVListofCD_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (cdDAO.delCD(GVlistCDs.Rows[e.RowIndex].Cells[1].Text))
            {
                Response.Write("<script>alert('Delete CD success!')</script>");
                GVlistCDs.EditIndex = -1;
                getCDs();
            }
        }

        void SaveCD()//Save the CD to the Musics folder
        {
            string sfile1 = FUCDs.FileName;
            FUCDs.SaveAs(MapPath("~/Musics/" + sfile1));
            string sfile2 = FUImg.FileName;
            FUImg.SaveAs(MapPath("~/Img/" + sfile2));
        }

        private void clearControls()
        {
            txtTitle.Text = "";
            txtSinger.Text = "";
            TxtPrice.Text = "";
        }

        protected void GVlistCDs_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GVlistCDs.EditIndex = e.NewEditIndex;
            getCDs();
        }

        protected void GVlistCDs_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string id = GVlistCDs.DataKeys[e.RowIndex].Value.ToString();
            GridViewRow row = (GridViewRow)GVlistCDs.Rows[e.RowIndex];
            TextBox Title = GVlistCDs.Rows[e.RowIndex].FindControl("txt_Title") as TextBox;
            TextBox Singer = GVlistCDs.Rows[e.RowIndex].FindControl("txt_Singer") as TextBox;
            TextBox Price = GVlistCDs.Rows[e.RowIndex].FindControl("txt_Price") as TextBox;
            FileUpload Music = GVlistCDs.Rows[e.RowIndex].FindControl("FU_Music") as FileUpload;
            FileUpload Picture = GVlistCDs.Rows[e.RowIndex].FindControl("FU_Picture") as FileUpload;
            SqlConnection conn = new SqlConnection("server=DESKTOP-66CSFNK; database=TuneSource; uid=sa; pwd=123456");
            conn.Open();
            var sql = "Update tbCD set Title='" + Title.Text + "', Singer='" + Singer.Text + "', Price='" + Price.Text + "', Music='"  + "Musics/" + Music.FileName + "' , Picture='" + "Img/" + Picture.FileName + "' where Id='" + id+"'";
            var sqlda = new SqlDataAdapter(sql, conn);
            var ds = new DataSet();
            sqlda.Fill(ds, "tbCD");
            if(Music.FileName !="" && Picture.FileName != "")
            {
                string sfile1 = Music.FileName;
                Music.SaveAs(MapPath("~/Musics/" + sfile1));
                string sfile2 = Picture.FileName;
                Picture.SaveAs(MapPath("~/Img/" + sfile2));
            }
            conn.Close();
            GVlistCDs.EditIndex = -1;
            getCDs();
            Response.Redirect("~/Admin/CD_Management.aspx");
        }

        protected void GVlistCDs_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GVlistCDs.EditIndex = -1;
            getCDs();
        }
    }
}