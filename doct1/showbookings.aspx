<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile ="~/admin_home.Master"  CodeBehind="showbookings.aspx.vb" Inherits="doct1.showbookings" %>

<asp:Content ContentPlaceHolderID ="AdminContent" runat="server" >
    <br /><br />   <br /><br />
     <div id="doctor_filter" style="font-family: Consolas; border: medium groove #333333; padding: 20px;">
     
         <asp:TextBox runat="server" ID="search_patientname" placeholder="Search By Patient Name"></asp:TextBox>
         <asp:DropDownList runat="server" CssClass ="form-group"  Width="194px" ID="search_status">
               <asp:ListItem>Success</asp:ListItem>
               <asp:ListItem>Pending</asp:ListItem>
               <asp:ListItem>Cancelled</asp:ListItem>
     </asp:DropDownList> 
  
    <asp:Button runat="server" Text="Filter" ID="filter" class="btn btn success"></asp:Button>
    <asp:Button runat ="server" Text ="Clear Filter" ID="clearfilter" class="btn btn success" />
    <br /><br />
    &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp <asp:Label runat="server" Text="OR" ></asp:Label><br />
     <asp:TextBox runat="server" ID="search_bookingid" placeholder="Search By Booking id"></asp:TextBox>
    <asp:Button runat="server" Text="Filter" ID="filter2" class="btn btn success"></asp:Button>
    <asp:Button runat ="server" Text ="Clear Filter" ID="clearfilter2" class="btn btn success" /></div>
<br /><br />
     <asp:DataGrid ID="showbookings" runat ="server" AutoGenerateColumns ="False" CellPadding="4" ForeColor="#333333" GridLines="None" >

          <AlternatingItemStyle BackColor="White" ForeColor="#284775" />

          <Columns >
               <asp:BoundColumn HeaderText ="Booking id" DataField ="booking_id"></asp:BoundColumn>
              <asp:BoundColumn HeaderText ="Patient Name" DataField ="patient_name"></asp:BoundColumn>
              <asp:BoundColumn HeaderText ="Patient Email" DataField ="patient_email"></asp:BoundColumn>
              <asp:BoundColumn HeaderText ="Patient Age" DataField ="patient_age"></asp:BoundColumn>
              <asp:BoundColumn HeaderText ="Patient Contact No." DataField ="patient_contact"></asp:BoundColumn>
              <asp:BoundColumn HeaderText ="Patient Problem" DataField ="patient_problem"></asp:BoundColumn>
              <asp:BoundColumn HeaderText ="Doctor Emailid " DataField ="doctor_email"></asp:BoundColumn>
              <asp:BoundColumn HeaderText ="Timing" DataField ="time"></asp:BoundColumn>
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
