<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="booking.aspx.vb" Inherits="doct1.booking" %>

<asp:Content  ID="BodyContent" ContentPlaceHolderID="MainContent" runat ="server" >

     <div class="jumbotron"  style="background-color: #FFCCCC; background-image: images/image1.jpg;">
        <h2>ONLINE DOCTOR APPOINMENT
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:Label ID="loginuser" runat="server"></asp:Label>
        </h2>

         <h2 ><b> CONFIRM YOUR BOOKING.........</b></h2>
    </div>


    <div class ="row">
        
        <div class ="col-md-9">
            <div class ="jumbotron" style="background-color: #CCCCCC">
                <h2><b><u> Appointment Details</u> </b> </h2>
                <asp:Label runat="server" Text="Doctor's Name :    "></asp:Label>
                <asp:Label runat="server" ID ="d_name"></asp:Label>
                <br />
                <asp:Label runat="server" Text="Consultation Fee :  ₹"></asp:Label>
                <asp:Label runat="server" ID ="d_fee"></asp:Label>
                <br />

                <asp:Label runat="server" Text="Timing :    "></asp:Label>
                <asp:Label runat="server" ID ="d_time" ></asp:Label>
                <br />

                <asp:Label runat="server" Text="Address :    "></asp:Label>
                <asp:Label runat="server" ID ="d_address"></asp:Label>
                <br />

                <asp:Label runat="server" Text="Phone No. :    "></asp:Label>
                <asp:Label runat="server"  ID ="d_phone"></asp:Label>
                <br />

            

            
                <h2 ><b><u>Patients Details</u> </b> </h2>
                <asp:Label runat="server" Text="Patient's Name  :      "></asp:Label>
                <asp:TextBox class="form-control" runat="server" ID ="p_name" ></asp:TextBox>
                

                <asp:Label runat="server" Text="Contact No.  :      "></asp:Label>
                <asp:TextBox class="form-control" runat="server" ID ="p_contact"></asp:TextBox>
              

                <asp:Label runat="server" Text="Age  :      "></asp:Label>
                <asp:TextBox class="form-control" runat="server" ID ="p_age"></asp:TextBox>
               

                <asp:Label runat="server" Text="Briefly Describe your problem..... "></asp:Label>
                <asp:TextBox class="form-control" runat="server" ID ="p_problem" TextMode="MultiLine"></asp:TextBox>
               

           
                <br />

            
                <asp:Button runat="server" Text="Confirm " ID ="confirm_bookingxx" OnClick="confirm" CssClass ="btn btn-success"></asp:Button>
                <asp:Button runat="server" Text="Go Back" ID ="go_back" CssClass ="btn btn-danger"></asp:Button>
            </div>


        </div>
        
         <div class ="col-md-3">

        </div>


    </div>

</asp:Content>