using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;


namespace WebApp
{
    public class Connect
    {
        public static SqlConnection conn = null;
        public SqlCommand _cmd;
        private SqlDataAdapter _da;
        private DataTable _dt;


        public Connect()
        {
            conn = new SqlConnection(@"Data Source=sql5031.site4now.net;Initial Catalog=DB_A53C41_gogas;User Id=DB_A53C41_gogas_admin;;Password=C@ll0fduty01");

            conn.Open();
        }

        public void SqlQuery(string queryText)
        {
            _cmd = new SqlCommand(queryText, conn);
        }

        public void SqlQuery2(string queryText)
        {
            _cmd = new SqlCommand(queryText, conn);
        }

        public void NonQueryEx()
        {
            _cmd.ExecuteNonQuery();
        }

        public DataTable QueryEx()
        {
            _da = new SqlDataAdapter(_cmd);
            _dt = new DataTable();
            _da.Fill(_dt);
            return _dt;
        }
    }
}