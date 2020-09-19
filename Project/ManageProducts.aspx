<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="ManageProducts.aspx.cs" Inherits="ManageProducts" %>

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
                        <asp:ImageField DataImageUrlField="img" HeaderText="Image" ControlStyle-Width="100px" ControlStyle-Height="100px"></asp:ImageField>
                        <asp:BoundField DataField="Name" HeaderText="Name" HeaderStyle-CssClass="GridHeader" />                       
                        <asp:BoundField DataField="Categoty" HeaderText="Category" HeaderStyle-CssClass="GridHeader" /> 
                         <asp:BoundField DataField="Price" HeaderText="Price" HeaderStyle-CssClass="GridHeader" />                       
                         <asp:BoundField HeaderText="Discounted Price" DataField="DPrice" HeaderStyle-CssClass="GridHeader" />                       
                         <asp:BoundField HeaderText="Is Discount Available?" DataField="Isdiscount" HeaderStyle-CssClass="GridHeader" />                                             
                         <asp:BoundField DataField="Pid" HeaderText="" ItemStyle-CssClass="hidden-field" HeaderStyle-CssClass="hidden-field"></asp:BoundField>
                        
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" Text="<i class='fa fa-pencil-square-o'></i>" OnClientClick="return GetSelectedRow_product(this)"></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton2" style="margin-left:10%;" runat="server" Text="<i class='fa fa-trash'></i>" OnClientClick="return GetSelectedRow_pdel(this)"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>                        
                    </Columns>
                   
                    <EmptyDataTemplate>No Record Available</EmptyDataTemplate>
                </asp:GridView>

                <asp:HiddenField ID="HiddenField_pid" ClientIDMode="Static" runat="server" Value="" />

            </div>
        </div>

</div>


<!-- Modal Add -->   
    <div id="myModalAdd" class="modal fade" role="dialog">
        <div class="modal-dialog" style="max-width:600px;">
           
            <!-- Modal content-->

            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add Products</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <div class="form-group">
                                <label>Product Name: </label>
                                <asp:TextBox ID="txtbx_pname" runat="server" CssClass="form-control" placeholder="Enter Product Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="red" runat="server" ControlToValidate="txtbx_pname" ValidationGroup="add_submit" ErrorMessage="Please Enter Name"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 col-lg-6">
                            <label>Choose Image: </label>
                            <asp:FileUpload ID="FileUploadControl" accept=".png, .jpg, .jpeg" runat="server" /><br />
                            
                        </div>
                    </div>

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="row mt-4">
                                <div class="col-md-6 col-lg-6">
                                    <label>Select Category: </label>
                                    <br />
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
                        </ContentTemplate>

                    </asp:UpdatePanel>
                    

                    <div class="row mt-3">
                            <div class="col-md-12 col-lg-12">
                                <div class="form-group">
                                    <label>Price: </label>
                                    <asp:TextBox ID="txtbx_price" runat="server" CssClass="form-control price amt" autocomplete="off" placeholder="Enter Price"></asp:TextBox>
                                    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator4" ForeColor="red" runat="server" ControlToValidate="txtbx_price" ValidationGroup="add_submit" ErrorMessage="Please Enter Price"></asp:RequiredFieldValidator>

                                    <span id="errmsg" style="color: red;"></span>

                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 col-lg-12">
                                <div class="form-group">
                                    <label>Discounted Price: </label>
                                    <asp:TextBox ID="txtbx_dprice" runat="server" CssClass="form-control dprice amt" autocomplete="off" placeholder="Enter Discounted Price"></asp:TextBox>
                                    
                                    <span id="dprice_errmsg" style="color: red;"></span>

                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 col-lg-12">
                                <div class="form-group">
                                    <label>Is discount?: </label>
                                    <asp:CheckBoxList ID="chk_discount" runat="server" RepeatDirection="Horizontal" CellPadding="6" CellSpacing="-1">
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem>No</asp:ListItem>

                                    </asp:CheckBoxList>

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
    
   <!-- Modal Edit -->   
    <div id="myModalEdit" class="modal fade" role="dialog">
        <div class="modal-dialog" style="max-width:600px;">
           
            <!-- Modal content-->

            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Edit Products</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-12 col-lg-12" id="div_image">
                            
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <div class="form-group">
                                <label>Product Name: </label>
                                <asp:TextBox ID="txtbx_pname_upd" ClientIDMode="Static" runat="server" CssClass="form-control" placeholder="Enter Product Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="red" runat="server" ControlToValidate="txtbx_pname_upd" ValidationGroup="upd_submit" ErrorMessage="Please Enter Product Name"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-md-6 col-lg-6">
                                    <label>Select Category: </label>
                                    <br />
                                    <asp:DropDownList CssClass="form-control" ClientIDMode="Static" ID="dd_catg_upd" runat="server">
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
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" runat="server" InitialValue="none" ControlToValidate="dd_catg_upd" ValidationGroup="upd_submit" ErrorMessage="Please Select Category"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </ContentTemplate>

                    </asp:UpdatePanel>


                    <div class="row mt-3">
                        <div class="col-md-12 col-lg-12">
                            <div class="form-group">
                                <label>Price: </label>
                                <asp:TextBox ID="txtbx_price_upd" runat="server" ClientIDMode="Static" CssClass="form-control price amt" autocomplete="off" placeholder="Enter Price"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator7" ForeColor="red" runat="server" ControlToValidate="txtbx_price_upd" ValidationGroup="upd_submit" ErrorMessage="Please Enter Price"></asp:RequiredFieldValidator>

                                <span id="errmsg_pr_upd" style="color: red;"></span>

                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <div class="form-group">
                                <label>Discounted Price: </label>
                                <asp:TextBox ID="txtbx_dprice_upd" runat="server" ClientIDMode="Static" CssClass="form-control price amt" autocomplete="off" placeholder="Enter Discounted Price"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator8" ForeColor="red" runat="server" ControlToValidate="txtbx_dprice_upd" ValidationGroup="upd_submit" ErrorMessage="Please Enter Discounted Price"></asp:RequiredFieldValidator>

                                <span id="dprice_errmsg_upd" style="color: red;"></span>

                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <div class="form-group">
                                <label>Is discount?: </label>
                                <asp:CheckBoxList ID="chkbx_disc_upd" runat="server" ClientIDMode="Static" RepeatDirection="Horizontal" CellPadding="6" CellSpacing="-1">
                                    <asp:ListItem>Yes</asp:ListItem>
                                    <asp:ListItem>No</asp:ListItem>

                                </asp:CheckBoxList>

                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Submit" ValidationGroup="upd_submit" OnClick="Button1_Click" />
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div> 

    <!-- Modal HTML -->
    <div id="myModalDelete" class="modal fade">
        <div class="modal-dialog modal-confirm">
            <div class="modal-content">
                <div class="modal-header">
                    
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>

                    <div class="container">
                         <div class="row">
                        <div class="col-md-12 col-sm-12">
                            <div class="icon-box">
                                <i class="fa fa-times" style="font-size: 45px; color: #f15e5e;"></i>
                            </div>
                        </div>
                    </div>
                   
                    <div class="row">
                        <div class="col-md-12 col-sm-12">
                             <h4 class="modal-title">Are you sure?</h4>
                        </div>
                    </div>
                   
                    </div>
                   
                </div>
                <div class="modal-body">
                    <p>Do you really want to delete these records? This process cannot be undone.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-info" data-dismiss="modal">Cancel</button>
                    <asp:Button ID="Button2" CssClass="btn btn-danger" runat="server" Text="Delete" OnClick="Button2_Click" />
                </div>
            </div>
        </div>
    </div>  

 <script>

     function invalidfile() {
         swal("Please Upload File");
     }

     function successalert() {

         swal({
             icon: "success",
             text: "Product Added Successfully",
             type: "success"
         }).then(function () {
             window.location = "ManageProducts.aspx";
         });

     }

     function successalert1() {

         swal({
             icon: "success",
             text: "Product Updated Successfully",
             type: "success"
         }).then(function () {
             window.location = "ManageProducts.aspx";
         });

     }

     function invalid_discount() {
         swal("Please select atleast one checkbox");
     }

     function dprice_alert() {
         swal("Please Enter Discounted Price");
     }

     function samealert() {
         swal("This product with same category already exists");
     }

 </script>


</asp:Content>