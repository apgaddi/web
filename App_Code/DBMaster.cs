using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApp.App_Code
{
    public class DBMaster
    {
        private SqlConnection con;

        public SqlConnection getConnection()
        {
           
            //connect to db
              
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
                con.Open();
                return con;
        }
        public SqlDataReader getReader(string query)
        {
            //create command

                SqlCommand cmd = new SqlCommand(query);
                cmd.CommandType=System.Data.CommandType.Text;
                cmd.Connection = this.getConnection();

       
                //read from db

                SqlDataReader rdr = cmd.ExecuteReader();
                return rdr;
        }
        
        
        public void closeConnection()
        {
            if (con!=null && con.State==System.Data.ConnectionState.Open)
            {
                this.con.Close();
            }
        }
    }
}