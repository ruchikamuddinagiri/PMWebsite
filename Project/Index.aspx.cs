using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Index : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProximityMarketingBluetooth"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["UserName"] != null)
        {
            txtbx_username.Text = Request.Cookies["UserName"].Value;
            chkbx_remember.Checked = true;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (txtbx_username.Text != "" && txtbx_pass.Text != "")
        {
            try
            {
                string select = "Select username from Admin where username='" + txtbx_username.Text + "' and password='" + txtbx_pass.Text + "'";
                SqlDataAdapter da = new SqlDataAdapter(select, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Session["LoggedIn"] = "Admin";

                    if (chkbx_remember.Checked)
                    {
                        Response.Cookies["UserName"].Value = txtbx_username.Text.Trim();                       
                        Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(30);
                        
                    }
                    else
                    {
                        Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(-1);
                       
                    }

                    Response.Redirect("ManageProducts.aspx");

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "invalidlogin();", true);
                }

            }
            catch (Exception ex)
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Error in the application')", true);
            }

        }
    }

}