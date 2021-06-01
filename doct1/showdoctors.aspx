<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="showdoctors.aspx.vb" Inherits="doct1.showdoctors" MasterPageFile="admin_home.Master" %>

<asp:Content ContentPlaceHolderID ="AdminContent" runat="server" >
    <br /><br />   <br /><br />
    <div id="doctor_filter" style="font-family: Consolas; background-color: #FFFFFF; border: medium groove #333333; padding: 20px;">
    <asp:DropDownList runat="server" CssClass ="form-group"  Width="194px" ID="choose_category">
               <asp:ListItem>ENT</asp:ListItem>
               <asp:ListItem>Physician</asp:ListItem>
               <asp:ListItem>Orthopediacs</asp:ListItem>
     </asp:DropDownList> 

    <asp:TextBox runat="server" ID="search_name" placeholder="Search By Name"></asp:TextBox>
        <asp:TextBox runat="server" ID="search_location" placeholder="Search By Location"></asp:TextBox>
    <asp:Button runat="server" Text="Filter" ID="filter" class="btn btn success"></asp:Button>
    <asp:Button runat ="server" Text ="Clear Filter" ID="clearfilter" class="btn btn success" /></div>
    <br /><br />
    <asp:DataGrid ID="showdoctors" runat ="server" AutoGenerateColumns ="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="false">

          <AlternatingItemStyle BackColor="White" ForeColor="#284775" />

          <Columns >
              <asp:BoundColumn HeaderText ="Doctor Name" DataField ="name"></asp:BoundColumn>
              <asp:BoundColumn HeaderText ="Mobile No." DataField ="contact_no"></asp:BoundColumn>
              <asp:BoundColumn HeaderText ="E-Mail" DataField ="emailid"></asp:BoundColumn>
              <asp:BoundColumn HeaderText ="Age" DataField ="age"></asp:BoundColumn>
              <asp:BoundColumn HeaderText ="Category" DataField ="category"></asp:BoundColumn>
              <asp:BoundColumn HeaderText ="Fees" DataField ="fee"></asp:BoundColumn>
              <asp:BoundColumn HeaderText ="Timings" DataField ="timing"></asp:BoundColumn>
              <asp:BoundColumn HeaderText ="Experience" DataField ="experience"></asp:BoundColumn>
              <asp:BoundColumn HeaderText ="Location" DataField ="Address"></asp:BoundColumn>
              <asp:BoundColumn HeaderText ="Status" DataField ="status"></asp:BoundColumn>
              
          </Columns>

          <EditItemStyle BackColor="#999999" />
          <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
          <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
          <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
          <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
          <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />

      </asp:DataGrid>

</asp:Content>