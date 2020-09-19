using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class ManageProducts : System.Web.UI.Page
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

            for (int i = 0; i < chk_discount.Items.Count; i++)
            {
                chk_discount.Items[i].Attributes.Add("onclick", "MutExChkList(this)");
            }

            for (int i = 0; i < chkbx_disc_upd.Items.Count; i++)
            {
                chkbx_disc_upd.Items[i].Attributes.Add("onclick", "MutExChkList(this)");
            }

            gridview();

        }   
    }

    protected void Buttonsbmt_Click(object sender, EventArgs e)
    {
        try
        {
            if (chk_discount.SelectedItem.Text != "")
            {
                if (chk_discount.SelectedItem.Text == "Yes" && txtbx_dprice.Text == "")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "dprice_alert();", true);
                }
                else
                {
                    SqlCommand cmd1 = new SqlCommand("Select Name from Product where Name like '%' + @SearchInput + '%' and categoty=@catg", con);
                    cmd1.Parameters.Add(new SqlParameter("@SearchInput", txtbx_pname.Text));
                    cmd1.Parameters.Add(new SqlParameter("@catg", dd_catg.SelectedItem.Text));
                    con.Open();
                    SqlDataReader dr = cmd1.ExecuteReader();
                    if (dr.HasRows)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "samealert();", true);
                    }
                    else
                    {
                        if (FileUploadControl.HasFile)
                        {
                            string filename = Path.GetFileName(FileUploadControl.FileName);
                            FileUploadControl.SaveAs(Server.MapPath("~\\files\\") + filename);

                            string filepath = "files\\" + filename;

                            string insert = "INSERT INTO Product(Name,Img,Categoty,Price,DPrice,Isdiscount) VALUES (@name,@img,@catg,@price,@dprice,@disc)";
                            SqlCommand cmd = new SqlCommand(insert, con);
                            cmd.Parameters.AddWithValue("@name", txtbx_pname.Text);
                            cmd.Parameters.AddWithValue("@img", filepath);
                            cmd.Parameters.AddWithValue("@catg", dd_catg.SelectedItem.Text);
                            cmd.Parameters.AddWithValue("@price", txtbx_price.Text);
                            cmd.Parameters.AddWithValue("@dprice", txtbx_dprice.Text);
                            cmd.Parameters.AddWithValue("@disc", chk_discount.SelectedItem.Text);
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();

                            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert();", true);

                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "invalidfile();", true);
                        }

                    }

                }              

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "invalid_discount();", true);
            }
                          
        }
        catch (Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Error in the application')", true);
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
                cmd = new SqlCommand("Select Distinct Img,Name,Categoty,Price,DPrice,Isdiscount,Pid from Product where Name like '%' + @SearchInput + '%' or Categoty like '%' + @SearchInput + '%' or Price like '%' + @SearchInput + '%' or DPrice like '%' + @SearchInput + '%' or Isdiscount like '%' + @SearchInput + '%'", con);
                cmd.Parameters.Add(new SqlParameter("@SearchInput", search_name.Text));
            }
            else
            {
                cmd = new SqlCommand("Select Distinct Img,Name,Categoty,Price,DPrice,Isdiscount,Pid from Product", con);
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


    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (chkbx_disc_upd.SelectedItem.Text == "Yes" && txtbx_dprice_upd.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "dprice_alert();", true);
            }
            else
            {
                SqlCommand cmd1 = new SqlCommand("Select Name from Product where Name like '%' + @SearchInput + '%' and categoty=@catg", con);
                cmd1.Parameters.Add(new SqlParameter("@SearchInput", txtbx_pname_upd.Text));
                cmd1.Parameters.Add(new SqlParameter("@catg", dd_catg_upd.SelectedItem.Text));
                con.Open();
                SqlDataReader dr = cmd1.ExecuteReader();
                if (dr.HasRows)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "samealert();", true);
                }
                else
                {
                    string query_upd = "Update Product set name=@name,categoty=@categoty,price=@price,dprice=@dprice,isdiscount=@is_disc where pid=@pid";
                    SqlCommand command = new SqlCommand(query_upd, con);
                    command.Parameters.AddWithValue("@name", txtbx_pname_upd.Text);
                    command.Parameters.AddWithValue("@categoty", dd_catg_upd.SelectedItem.Text);
                    command.Parameters.AddWithValue("@price", txtbx_price_upd.Text);
                    command.Parameters.AddWithValue("@dprice", txtbx_dprice_upd.Text);
                    command.Parameters.AddWithValue("@is_disc", chkbx_disc_upd.SelectedItem.Text);
                    command.Parameters.AddWithValue("@pid", this.HiddenField_pid.Value);
                    con.Open();
                    command.ExecuteNonQuery();
                    con.Close();

                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert1();", true);
                }
                
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
            string delete = "Delete from product where pid=@pid";
            SqlCommand cmd = new SqlCommand(delete, con);
            cmd.Parameters.AddWithValue("@pid", this.HiddenField_pid.Value);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("ManageProducts.aspx");

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
