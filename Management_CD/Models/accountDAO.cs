using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

namespace Management_CD.Models
{
    public class accountDAO
    {
        public SqlConnection setConnection()
        {
            var conn = "server=DESKTOP-66CSFNK; database=TuneSource; uid=sa; pwd=123456";
            return new SqlConnection(conn);
        }

        public bool checkName(string accName)
        {
            var url = "server=DESKTOP-66CSFNK; database=TuneSource; uid=sa; pwd=123456";
            var conn = new SqlConnection(url);
            conn.Open();
            string sql = "select * from Account Where Username = '" + accName + "'";
            var sqlcom = new SqlCommand(sql, conn);
            SqlDataReader sqlRead = sqlcom.ExecuteReader();
            if (sqlRead.Read())
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        //Add account to database 
        public void addAccount(string accName, string pwd)
        {
            //Query to add account to the Account table in the database
            var sqlda = new SqlDataAdapter("insert into Account(Username,Password) " +
                "values('" + accName + "','" + pwd + "')", setConnection());
            var ds = new DataSet();
            sqlda.Fill(ds, "Account");
        }

        public DataSet getData() // 
        {
            string sql = "SELECT * FROM Account";
            var sqlda = new SqlDataAdapter(sql, setConnection());
            var ds = new DataSet();
            sqlda.Fill(ds, "Account");
            return ds;
        }

        public bool delAccount(string id)
        {
            var sql = "delete from Account where Id= '" + id + "'";
            var sqlda = new SqlDataAdapter(sql, setConnection());
            var ds = new DataSet();
            sqlda.Fill(ds, "Account");
            return true;
        }
    }

    

}