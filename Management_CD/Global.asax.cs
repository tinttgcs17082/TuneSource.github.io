using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

using System.IO;
namespace Management_CD
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
        }
        void Session_Start(object sender, EventArgs e)
        {
            int visitor = 0;
            StreamReader sr = new StreamReader(Server.MapPath("~/CountVisiter.txt"));
            visitor = int.Parse(sr.ReadLine());
            sr.Close();
            visitor++;
            Application["Visitor"] = visitor;
            StreamWriter sw = new StreamWriter(Server.MapPath("~/CountVisiter.txt"));
            sw.Write(visitor);
            sw.Flush();
            sw.Close();
        }
    }
}