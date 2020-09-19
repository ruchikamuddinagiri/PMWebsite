using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddUsers : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProximityMarketingBluetooth"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["LoggedIn"] == null)
            {
                Response.Redirect("Index.aspx");
            }

        }
    }

    protected void Btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
           SqlCommand cmd1 = new SqlCommand("Select Email from [User] where email like '%' + @SearchInput + '%'", con);
            cmd1.Parameters.Add(new SqlParameter("@SearchInput",txtbx_email.Text));
            con.Open();
            SqlDataReader dr = cmd1.ExecuteReader();
            if (dr.HasRows)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "emailexists();", true);
            }
            else
            {
                con.Close();

                string insert = "INSERT INTO [User](name,email,contact,password) VALUES (@name,@email,@contact,@pass)";
                SqlCommand cmd = new SqlCommand(insert, con);
                cmd.Parameters.AddWithValue("@name", txtbx_name.Text);
                cmd.Parameters.AddWithValue("@email", txtbx_email.Text);
                cmd.Parameters.AddWithValue("@contact", txtbx_contact.Text);
                cmd.Parameters.AddWithValue("@pass", txtbx_password.Text);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert();", true);
            }
           
        }
        catch (Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Error in the application')", true);
        }

    }

}