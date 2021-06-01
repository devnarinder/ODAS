<%@ Page Title="Contact" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.vb" Inherits="doct1.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <a href="Content/">Content/</a>
    <h2> Contact Us </h2>
    <p> Enter your name and email id to query the problems  </p>
    <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
    <input type="text" placeholder ="Name" value ="" class="form-control"/><br />
        <asp:Label ID="Label2" runat="server" Text="Email id"></asp:Label>
    <input type="text" placeholder ="Email id" value ="" class="form-control"/>
       <br />
     <%--<input type="text" placeholder ="Enter your query here " class="form-control" alue ="" style="width="400" height="300";" />--%>
    <asp:TextBox ID="TextBox1"  class="form-control" placeholder="Enter your query here" height=200 width=650 runat="server" TextMode="MultiLine"></asp:TextBox>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Submit your query" class="btn btn-primary"/>
</asp:Content>
