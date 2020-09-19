using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ViewOrders : System.Web.UI.Page
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
                cmd = new SqlCommand("Select o.orderid,u.name as username,o.cat,p.name,o.price,o.qty,o.totprice,o.date,o.time from orders as o join [User] as u on o.uid = u.[User] join product as p on o.pid = p.pid where (p.name like '%' + @SearchInput + '%' or o.orderid like '%' + @SearchInput + '%')", con);
                cmd.Parameters.Add(new SqlParameter("@SearchInput", search_name.Text));
            }
            else
            {
                cmd = new SqlCommand("Select o.orderid,u.name as username,o.cat,p.name,o.price,o.qty,o.totprice,o.date,o.time from orders as o join [User] as u on o.uid = u.[User] join product as p on o.pid = p.pid", con);
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