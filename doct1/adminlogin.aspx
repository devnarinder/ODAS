<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="adminlogin.aspx.vb" Inherits="doct1.adminlogin" MasterPageFile="Site.Master" %>

<asp:Content  ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" >
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4"><br /><br /><br />
             <div id="adminform" style="padding: inherit; border-style: outset; font-family: Verdana, Geneva, Tahoma, sans-serif; font-size: x-large; background-color: #FFFFFF; color: #CC0099; float: none;">
        
                 <label for="" style="text-align: center">Admin Login</label>
        <asp:TextBox runat="server" ID="username" CssClass ="form-control" placeholder="Enter Username"></asp:TextBox><br />
        <asp:TextBox runat="server" ID="pwd" CssClass ="form-control" placeholder="Enter password" TextMode="Password"></asp:TextBox><br />
        <asp:Button runat="server" Text="Login" CssClass ="btn btn-success " ID="submit"  ></asp:Button><br /><br />
    </div>
        </div>
        <div class="col-md-4"></div>
    </div>
   
</asp:Content>
