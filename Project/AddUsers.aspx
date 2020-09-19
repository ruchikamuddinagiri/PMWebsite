<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="AddUsers.aspx.cs" Inherits="AddUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="container top-content">
        <div class="row">
            <div class="col-md-8 mb-5 mx-auto">
                <div class="card">
                    <div class="card-header"><b>Add User</b></div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12 col-lg-12">
                                <label>Name: </label>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                    </div>
                                    <asp:TextBox ID="txtbx_name" runat="server" CssClass="form-control txtOnly" placeholder="Enter Name"></asp:TextBox>
                                    
                                </div>
                                <asp:RequiredFieldValidator ValidationExpression="^[a-zA-Z]+$" ID="RequiredFieldValidator1" ForeColor="red" runat="server" ControlToValidate="txtbx_name" ValidationGroup="add_submit" ErrorMessage="Please Enter Name"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 col-lg-12">
                                <label>Email: </label>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                    </div>
                                    <asp:TextBox ID="txtbx_email" runat="server" CssClass="form-control" placeholder="Enter Email"></asp:TextBox>
                                    
                                </div>
                                <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator2" ForeColor="red" runat="server" ControlToValidate="txtbx_email" ValidationGroup="add_submit" ErrorMessage="Please Enter Email"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtbx_email"
                                        ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                        Display="Dynamic" SetFocusOnError="true" ErrorMessage="Invalid Email" />

                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 col-lg-12">
                                <label>Contact: </label>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-phone" aria-hidden="true"></i></span>
                                    </div>
                                    <asp:TextBox ID="txtbx_contact" runat="server" CssClass="form-control mob" placeholder="Enter Contact"></asp:TextBox>
                                 
                                </div>
                                <asp:RequiredFieldValidator Display="Dynamic" ValidationExpression="^[7-9][0-9]{9}$" ID="RequiredFieldValidator3" ForeColor="red" runat="server" ControlToValidate="txtbx_contact" ValidationGroup="add_submit" ErrorMessage="Please Enter Contact No."></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                        ControlToValidate="txtbx_contact" Display="Dynamic" ForeColor="red" SetFocusOnError="true" ErrorMessage="Invalid Contact No."
                                        ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                    <span id="errmsg" style="color: red;"></span>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 col-lg-12">
                                <label>Password: </label>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                    </div>

                                    <asp:TextBox ID="txtbx_password" TextMode="Password" runat="server" CssClass="form-control" placeholder="Enter Password"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="red" runat="server" ControlToValidate="txtbx_password" ValidationGroup="add_submit" ErrorMessage="Please Enter Password"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ValidationGroup="add_submit" ForeColor="red" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Password must be 8 characters and have both letters and numbers."
                                        ValidationExpression="(?=.{8,})[a-zA-Z]+[^a-zA-Z]+|[^a-zA-Z]+[a-zA-Z]"
                                        ControlToValidate="txtbx_password"></asp:RegularExpressionValidator>
                            </div>
                        </div>

                    </div>

                    <div class="card-footer text-center">
                        <asp:Button ID="Btn_submit" runat="server" Text="Submit" CssClass="btn btn-info" ValidationGroup="add_submit" OnClick="Btn_submit_Click" />
                    </div>

                </div>

            </div>
        </div>
    </div>

    
    <script>

        $(document).ready(function () {

            
        });


        function emailexists() {
            swal("This Email already exists");
        }


        function successalert() {

            swal({
                icon: "success",
                text: "User Added Successfully",
                type: "success"
            }).then(function () {
                window.location = "ViewUsers.aspx";
            });

        }

    </script>


</asp:Content>