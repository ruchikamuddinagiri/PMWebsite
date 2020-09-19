<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="Settings.aspx.cs" Inherits="Settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container top-content">

        <div class="row">
            <div class="col-md-8 col-lg-8">
                <asp:Panel ID="Panel_search" runat="server">
                    <div class="input-group" style="width: 60%;">
                        <asp:TextBox ID="search_name" runat="server" CssClass="form-control" placeholder="Search"></asp:TextBox>
                        <div class="input-group-btn">
                            <button class="btn btn-primary" id="btn_search" type="submit" runat="server" onserverclick="btn_search_ServerClick">
                                <i class="fa fa-search" aria-hidden="true" style="font-size: 17px;"></i>
                            </button>
                        </div>
                    </div>
                </asp:Panel>
            </div>
            <div class="col-md-4 col-lg-4">
                <input id="add_button" type="button" onclick="add();" class="btn btn-primary" value="Add" style="float: right;" />
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-md-12 col-lg-12 text-center">
                <asp:GridView ID="GridView1" Width="100%" ShowHeaderWhenEmpty="true" runat="server" CssClass="table table-striped table-bordered table-hover table-fixed" AutoGenerateColumns="False">
                    <Columns> 
                        <asp:BoundField DataField="Bno" HeaderText="Beacon No." HeaderStyle-CssClass="GridHeader" />                       
                        <asp:BoundField DataField="Category" HeaderText="Category" HeaderStyle-CssClass="GridHeader" />
                                           
                    </Columns>
                   
                    <EmptyDataTemplate>No Record Available</EmptyDataTemplate>
                </asp:GridView>

            </div>
        </div>

</div>


<!-- Modal Add -->   
    <div id="myModalAdd" class="modal fade" role="dialog">
        <div class="modal-dialog" style="max-width:600px;">
           
            <!-- Modal content-->

            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add MacIds of Beacons</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <div class="form-group">
                               <label>Beacon No.:</label>
                                <asp:TextBox ID="txtbx_bno" runat="server" CssClass="form-control mob"></asp:TextBox>                         
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="red" runat="server" ControlToValidate="txtbx_bno" ValidationGroup="add_submit" ErrorMessage="Please Enter Beacon No."></asp:RequiredFieldValidator>
                                <span id="errmsg" style="color: red;"></span>

                            </div>
                        </div>
                    </div>

                     <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <div class="form-group">
                                <asp:Label ID="Label2" runat="server" Text="Select Vendor:"></asp:Label>
                                <asp:DropDownList CssClass="form-control" ID="dd_catg" runat="server">
                                        <asp:ListItem Value="none">--Select Category--</asp:ListItem>
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
                    </div>

                </div>
                <div class="modal-footer">
                    <asp:Button ID="Buttonsbmt" CssClass="btn btn-primary" runat="server" Text="Submit" ValidationGroup="add_submit" OnClick="Buttonsbmt_Click" />
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
    
   
    <script>

        function same() {
            swal("This Beacon No. already exists for this Category");
        }

     function successalert() {

         swal({
             icon: "success",
             text: "MacIds of Beacons Added Successfully",
             type: "success"
         }).then(function () {
             window.location = "Settings.aspx";
         });

     }

 </script> 

</asp:Content>
