using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Settings : System.Web.UI.Page
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

            gridview();
        }
    }

    public void gridview()
    {
        string connect = ConfigurationManager.ConnectionStrings["ProximityMarketingBluetooth"].ConnectionString;

        using (SqlConnection con = new SqlConnection(connect))
        {
            SqlCommand cmd;

            if (search_name.Text != "")
            {
                cmd = new SqlCommand("Select bno,category from beacons where (bno like '%' + @SearchInput + '%' or category like '%' + @SearchInput + '%')", con);
                cmd.Parameters.Add(new SqlParameter("@SearchInput", search_name.Text));              
            }
            else
            {
                cmd = new SqlCommand("Select bno,category from beacons", con);
            }

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                Panel_search.Visible = true;
                GridView1.DataSource = dr;
                GridView1.DataBind();
            }
            else
            {
                Panel_search.Visible = false;
                DataTable dt = new Datatable();
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }

            con.Close();

        }

    }


    protected void Buttonsbmt_Click(object sender, EventArgs e)
    {
        try
        {
            SqlCommand cmd1 = new SqlCommand("Select bno from beacons where bno like '%' + @SearchInput + '%' and category=@catg", con);
            cmd1.Parameters.Add(new SqlParameter("@SearchInput",txtbx_bno.Text));
            cmd1.Parameters.Add(new SqlParameter("@catg", dd_catg.SelectedItem.Text));
            con.Open();
            SqlDataReader dr = cmd1.ExecuteReader();
            if (dr.HasRows)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "same();", true);
            }
            else
            {
                con.Close();

                string insert = "INSERT INTO Beacons(bno,category) VALUES (@bno,@catg)";
                SqlCommand cmd = new SqlCommand(insert, con);
                cmd.Parameters.AddWithValue("@bno",txtbx_bno.Text);
                cmd.Parameters.AddWithValue("@catg", dd_catg.SelectedItem.Text);             
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


    protected void btn_search_ServerClick(object sender, EventArgs e)
    {
        gridview();
    }

}