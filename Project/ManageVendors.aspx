<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="ManageVendors.aspx.cs" Inherits="ManageVendors" %>

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
                        <asp:BoundField DataField="Name" HeaderText="Name" HeaderStyle-CssClass="GridHeader" />                       
                        <asp:BoundField DataField="Type" HeaderText="Type" HeaderStyle-CssClass="GridHeader" />                       
                        <asp:BoundField DataField="Vid" HeaderText="" ItemStyle-CssClass="hidden-field" HeaderStyle-CssClass="hidden-field"></asp:BoundField>
                        
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" Text="<i class='fa fa-pencil-square-o'></i>" OnClientClick="return GetSelectedRow(this)"></asp:LinkButton>
                                 <asp:LinkButton ID="LinkButton2" style="margin-left:10%;" runat="server" Text="<i class='fa fa-trash'></i>" OnClientClick="return GetSelectedRow1(this)"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>                        
                    </Columns>
                   
                    <EmptyDataTemplate>No Record Available</EmptyDataTemplate>
                </asp:GridView>

                <asp:HiddenField ID="HiddenField_vid" ClientIDMode="Static" runat="server" Value="" />

            </div>
        </div>

</div>


<!-- Modal Add -->   
    <div id="myModalAdd" class="modal fade" role="dialog">
        <div class="modal-dialog" style="max-width:600px;">
           
            <!-- Modal content-->

            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add Vendor</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <div class="inputBox">
                                <div class="inputText">Vendor Name:</div>
                                <asp:TextBox ID="txtbx_vname" runat="server" CssClass="input"></asp:TextBox>
                               
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="red" runat="server" ControlToValidate="txtbx_vname" ValidationGroup="add_submit" ErrorMessage="Please Enter Vendor Name"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <div class="form-group">
                                <asp:Label ID="Label4" runat="server" Text="Type:"></asp:Label>
                                <asp:DropDownList ID="DropDownList_type" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="--Select Type--">--Select Type--</asp:ListItem>
                                    <asp:ListItem Value="Manufacturer">Manufacturer</asp:ListItem>
                                    <asp:ListItem Value="Distributor">Distributor</asp:ListItem>
                                    <asp:ListItem Value="Wholesaler">Wholesaler</asp:ListItem>
                                    <asp:ListItem Value="Retailer">Retailer</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" InitialValue="--Select Type--" ForeColor="red" runat="server" ControlToValidate="DropDownList_type" ValidationGroup="add_submit" ErrorMessage="Please Select Type"></asp:RequiredFieldValidator>
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
                    <h4 class="modal-title">Edit Vendor</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <div class="inputBox focus">
                                <div class="inputText">Vendor Name:</div>
                                <asp:TextBox ID="txtbx_vname_upd" ClientIDMode="Static" runat="server" CssClass="input"></asp:TextBox>                               
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="red" runat="server" ControlToValidate="txtbx_vname_upd" ValidationGroup="upd_submit" ErrorMessage="Please Enter Vendor Name"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" Text="Type:"></asp:Label>
                                <asp:DropDownList ID="dd_type_upd" ClientIDMode="Static" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="--Select Type--">--Select Type--</asp:ListItem>
                                    <asp:ListItem Value="Manufacturer">Manufacturer</asp:ListItem>
                                    <asp:ListItem Value="Distributor">Distributor</asp:ListItem>
                                    <asp:ListItem Value="Wholesaler">Wholesaler</asp:ListItem>
                                    <asp:ListItem Value="Retailer">Retailer</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" InitialValue="--Select Type--" ForeColor="red" runat="server" ControlToValidate="dd_type_upd" ValidationGroup="upd_submit" ErrorMessage="Please Select Type"></asp:RequiredFieldValidator>
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

     function same() {
         swal("This Vendor already exists");
     }



     function successalert() {

         swal({
             icon: "success",
             text: "Vendor Added Successfully",
             type: "success"
         }).then(function () {
             window.location = "ManageVendors.aspx";
         });

     }

     function successalert1() {

         swal({
             icon: "success",
             text: "Vendor Updated Successfully",
             type: "success"
         }).then(function () {
             window.location = "ManageVendors.aspx";
         });

     }

 </script>

</asp:Content>















