<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="ManageOffers.aspx.cs" Inherits="ManageOffers" %>

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
                        <asp:BoundField DataField="Name" HeaderText="Vendor" HeaderStyle-CssClass="GridHeader" />                       
                        <asp:BoundField DataField="Offername" HeaderText="Offer" HeaderStyle-CssClass="GridHeader" />
                        <asp:BoundField DataField="Description" HeaderText="Description" HeaderStyle-CssClass="GridHeader" />                   
                        <asp:BoundField DataField="Oid" HeaderText="" ItemStyle-CssClass="hidden-field" HeaderStyle-CssClass="hidden-field"></asp:BoundField>
                        
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" Text="<i class='fa fa-pencil-square-o'></i>" OnClientClick="return GetSelectedRow_Offers(this)"></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton2" style="margin-left:10%;" runat="server" Text="<i class='fa fa-trash'></i>" OnClientClick="return GetSelectedRow_Offers1(this)"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>                        
                    </Columns>
                   
                    <EmptyDataTemplate>No Record Available</EmptyDataTemplate>
                </asp:GridView>

                <asp:HiddenField ID="HiddenField_oid" ClientIDMode="Static" runat="server" Value="" />

            </div>
        </div>

</div>


<!-- Modal Add -->   
    <div id="myModalAdd" class="modal fade" role="dialog">
        <div class="modal-dialog" style="max-width:600px;">
           
            <!-- Modal content-->

            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add Offers</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <div class="form-group">
                                <asp:Label ID="Label2" runat="server" Text="Select Vendor:"></asp:Label>
                                <asp:DropDownList ID="dd_vendor" ClientIDMode="Static" runat="server" CssClass="form-control">
                                    
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" InitialValue="0" Display="Dynamic" ForeColor="red" runat="server" ControlToValidate="dd_vendor" ValidationGroup="add_submit" ErrorMessage="Please Select Vendor"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <div class="form-group">
                               <label>Offer Name:</label>
                                <asp:TextBox ID="txtbx_offername" Rows="4" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>                         
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="red" runat="server" ControlToValidate="txtbx_offername" ValidationGroup="add_submit" ErrorMessage="Please Enter Offer Name"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <div class="form-group">
                                <label>Description:</label>
                                <asp:TextBox ID="txtbx_descr" Rows="4" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="red" runat="server" ControlToValidate="txtbx_descr" ValidationGroup="add_submit" ErrorMessage="Please Enter Description"></asp:RequiredFieldValidator>
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
                    <h4 class="modal-title">Edit Offers</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body">

                     <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" Text="Select Vendor:"></asp:Label>
                                <asp:DropDownList ID="dd_vendor_upd" ClientIDMode="Static" runat="server" CssClass="form-control">
                                    
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" InitialValue="0" Display="Dynamic" ForeColor="red" runat="server" ControlToValidate="dd_vendor_upd" ValidationGroup="upd_submit" ErrorMessage="Please Select Vendor"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <div class="form-group">
                               <label>Offer Name:</label>
                                <asp:TextBox ID="txtbx_offer_upd" Rows="4" TextMode="MultiLine" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>                         
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="red" runat="server" ControlToValidate="txtbx_offer_upd" ValidationGroup="upd_submit" ErrorMessage="Please Enter Offer Name"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <div class="form-group">
                                <label>Description:</label>
                                <asp:TextBox ID="txtbx_descr_upd" Rows="4" TextMode="MultiLine" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="red" runat="server" ControlToValidate="txtbx_descr_upd" ValidationGroup="upd_submit" ErrorMessage="Please Enter Description"></asp:RequiredFieldValidator>
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
     function successalert() {

         swal({
             icon: "success",
             text: "Offer Added Successfully",
             type: "success"
         }).then(function () {
             window.location = "ManageOffers.aspx";
         });

     }

     function successalert1() {

         swal({
             icon: "success",
             text: "Offer Updated Successfully",
             type: "success"
         }).then(function () {
             window.location = "ManageOffers.aspx";
         });

     }

 </script> 

</asp:Content>
