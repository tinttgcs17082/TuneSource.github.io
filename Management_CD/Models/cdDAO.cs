using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;

namespace Management_CD.Models
{
    public class cdDAO
    {
        public static SqlConnection setConnection()
        {
            var conn = "server=DESKTOP-66CSFNK; database=TuneSource; uid=sa; pwd=123456";
            return new SqlConnection(conn);
        }

        public static DataSet getData()
        {
            string sql = "SELECT * FROM tbCD";
            var sqlda = new SqlDataAdapter(sql, setConnection());
            var ds = new DataSet();
            sqlda.Fill(ds, "tbCD");
            return ds;
        }

        public static void addCD( string title, string Singer, float price, string music, string img)
        {

            var sql = "insert into tbCD(Title,Singer,Price,Music,Picture) values('" + title + "','" + Singer + "','" + price + "',N'" + music + "',N'" + img + "')";
            var sqlda = new SqlDataAdapter(sql, setConnection());
            var ds = new DataSet();
            sqlda.Fill(ds, "tbCD");
        }

        public static bool delCD(string id)
        {
            var sql = "delete tbCD where ID='" + id + "'";
            var sqlda = new SqlDataAdapter(sql, setConnection());
            var ds = new DataSet();
            sqlda.Fill(ds, "tbCD");
            return true;
        }

        public static DataSet searchCD(string title)
        {
            var sql = "select * from tbCD where title like '%" + title + "%'";
            var sqlda = new SqlDataAdapter(sql, setConnection());
            var ds = new DataSet();
            sqlda.Fill(ds, "tbCD");
            return ds;
        }
    }
}