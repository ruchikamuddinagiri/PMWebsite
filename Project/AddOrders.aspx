<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="AddOrders.aspx.cs" Inherits="AddOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container top-content">
    
        <div class="row">
            <div class="col-md-8 mb-5 mx-auto">
                <div class="card">
                    <div class="card-header"><b>Add Orders</b></div>
                    <div class="card-body">
                     
                        <div class="row">
                            <div class="col-md-8 col-lg-8">
                                <div class="form-group">
                                    <asp:Label ID="Label1" runat="server" Text="Search User:"></asp:Label>
                                    <asp:TextBox ID="txtbx_searchuser" runat="server" CssClass="form-control price amt" autocomplete="off" placeholder="Search User"></asp:TextBox>                                   
                                    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator4" ForeColor="red" runat="server" ControlToValidate="txtbx_searchuser" ValidationGroup="search_submit" ErrorMessage="Please Search User"></asp:RequiredFieldValidator>
                                  
                                </div>
                            </div>

                            <div class="col-md-4 col-lg-4 mt-4">
                                <asp:Button ID="Btn_search" ValidationGroup="search_submit" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="Btn_search_Click" />
                            </div>
                        </div>

                        <asp:Panel ID="Panel_Order" runat="server" Visible="false">

                            <div class="row">
                                <div class="col-md-12 col-lg-12">
                                    <div class="form-group">
                                        <label>User Id: </label>
                                        <asp:TextBox ID="txtbx_uid" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                        <asp:HiddenField ID="HiddenField_uid" runat="server" Value="" />
                                    </div>
                                </div>
                            </div>

                             <div class="row">
                                <div class="col-md-12 col-lg-12">
                                    <div class="form-group">
                                        <label>Name: </label>
                                        <asp:TextBox ID="txtbx_name" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                        <asp:HiddenField ID="Hf_name" runat="server" Value="" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 col-lg-6">
                                    <label>Select Category: </label>
                                    <br />
                                    <asp:DropDownList CssClass="form-control" ID="dd_catg" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dd_catg_SelectedIndexChanged">
                                        <asp:ListItem Value="none" >--Select Category--</asp:ListItem>
                                        <asp:ListItem>Baby</asp:ListItem>
                                        <asp:ListItem>Beauty</asp:ListItem>
                                        <asp:ListItem>Beverages</asp:ListItem>
                                        <asp:ListItem>Canned Goods</asp:ListItem>
                                        <asp:ListItem>Candy</asp:ListItem>
                                        <asp:ListItem>Cleaning Supplies</asp:ListItem>
                                        <asp:ListItem>Dairy</asp:ListItem>
                                        <asp:ListItem>Frozen Foods</asp:ListItem>
                                        <asp:ListItem>Fruits</asp:ListItem>
                                        <asp:ListItem>Grains</asp:ListItem>
                                        <asp:ListItem>Health</asp:ListItem>
                                        <asp:ListItem>Household</asp:ListItem>
                                        <asp:ListItem>Meat</asp:ListItem>
                                        <asp:ListItem>Miscellaneous</asp:ListItem>
                                        <asp:ListItem>Others</asp:ListItem>
                                        <asp:ListItem>Paper Products</asp:ListItem>
                                        <asp:ListItem>Pharmacy</asp:ListItem>
                                        <asp:ListItem>Snacks</asp:ListItem>
                                        <asp:ListItem>Spices</asp:ListItem>
                                        <asp:ListItem>Vegetables</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" runat="server" InitialValue="none" ControlToValidate="dd_catg" ValidationGroup="add_submit" ErrorMessage="Please Select Category"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <asp:Panel ID="Panel_products" runat="server" Visible="false">
                                <div class="row">
                                    <div class="col-md-12 col-lg-12">
                                        <div class="form-group">
                                            <asp:Label ID="Label2" runat="server" Text="Select Product:"></asp:Label>
                                            <asp:DropDownList ID="dd_products" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="dd_products_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" InitialValue="0" Display="Dynamic" ForeColor="red" runat="server" ControlToValidate="dd_products" ValidationGroup="add_submit" ErrorMessage="Please Select Category"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>


                            <asp:Panel ID="Panel_Pricedetails" runat="server" Visible="false">
                                <div class="row">
                                    <div class="col-md-12 col-lg-12">
                                        <div class="form-group">
                                            <label>Price: </label>
                                            <asp:TextBox ID="txtbx_price" runat="server" CssClass="form-control price" ReadOnly="true" autocomplete="off" placeholder="Enter Price"></asp:TextBox>
                                            <asp:HiddenField ID="Hf_price" runat="server" Value="" />
                                            <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator1" ForeColor="red" runat="server" ControlToValidate="txtbx_price" ValidationGroup="add_submit" ErrorMessage="Please Enter Price"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12 col-lg-12">
                                        <div class="form-group">
                                            <label>Quantity: </label>
                                            <asp:TextBox ID="txtbx_qty" runat="server" CssClass="form-control qty amt" autocomplete="off" placeholder="Enter Quantity"></asp:TextBox>
                                            <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator2" ForeColor="red" runat="server" ControlToValidate="txtbx_qty" ValidationGroup="add_submit" ErrorMessage="Please Enter Quantity"></asp:RequiredFieldValidator>

                                            <span id="errmsg1" style="color: red;"></span>

                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12 col-lg-12">
                                        <div class="form-group">
                                            <label>Total Price: </label>
                                            <asp:TextBox ID="txtbx_totalprice" runat="server" CssClass="form-control totalprice" ReadOnly="true" placeholder="Total Price"></asp:TextBox>
                                            <asp:HiddenField ID="Hf_totprice" runat="server" />

                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>

                        </asp:Panel>

                       <%--<div class="row">
                            <div class="col-md-12 col-lg-12">
                                <div class="form-group">
                                    <label>Product Name: </label>
                                    <asp:TextBox ID="txtbx_pname" runat="server" CssClass="form-control" placeholder="Enter Product Name"></asp:TextBox>                                   
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="red" runat="server" ControlToValidate="txtbx_pname" ValidationGroup="add_submit" ErrorMessage="Please Enter Name"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>--%>

                    </div>


                     <div class="card-footer text-center">
                        <asp:Button ID="Btn_submit" runat="server" Text="Add" Visible="false" CssClass="btn btn-info" ValidationGroup="add_submit" OnClick="Btn_submit_Click" />
                    </div>


                </div>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-md-12 col-lg-12 text-center">
                <asp:GridView ID="GridView1" Width="100%" ShowHeaderWhenEmpty="true" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False">
                    <Columns>
                    
                        <asp:BoundField DataField="Uid" HeaderText="UId" HeaderStyle-CssClass="GridHeader" />                       
                        <asp:BoundField DataField="Name" HeaderText="Name" HeaderStyle-CssClass="GridHeader" />
                        <asp:BoundField DataField="Category" HeaderText="Category" HeaderStyle-CssClass="GridHeader" />                   
                        <asp:BoundField DataField="Pname" HeaderText="Product" HeaderStyle-CssClass="GridHeader" /> 
                        <asp:BoundField DataField="Price" HeaderText="Price" HeaderStyle-CssClass="GridHeader" />
                        <asp:BoundField DataField="Qty" HeaderText="Quantity" HeaderStyle-CssClass="GridHeader" />                                     
                        <asp:BoundField DataField="TotalPrice" HeaderText="Total Price" HeaderStyle-CssClass="GridHeader" /> 
                        <asp:BoundField DataField="Pid" HeaderText="" ItemStyle-CssClass="hidden-field" HeaderStyle-CssClass="hidden-field"></asp:BoundField>
                                                 <asp:BoundField DataField="Tempid" HeaderText="" ItemStyle-CssClass="hidden-field" HeaderStyle-CssClass="hidden-field"></asp:BoundField>    
                        
                    </Columns>
                   
                </asp:GridView>

                <asp:Button ID="Button_finalsubmit" runat="server" Text="Submit" CssClass="btn btn-success mt-2 mb-2" OnClick="Button_finalsubmit_Click" Visible="false" />

            </div>
        </div>

    </div>

    <script>

        $(document).ready(function () {

            $(".amt").focusout(function () {

                if($("#<%=txtbx_price.ClientID%>").val() != "" && $("#<%=txtbx_qty.ClientID%>").val() !=""){
                    var price = parseInt($("#<%=txtbx_price.ClientID%>").val());
                    var qty = parseInt($("#<%=txtbx_qty.ClientID%>").val());

                    var finalamt = (price * qty);

                    $("#<%=txtbx_totalprice.ClientID%>").val(finalamt);
                    $("#<%=Hf_totprice.ClientID%>").val(finalamt);
                }
                else {
                    $("#<%=txtbx_totalprice.ClientID%>").val("");
                    $("#<%=Hf_totprice.ClientID%>").val("");
                }
              
            });

        });


        function invalid_user() {
            swal("No Matched User");
        }

        
        function samealert() {
            swal("This product is already added for this category");
        }

        function successalert() {

            swal({
                icon: "success",
                text: "User Added Successfully",
                type: "success"
            }).then(function () {
                window.location = "ViewOrders.aspx";
            });

        }

    </script>

</asp:Content>