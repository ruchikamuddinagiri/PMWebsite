using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ViewUsers : System.Web.UI.Page
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
                cmd = new SqlCommand("Select Distinct name,email,contact from [User] where (name like '%' + @SearchInput + '%' or email like '' + @SearchInput + '%' or contact like '%' + @SearchInput + '%')", con);
                cmd.Parameters.Add(new SqlParameter("@SearchInput", search_name.Text));
            }
            else
            {
                cmd = new SqlCommand("Select Distinct name,email,contact from [User]", con);
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



    protected void btn_search_ServerClick(object sender, EventArgs e)
    {
        gridview();
    }
}