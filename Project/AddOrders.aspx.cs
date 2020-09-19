using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddOrders : System.Web.UI.Page
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

            //Users();
            //Vendors();           
        }

    }

    protected void Btn_submit_Click(object sender, EventArgs e)
    {
        try
        {          
            SqlCommand cmd1 = new SqlCommand("Select Pname,Category from OrderTemp where Pname like '%' + @SearchInput + '%' and Category = @catg", con);
            cmd1.Parameters.Add(new SqlParameter("@SearchInput", dd_products.SelectedItem.Text));
            cmd1.Parameters.Add(new SqlParameter("@catg",dd_catg.SelectedItem.Text));
            con.Open();
            SqlDataReader dr = cmd1.ExecuteReader();
            if (dr.HasRows)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "samealert();", true);
                
            }
            else
            {
                con.Close();

                string insert = "INSERT INTO OrderTemp(uid,name,category,pid,pname,price,qty,totalprice) VALUES (@uid,@name,@catg,@pid,@pname,@price,@qty,@totprice)";
                SqlCommand cmd = new SqlCommand(insert, con);
                cmd.Parameters.AddWithValue("@uid", this.HiddenField_uid.Value);
                cmd.Parameters.AddWithValue("@name", this.Hf_name.Value);
                cmd.Parameters.AddWithValue("@catg", dd_catg.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@pid", dd_products.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@pname", dd_products.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@price", this.Hf_price.Value);
                cmd.Parameters.AddWithValue("@qty", txtbx_qty.Text);
                cmd.Parameters.AddWithValue("@totprice", this.Hf_totprice.Value);
                //cmd.Parameters.AddWithValue("@date", currdate);
                //cmd.Parameters.AddWithValue("@time", currtime);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                txtbx_totalprice.Text = this.Hf_totprice.Value;

                gridview();
               
            }


        }
        catch (Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Error in the application')", true);
        }

    }


    //public void Vendors()
    //{
    //    string select = "Select Distinct Vid,Name from Vendor";
    //    SqlDataAdapter da = new SqlDataAdapter(select, con);
    //    DataSet ds = new DataSet();
    //    da.Fill(ds);

    //    if (ds.Tables[0].Rows.Count > 0)
    //    {
    //        dd_vendor.Items.Clear();

    //        dd_vendor.Items.Insert(0, new ListItem("--Select Vendor--", "0"));

    //        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
    //        {
    //            dd_vendor.Items.Insert(1, new ListItem(ds.Tables[0].Rows[i][1].ToString(), ds.Tables[0].Rows[i][0].ToString()));
    //        }

    //    }
    //    else
    //    {
    //        dd_vendor.Items.Insert(0, new ListItem("--No records to display--", "0"));
    //    }

    //}


    //public void Users()
    //{
    //    string select = "Select Distinct [User],Name from [User]";
    //    SqlDataAdapter da = new SqlDataAdapter(select, con);
    //    DataSet ds = new DataSet();
    //    da.Fill(ds);

    //    if (ds.Tables[0].Rows.Count > 0)
    //    {
    //        dd_user.Items.Clear();

    //        dd_user.Items.Insert(0, new ListItem("--Select User--", "0"));

    //        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
    //        {
    //            dd_user.Items.Insert(1, new ListItem(ds.Tables[0].Rows[i][1].ToString(), ds.Tables[0].Rows[i][0].ToString()));
    //        }

    //    }
    //    else
    //    {
    //        dd_user.Items.Insert(0, new ListItem("--No records to display--", "0"));
    //    }

    //}



    protected void Btn_search_Click(object sender, EventArgs e)
    {
        try
        {
            SqlCommand cmd1 = new SqlCommand("Select [User],Name from [User] where [User] like '%' + @SearchInput + '%'", con);
            cmd1.Parameters.Add(new SqlParameter("@SearchInput", txtbx_searchuser.Text));
            con.Open();
            SqlDataReader dr = cmd1.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                txtbx_uid.Text = dr["User"].ToString();
                txtbx_name.Text = dr["Name"].ToString();
                this.HiddenField_uid.Value = dr["User"].ToString();
                this.Hf_name.Value = dr["Name"].ToString();

                Panel_Order.Visible = true;
                Panel_products.Visible = false;
                Btn_submit.Visible = false;
                Panel_Pricedetails.Visible = false;
                txtbx_searchuser.Text = "";

                con.Close();

                string delete = "Delete from ordertemp";
                SqlCommand cmd2 = new SqlCommand(delete, con);
                con.Open();
                cmd2.ExecuteNonQuery();
                con.Close();

                gridview();

            }
            else
            {
                Panel_Order.Visible = false;
                Btn_submit.Visible = false;

                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "invalid_user();", true);
            }

        }
        catch (Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Error in the application')", true);
        }

    }

    public void Products()
    {
        string select = "Select Distinct Pid,Name from Product where categoty ='"+dd_catg.SelectedItem.Text+"'";
        SqlDataAdapter da = new SqlDataAdapter(select, con);
        DataSet ds = new DataSet();
        da.Fill(ds);

        dd_products.Items.Clear();

        if (ds.Tables[0].Rows.Count > 0)
        {
            
            dd_products.Items.Insert(0, new ListItem("--Select Product--", "0"));

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dd_products.Items.Insert(1, new ListItem(ds.Tables[0].Rows[i][1].ToString(), ds.Tables[0].Rows[i][0].ToString()));
            }

        }
        else
        {
            dd_products.Items.Insert(0, new ListItem("--No records to display--", "0"));
        }

        Panel_products.Visible = true;

    }


    protected void dd_catg_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (dd_catg.SelectedItem.Text != "--Select Category--")
        {
            Products();
        }

    }


    protected void dd_products_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (dd_products.SelectedItem.Text!="--Select Product--")
        {
            SqlCommand cmd1 = new SqlCommand("Select Price,Dprice,Isdiscount from Product where Pid=@pid", con);
            cmd1.Parameters.Add(new SqlParameter("@pid", dd_products.SelectedItem.Value));
            con.Open();
            SqlDataReader dr = cmd1.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();

                string is_disc = dr["Isdiscount"].ToString();
                string price = dr["Price"].ToString();
                string dprice = dr["Dprice"].ToString();

                if (is_disc == "Yes")
                {
                    txtbx_price.Text = dprice;
                    Hf_price.Value = dprice;
                }
                else if (is_disc == "No")
                {
                    txtbx_price.Text = price;
                    Hf_price.Value = price;
                }

                Panel_Pricedetails.Visible = true;
                Btn_submit.Visible = true;
            }
            

        }

    }

    public void gridview()
    {
        string connect = ConfigurationManager.ConnectionStrings["ProximityMarketingBluetooth"].ConnectionString;

        using (SqlConnection con = new SqlConnection(connect))
        {
            SqlCommand cmd;

            cmd = new SqlCommand("Select uid,name,category,pname,price,qty,totalprice,pid,tempid from ordertemp where uid='"+this.HiddenField_uid.Value+"'", con);
           
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                GridView1.DataSource = dr;
                GridView1.DataBind();
                GridView1.Visible = true;
                Button_finalsubmit.Visible = true;
            }
            else
            {
                GridView1.Visible = false;
                Button_finalsubmit.Visible = false;
            }

            con.Close();

        }

    }


    protected void Button_finalsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string currdate = DateTime.Now.ToString("yyyy-MM-dd");

            string currtime = DateTime.Now.ToString("h:mm tt");


            string orderid = "";
            int flag = 0;

            string select = "Select Top 1 Orderid from Orders Order by Orderid desc";

            SqlDataAdapter da = new SqlDataAdapter(select, con);
            DataSet ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                string id = ds.Tables[0].Rows[0][0].ToString();
                string[] id_arr = id.Split('-');

                int orderid_int = Convert.ToInt32(id_arr[1]) + 1;

                orderid = "O-" + orderid_int.ToString();
            }
            else
            {
                orderid = "O-101";
            }


            foreach (GridViewRow row in GridView1.Rows)
            {
                SqlCommand cmd1 = new SqlCommand("Select * from Orders where pid=@pid and cat=@catg and uid=@uid", con);
                cmd1.Parameters.Add(new SqlParameter("@pid", row.Cells[7].Text));
                cmd1.Parameters.Add(new SqlParameter("@catg", row.Cells[2].Text));
                cmd1.Parameters.Add(new SqlParameter("@uid", row.Cells[0].Text));
                con.Open();
                SqlDataReader dr = cmd1.ExecuteReader();
                if (dr.HasRows)
                {
                    con.Close();

                    string query_upd = "Update Orders set qty=@qty,totprice=@totprice,date=@date,time=@time where pid=@pid and cat=@catg and uid=@uid";
                    SqlCommand command = new SqlCommand(query_upd, con);
                    command.Parameters.AddWithValue("@qty", row.Cells[5].Text);
                    command.Parameters.AddWithValue("@totprice", row.Cells[6].Text);
                    command.Parameters.AddWithValue("@date", currdate);
                    command.Parameters.AddWithValue("@time", currtime);
                    command.Parameters.AddWithValue("@pid", row.Cells[7].Text);
                    command.Parameters.AddWithValue("@catg", row.Cells[2].Text);
                    command.Parameters.AddWithValue("@uid", row.Cells[0].Text);
                    con.Open();
                    command.ExecuteNonQuery();
                    con.Close();

                }
                else
                {
                    string insert = "INSERT INTO Orders(orderid,uid,cat,pid,price,qty,totprice,date,time) VALUES (@orderid,@uid,@catg,@pid,@price,@qty,@totprice,@date,@time)";
                    SqlCommand cmd = new SqlCommand(insert, con);
                    cmd.Parameters.AddWithValue("@orderid", orderid);
                    cmd.Parameters.AddWithValue("@uid", row.Cells[0].Text);
                    cmd.Parameters.AddWithValue("@catg", row.Cells[2].Text);
                    cmd.Parameters.AddWithValue("@pid", row.Cells[7].Text);
                    cmd.Parameters.AddWithValue("@price", row.Cells[4].Text);
                    cmd.Parameters.AddWithValue("@qty", row.Cells[5].Text);
                    cmd.Parameters.AddWithValue("@totprice", row.Cells[6].Text);
                    cmd.Parameters.AddWithValue("@date", currdate);
                    cmd.Parameters.AddWithValue("@time", currtime);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();


                    string delete = "Delete from ordertemp where tempid=@tempid";
                    SqlCommand cmd2 = new SqlCommand(delete, con);
                    cmd1.Parameters.AddWithValue("@tempid", row.Cells[8].Text);
                    con.Open();
                    cmd2.ExecuteNonQuery();
                    con.Close();

                }

            }

            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert();", true);
        }
        catch (Exception ex)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "msgtype", "alert('Error in the application')", true);
        }

    }

}