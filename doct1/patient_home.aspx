<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="patient_home.aspx.vb" Inherits="doct1.patient_home" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script type ="text/javascript" >
   var count =0
       
        $(document).ready(function () {
            $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
                localStorage.setItem('activeTab', $(e.target).attr('href'));
            });
            var activeTab = localStorage.getItem('activeTab');
            if (activeTab) {
                $('#myTab a[href="' + activeTab + '"]').tab('show');
            }
        });

      
        $('logno').on('click', function (evt) {

    $('home').triggerHandler('click');
    evt.preventDefault();
  });
</script>

   
    
<div class="container">
    <div class ="jumbotron"  style="background-color: #FFCCCC; ">
  <h2>    Online Doctor Appointment&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <asp:Label ID="loginuser" runat="server"></asp:Label>
        </h2> &nbsp &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
      
     
        <br />
  <ul class="nav nav-tabs" id ="myTab">
    <li class="active" style="font-size: x-large"><a data-toggle="tab" href="#home">Home</a></li>
       <li style="font-size: x-large"><a data-toggle="tab" href="#profile1">Profile</a></li>
    <li style="font-size: x-large"><a data-toggle="tab" href="#book">Book</a></li>
    <li style="font-size: x-large"><a data-toggle="tab" href="#track">Track</a></li>
    <li style="font-size: x-large"><a data-toggle="tab" href="#history">History</a></li>
    <li style="font-size: x-large"><a data-toggle="tab" href="#feedback">Feedback</a></li>
    <li style="font-size: x-large"><a data-toggle="tab" href="#resetpwd">Reset Password</a></li>
   
    <li style="font-size: x-large"><a data-toggle="tab" href="#logout">LogOut</a></li>
  </ul>
</div> 
  <div class="tab-content">
    <div  id="home" class="tab-pane fade in active">
       
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                     <h3>Quick Guide to Book a Doctor</h3>
        <p style="font-family: 'Bahnschrift Condensed'; font-size: large ; color: #000066">
            1.On your Homepage ,Click the Book tab <br />
            2.Here You can Search Nearby Doctors By Choosing Category and Location.<br />
            3.After Entering Category and Location, Click on Proceed <br />
            4. You will see the list of Doctors avalilable for consultation<br />
            5.Choose the Doctor and select Timings <br />
            6.Click Book to Submit your appointment<br />
            7.After that,you will get a Bookingid, which can be further used to verify patient, track the booking.<br /><br />
             
        </p>
        <p style="font-size: large; color: #FF0000">Note: Fees Payable to doctor After Consultation</p>
    
                </div>
                <div class="col-md-4">
                    <asp:Image runat="server" ID="user_image" Height="300" Width="300" class="img-circle"></asp:Image>
                </div>
            </div>
        </div>
       </div>

    <div id="book" class="tab-pane fade">
      
     <asp:DropDownList runat="server" CssClass ="form-control"  Width="194px" ID="choose_category">
               <asp:ListItem>ENT</asp:ListItem>
               <asp:ListItem>Physician</asp:ListItem>
               <asp:ListItem>Orthopediacs</asp:ListItem>
     </asp:DropDownList> 
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;

          <asp:DropDownList runat="server" CssClass ="form-control"  Width="194px" ID="choose_location">
               <asp:ListItem>Gandhi Nagar</asp:ListItem>
               <asp:ListItem>Shahtri Nagar</asp:ListItem>
               <asp:ListItem>Jeevan Nagar</asp:ListItem>
               <asp:ListItem>Nanak Nagar</asp:ListItem>
               <asp:ListItem>Janipur</asp:ListItem>
               <asp:ListItem>RS Pura</asp:ListItem>
               <asp:ListItem>Shakti Nagar</asp:ListItem> 
               <asp:ListItem>Digiana</asp:ListItem>
           </asp:DropDownList> 
        <br />
        <asp:Button runat="server" Text="Proceed" ID ="proceed" CssClass ="btn btn-success"></asp:Button>
         &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
         <asp:Button runat="server" Text="Close" ID ="close" CssClass ="btn btn-danger"></asp:Button>

                 <br />
        <br />
        <br />


        <asp:DataGrid ID="gd1" runat ="server" AutoGenerateColumns ="False"  CellPadding="4" ForeColor="#333333" GridLines="None">

            
        
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        

          <Columns >
              <asp:BoundColumn HeaderText ="Doctor Name" DataField ="name"></asp:BoundColumn>
              <asp:BoundColumn HeaderText ="Emailid" DataField ="emailid"></asp:BoundColumn>
               <asp:BoundColumn HeaderText ="Mobile No." DataField ="contact_no"></asp:BoundColumn>
           
              <asp:BoundColumn HeaderText ="Category" DataField ="category"></asp:BoundColumn>
              <asp:BoundColumn HeaderText ="Fees" DataField ="fee"></asp:BoundColumn>
              <asp:BoundColumn HeaderText ="Timings" DataField ="timing"></asp:BoundColumn>
              <asp:BoundColumn HeaderText ="Experience" DataField ="experience"></asp:BoundColumn>
              <asp:BoundColumn HeaderText ="Location" DataField ="Address"></asp:BoundColumn>

              <asp:TemplateColumn HeaderText ="Book">
                  <ItemTemplate >
                      <asp:Button ID="book" CssClass ="btn btn-primary" text="Book Now" runat ="server" onclick="book_click"/>
              </ItemTemplate>
              </asp:TemplateColumn>
          </Columns>

      </asp:DataGrid>
        
      

    </div>




    <div id="track" class="tab-pane fade">
      <h3>Track your Booking Appointment status...</h3>
     <h4>Enter the Booking ID</h4>
        <div class ="row">
            <div class="col-md-2">
        <asp:TextBox runat="server" ID ="track_id" type="number" CssClass ="form-control"></asp:TextBox>
            </div> 
        <div class="col-md-2">
       <asp:Button runat="server" ID ="track_button" CssClass ="btn btn success" Text="Track"></asp:Button>
      <%-- <asp:Button runat="server" ID ="t_close" CssClass ="btn btn success" OnClick ="hide_track" Text="Close"></asp:Button>--%>
          <asp:Button runat="server" CssClass ="btn btn-danger" ID ="t_close" Text="Close"></asp:Button>
            </div> 
            </div> 
<br />
<br />
        <div runat ="server"  class ="container" id="track_data">
            <div class ="col-md-8">
             <div class ="jumbotron"  style="background-color: #FFCCCC; ">
            <h2 >Booking Details</h2>
            <br />
            
            <asp:Label runat="server"  Text="Status" Font-Size="X-Large" Font-Bold="True" Font-Names="Bauhaus 93"></asp:Label>
            <asp:Label runat="server" ID ="t_status" Font-Size="X-Large" ForeColor="#003366"></asp:Label>

           <br />
          
         
            <asp:Label runat="server"  Text="Patient Name :" Font-Size="Large" Font-Bold="True" Font-Names="Bauhaus 93"></asp:Label>
            <asp:Label runat="server" ID ="t_name" Font-Size="Large" ForeColor="#003366"></asp:Label>
            <br />
            <asp:Label runat="server"  Text="Patient Age :" Font-Size="Large" Font-Bold="True" Font-Names="Bauhaus 93"></asp:Label>
             <asp:Label runat="server" ID ="t_age" Font-Size="Large" ForeColor="#003366" ></asp:Label>
            <br />
            <asp:Label runat="server"  Text="Contact No : " Font-Size="Large" Font-Bold="True" Font-Names="Bauhaus 93"></asp:Label>
             <asp:Label runat="server" ID="t_contact" Font-Size="Large" ForeColor="#003366"></asp:Label>
            <br />
            <asp:Label runat="server"  Text="Problem" Font-Size="Large" Font-Bold="True" Font-Names="Bauhaus 93"></asp:Label>
             <asp:Label runat="server" ID ="t_problem" Font-Size="Large" ForeColor="#003366"></asp:Label>
            <br />
            <asp:Label runat="server"  Text="Doctor's Name :" Font-Size="Large" Font-Bold="True" Font-Names="Bauhaus 93"></asp:Label>
             <asp:Label runat="server" ID ="t_dname" Font-Size="Large" ForeColor="#003366" ></asp:Label>
            <br />
            <asp:Label runat="server"  Text="Appointment Address :" Font-Size="Large" Font-Bold="True" Font-Names="Bauhaus 93"></asp:Label>
             <asp:Label runat="server" ID ="t_address" Font-Size="Large" ForeColor="#003366"></asp:Label>
            <br />
            <asp:Label runat="server" Text="Date  :" Font-Size="Large" Font-Bold="True" Font-Names="Bauhaus 93"></asp:Label>
             <asp:Label runat="server"  ID="t_date" Font-Size="Large" ForeColor="#003366"></asp:Label>
            <br />
            <asp:Label runat="server"  Text="Time  :" Font-Size="Large" Font-Bold="True" Font-Names="Bauhaus 93"></asp:Label>
             <asp:Label runat="server" ID ="t_time" Font-Size="Large" ForeColor="#003366"></asp:Label>
            <br />
            <br />
            <asp:Button runat="server" ID ="t_cancel" CssClass ="btn btn-danger" Text="Cancel Appointmrnt"></asp:Button>
                 </div> 
        </div>
            </div> 
        
        <div runat ="server" id="not_found">

            <p class ="text-danger" style="font-size: x-large">Entered Booking Id doesn't have any bookings ...

            </p>
        </div>

        <div runat ="server" id="cancelledbooking">
            <h1>Booking Cancelled....</h1>
        </div>
        


    </div>


    <div id="history" class="tab-pane fade">
        <h3>Click Below button to show History..</h3>
        <asp:Button runat="server" ID ="history_see" CssClass ="btn btn-primary" Text="SEE..."></asp:Button>
        <asp:Button runat="server" ID ="history_close" CssClass ="btn btn-danger" Text="Close"></asp:Button>

        <div runat ="server" id ="history_div">
      <h3>Here's your booking history...</h3>
            <br />
        <asp:GridView runat="server" ID ="history_book" CellPadding="4" ForeColor="#333333" GridLines="None">

         <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
       </asp:GridView> 
        </div>

      
    </div>
       <div id="feedback" class="tab-pane fade">
           <div runat ="server" ID="fedfocus" class ="container">
<div class ="col-md-8">
      <h3>Your Feedback is very Valuable to us..It will help us in improving and serving you better..</h3>
    <div runat ="server" id="feed1">
               <h3>Write your Feedback</h3>
           <asp:TextBox runat="server" ID ="feed" CssClass ="form-ontrol" TextMode="MultiLine"></asp:TextBox>
           <asp:Button runat="server" CssClass ="btn btn-primary" ID ="submit_feed"  Text="Submit"></asp:Button>
        </div>
    <div runat ="server" id="feed_success">
        <h4>Thanks for writing your feedback...</h4>

    </div>
   </div> 
    </div>
           </div> 


       <div id="resetpwd" class="tab-pane fade">
          <asp:Label runat="server" Text="Old Password"></asp:Label>
           <asp:TextBox runat="server" placeholder="Enter Old Password" CssClass="form-control" ID="oldpwd"></asp:TextBox>
           <br />
           <asp:Label runat="server" Text="New Password"></asp:Label>
           <asp:TextBox runat="server" placeholder="Enter New Password" CssClass="form-control" ID="newpwd"></asp:TextBox>
           <br />

           <asp:Button runat="server" CssClass ="btn btn-primary" Text="Reset Password" ID="rpwd" OnClick ="rpwd_Click"></asp:Button>
    </div>


      
       <div  id="profile1" class="tab-pane fade">
             <div class ="col-md-8">
                 
                 <div runat ="server" id="firstone">
                 <h3>Click Below to see Full Profile Details..</h3>
                 <asp:Button runat="server" CssClass ="btn btn-primary" ID ="see_details" Text="See Details"></asp:Button>
                 <asp:Button runat="server" CssClass ="btn btn-danger" ID ="hide_details" Text="Hide Details"></asp:Button>
                 </div> 
                 <div runat ="server" id ="thirdone">
                     <br />
                     <br />
                     <h4 >Hi...</h4>
                      <h4>   Hope you like our services</h4>
                       <h4>  We are trying our best to improve the application... </h4>
                    
                 </div>
                 <div runat ="server" id ="secondone">
              <div class ="jumbotron" style="background-color: #CCCCCC">
                  
                      <asp:Label runat="server"  Text="Name :"></asp:Label>
                      <asp:TextBox runat="server" CssClass ="form-control" ID="e_name" disabled="on"></asp:TextBox>
                      

                      <asp:Label runat="server"  Text="Age :"></asp:Label>
                      <asp:TextBox runat="server" CssClass ="form-control" ID="e_age" disabled="on"></asp:TextBox>
                     

                      <asp:Label runat="server" Text="Contact No. :"></asp:Label>
                      <asp:TextBox runat="server" CssClass ="form-control" ID="e_contact" disabled="on" ></asp:TextBox>
                     

                      <asp:Label runat="server" Text="Email Id :"></asp:Label>
                      <asp:TextBox runat="server" CssClass ="form-control" ID="e_email" disabled="on"></asp:TextBox>
                    

                      <asp:Label runat="server" Text="Address :"></asp:Label>
                      <asp:TextBox runat="server" CssClass ="form-control" ID="e_address" disabled="on"></asp:TextBox>
                     

                      <asp:Label runat="server" Text="Gender :"></asp:Label>
                      <asp:TextBox runat="server" CssClass ="form-control" ID="e_gender" disabled="on"></asp:TextBox>
                     

<%--                      <asp:Label runat="server" Text="Old PassWord :"></asp:Label>
                      <asp:TextBox runat="server" CssClass ="form-control" ID="e_old" disabled="on"></asp:TextBox>
                      <asp:CustomValidator runat="server" ErrorMessage="Old Password doesn't match " Display="Dynamic" ControlToValidate="e_old" ClientValidationFunction="old_password_validation"></asp:CustomValidator>

                      <asp:Label runat="server" Text="New Password :"></asp:Label>
                      <asp:TextBox runat="server" TextMode="Password" CssClass ="form-control" ID="e_new" disabled="on"></asp:TextBox>
                     


                      <asp:Label runat="server" Text="Confirm Password :"></asp:Label>
                      <asp:TextBox runat="server" TextMode="Password" CssClass ="form-control" ID="e_confirm" disabled="on"></asp:TextBox>
                     <asp:CompareValidator runat="server" ErrorMessage="The password and confirmation password do not match." ControlToCompare="e_new" ControlToValidate="e_confirm" Display="Dynamic" CssClass="text-danger"></asp:CompareValidator>
     


                    <asp:Button runat="server" ID ="update" CssClass ="btn btn-primary" Text="Update.."></asp:Button>--%>

                   

                 </div> 


                 </div>



            </div> 

             <div class ="col-md-4">

           
                 <br />
                 <br />
                 <br />
                 <br />
                 <br />
                 <br />
                  <asp:Image runat="server" ID="profile_image" Height="300" Width="300"  class="img-circle"></asp:Image>
                 <br />
               
                 <br />

         <asp:Label runat="server" CssClass ="label label-primary" Text="Change profile Picture" Font-Size="Larger"></asp:Label>
               <br />
                 <br />
           <asp:FileUpload runat="server" ID ="imgupload"  OnChange="abcd" ></asp:FileUpload>
                      <asp:CustomValidator runat="server" ID ="userimagevalidator" ErrorMessage="File not supported. Only .jpg or .jpeg" ControlToValidate="imgupload" onservervalidate="user_image_validation" Display="Dynamic"></asp:CustomValidator>
         <asp:Label runat="server" Text="Invalid file" CssClass ="text-danger" ID ="invalid_image"></asp:Label>
                   <br />
              <asp:Button runat="server" CssClass ="btn btn-success" ID ="update_img" Text="Update Image"></asp:Button>
          

             </div>


    </div>


       <div id="logout" class="tab-pane fade">
      <h3>On the Edge to logout..</h3>
      <p>Are you sure you want to logout..</p>
           <br />
           <br />
    <asp:Button runat="server" ID ="logyes" CssClass ="btn btn-primary" Text="YES"></asp:Button> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <asp:Button runat="server" ID ="logno" href="#book" CssClass ="btn btn-primary" Text="NO"></asp:Button>
    </div>
  </div>
</div>



     <!-- Modal -->
    <div runat ="server" id ="manu">
  <div   class="modal fade" id="modal_feedback" role="dialog" style="font-family: 'Berlin Sans FB'; font-size: large; font-style: normal; color: #FF66CC; background-image: url('http://localhost:1753/images/image1.jpg');background-size:cover;  background-repeat: no-repeat;">
    <div class="modal-dialog" >
    
      <!-- Modal content-->
      <div class="modal-content" >
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h2 class="modal-title">FEEDBACK....</h2>
        </div>
        <div class="modal-body">
           <h1>FeedBack Submitted Succesfully...</h1>
        </div>
        <div class="modal-footer">
           
            <asp:Button runat="server" Text="Close" data-dismiss="modal" class="btn btn-default"></asp:Button>
        </div>
            <br />
        </div>
       </div>
    </div>
        </div> 
          <%--  modal end--%>
</asp:Content>