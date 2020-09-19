using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ManageVendors : System.Web.UI.Page
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
                cmd = new SqlCommand("Select Distinct Name, Type, Vid from Vendor where Name like '%' + @Name + '%'", con);
                cmd.Parameters.Add(new SqlParameter("@Name", search_name.Text));                
            }
            else
            {
                cmd = new SqlCommand("Select Distinct Name,Type,Vid from Vendor", con);             
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
            SqlCommand cmd1 = new SqlCommand("Select Name from Vendor where Name like '%' + @SearchInput + '%'", con);
            cmd1.Parameters.Add(new SqlParameter("@SearchInput", txtbx_vname.Text));
            con.Open();
            SqlDataReader dr = cmd1.ExecuteReader();
            if (dr.HasRows)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "same();", true);
            }
            else
            {
                con.Close();
                string query = "INSERT INTO Vendor(Name,Type) VALUES (@name,@type)";
                SqlCommand command = new SqlCommand(query, con);
                command.Parameters.AddWithValue("@name", txtbx_vname.Text);
                command.Parameters.AddWithValue("@type", DropDownList_type.SelectedItem.Text);
                con.Open();
                command.ExecuteNonQuery();
                con.Close();

                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert();", true);
            }

        }
        catch (Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Error in the application')", true);
        }

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            SqlCommand cmd1 = new SqlCommand("Select Name from Vendor where Name like '%' + @SearchInput + '%'", con);
            cmd1.Parameters.Add(new SqlParameter("@SearchInput",txtbx_vname_upd.Text));
            con.Open();
            SqlDataReader dr = cmd1.ExecuteReader();
            if (dr.HasRows)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "same();", true);
            }
            else
            {
                con.Close();

                string query_upd = "Update Vendor set name=@name,type=@type where vid=@vid";
                SqlCommand command = new SqlCommand(query_upd, con);
                command.Parameters.AddWithValue("@name", txtbx_vname_upd.Text);
                command.Parameters.AddWithValue("@type", dd_type_upd.Text);
                command.Parameters.AddWithValue("@vid", this.HiddenField_vid.Value);
                con.Open();
                command.ExecuteNonQuery();
                con.Close();

                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert1();", true);
            }

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
            string delete = "Delete from vendor where vid=@vid";
            SqlCommand cmd = new SqlCommand(delete,con);
            cmd.Parameters.AddWithValue("@vid",this.HiddenField_vid.Value);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("ManageVendors.aspx");

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