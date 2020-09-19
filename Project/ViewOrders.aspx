<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="ViewOrders.aspx.cs" Inherits="ViewOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


     <div class="container top-content">

        <div class="row">
            <div class="col-md-8 col-lg-8">
                <asp:Panel ID="Panel_search" runat="server">
                    <div class="input-group" style="width: 60%;">
                        <asp:TextBox ID="search_name" runat="server" autocomplete="off"  CssClass="form-control" placeholder="Search Product Name/ Order Id"></asp:TextBox>
                        <div class="input-group-btn">
                            <button class="btn btn-primary" id="btn_search" type="submit" runat="server" onserverclick="btn_search_ServerClick">
                                <i class="fa fa-search" aria-hidden="true" style="font-size: 17px;"></i>
                            </button>
                        </div>
                    </div>
                </asp:Panel>
            </div>
           
        </div>

        <div class="row mt-3">
            <div class="col-md-12 col-lg-12 text-center">
                <asp:GridView ID="GridView1" Width="100%" ShowHeaderWhenEmpty="true" runat="server" CssClass="table table-striped table-bordered table-hover table-fixed" AutoGenerateColumns="False">
                    <Columns> 
                        <asp:BoundField DataField="orderid" HeaderText="Order Id" HeaderStyle-CssClass="GridHeader" />                                         
                        <asp:BoundField DataField="username" HeaderText="User" HeaderStyle-CssClass="GridHeader" />                                         
                        <asp:BoundField DataField="name" HeaderText="Product Name" HeaderStyle-CssClass="GridHeader" /> 
                        <asp:BoundField DataField="Cat" HeaderText="Category" HeaderStyle-CssClass="GridHeader" />                  
                        <asp:BoundField DataField="Price" HeaderText="Price" HeaderStyle-CssClass="GridHeader" /> 
                         <asp:BoundField DataField="Qty" HeaderText="Quantity" HeaderStyle-CssClass="GridHeader" />
                        <asp:BoundField DataField="totprice" HeaderText="Total Price" HeaderStyle-CssClass="GridHeader" />                                     
                        <asp:BoundField DataField="Date" HeaderText="Date" HeaderStyle-CssClass="GridHeader" /> 
                        <asp:BoundField DataField="Time" HeaderText="Time" HeaderStyle-CssClass="GridHeader" />                                                                                                              
                    </Columns>
                   
                    <EmptyDataTemplate>No Record Available</EmptyDataTemplate>
                </asp:GridView>

            </div>
        </div>

</div>



</asp:Content>