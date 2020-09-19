using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ManageOffers : System.Web.UI.Page
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

            Vendors();
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
                cmd = new SqlCommand("Select Distinct o.offername,o.description,o.oid,v.name from Offers as o join vendor as v on v.vid = o.vid where o.offername like '%' + @SearchInput + '%' or o.description like '%' + @SearchInput + '%' or v.name like '%' + @SearchInput + '%'", con);
                cmd.Parameters.Add(new SqlParameter("@SearchInput", search_name.Text));
            }
            else
            {
                cmd = new SqlCommand("Select Distinct o.offername,o.description,o.oid,v.name from Offers as o join vendor as v on v.vid = o.vid", con);
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

    public void Vendors()
    {
        string select = "Select Distinct Vid,Name from Vendor";
        SqlDataAdapter da = new SqlDataAdapter(select,con);
        DataSet ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            dd_vendor.Items.Clear();
            dd_vendor_upd.Items.Clear();

            dd_vendor.Items.Insert(0, new ListItem("--Select Vendor--", "0"));

            for (int i=0; i<ds.Tables[0].Rows.Count; i++)
            {
                dd_vendor.Items.Insert(1, new ListItem(ds.Tables[0].Rows[i][1].ToString(), ds.Tables[0].Rows[i][0].ToString()));

                dd_vendor_upd.Items.Insert(0, new ListItem(ds.Tables[0].Rows[i][1].ToString(), ds.Tables[0].Rows[i][0].ToString()));

            }

        }
        else
        {
            dd_vendor.Items.Insert(0, new ListItem("--No records to display--", "0"));
        }

    }


    protected void Buttonsbmt_Click(object sender, EventArgs e)
    {
        try
        {
            string insert = "INSERT INTO Offers(vid,offername,description,status) VALUES (@vid,@offername,@descr,@status)";
            SqlCommand cmd = new SqlCommand(insert,con);
            cmd.Parameters.AddWithValue("@vid",dd_vendor.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@offername", txtbx_offername.Text);
            cmd.Parameters.AddWithValue("@descr", txtbx_descr.Text);
            cmd.Parameters.AddWithValue("@status", "");
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert();", true);
        }
        catch (Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Error in the application')", true);
        }

    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            string delete = "Delete from offers where oid=@oid";
            SqlCommand cmd = new SqlCommand(delete, con);
            cmd.Parameters.AddWithValue("@oid", this.HiddenField_oid.Value);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("ManageOffers.aspx");

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


    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            string query_upd = "Update Offers set offername=@name,description=@descr,vid=@vid where oid=@oid";
            SqlCommand command = new SqlCommand(query_upd, con);
            command.Parameters.AddWithValue("@name",txtbx_offer_upd.Text);
            command.Parameters.AddWithValue("@descr",txtbx_descr_upd.Text);
            command.Parameters.AddWithValue("@vid", dd_vendor_upd.SelectedItem.Value);
            command.Parameters.AddWithValue("@oid", this.HiddenField_oid.Value);
            con.Open();
            command.ExecuteNonQuery();
            con.Close();

            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert1();", true);

        }
        catch (Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Error in the application')", true);
        }

    }

}