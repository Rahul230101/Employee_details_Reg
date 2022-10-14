using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;
using System.Configuration;
using System.Collections;
using System.Runtime.CompilerServices;
using System.Data;
using System.Security.Policy;

namespace Employee_details
{
    public partial class _Default : Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Load_record();
            }
        }

        public void Load_record()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter sda = new SqlDataAdapter("Select * from Employee_info", con);
                DataSet ds = new DataSet();
                con.Open();
                sda.Fill(ds);
                Gridview1.DataSource = ds;
                Gridview1.DataBind();

            }
        }
        protected void btnInsert_Click1(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO Employee_info VALUES ('" + txtName.Text + "', '" + Convert.ToInt32(txtAge.Text) + "', '" + ddlgender.Text + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Data has been Inserted')", true);
                Load_record();

            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("Update Employee_info set Name = '" + txtName.Text + "', Age = '" + Convert.ToInt32(txtAge.Text) + "', Gender = '" + ddlgender.Text + "'  Where Name = '" + txtName.Text + "' ", con);
                con.Open();
                cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Data has been Updated')", true);
                Load_record();
            }
        }


        protected void Gridview1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("Delete From Employee_info Where Age = '" + Convert.ToInt32(Gridview1.DataKeys[e.RowIndex].Value) + "' ", con);
                con.Open();
                int row = cmd.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Data has been Deleted')",true);
                if (row > 0)
                {
                    Load_record();
                }
            }

        }
    }
}
    

//Age = '" + Convert.ToInt32(txtAge.Text) + "'

