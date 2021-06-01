<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="doctor_home.aspx.vb" Inherits="doct1.doctor_home" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    
    
<script type ="text/javascript" >
$(document).ready(function(){
	$('a[data-toggle="tab"]').on('show.bs.tab', function(e) {
		localStorage.setItem('activeTab', $(e.target).attr('href'));
	});
	var activeTab = localStorage.getItem('activeTab');
	if(activeTab){
		$('#myTab a[href="' + activeTab + '"]').tab('show');
	}
});
</script>

<%--<div class="container">--%>
    <div class ="jumbotron" style="background-color: #FFCCCC;">
  <h2>    Online Doctor Appointment System </h2> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <h4> <asp:Label ID="logindoctor" runat="server"></asp:Label></h4>
        
        <br />
  <ul class="nav nav-tabs" id ="myTab">
    <li style="font-size: x-large"><a data-toggle="tab" href="#home">Home</a></li>
    <li style="font-size: x-large"><a data-toggle="tab" href="#profile2">Profile</a></li>
    <li style="font-size: x-large"><a data-toggle="tab" href="#book">Booking Requests</a></li>
    <li style="font-size: x-large"><a data-toggle="tab" href="#c_bookings">Confirmed Bookings</a></li>
    <li style="font-size: x-large"><a data-toggle="tab" href="#feedback">Feedback</a></li>
    <li style="font-size: x-large"><a data-toggle="tab" href="#history">History</a></li>   <li style="font-size: x-large"><a data-toggle="tab" href="#resetpwd">Reset Password</a></li>
    <li style="font-size: x-large"><a data-toggle="tab" href="#logout1">LogOut</a></li>
    
  </ul>
</div> 
    <%--</div>--%> 
  <div class="tab-content">
    <div   id="home" class="tab-pane fade in active">
 
          <div class="container">
            <div class="row">
                <div class="col-md-8">
                     <h3>Quick Guide for Doctors</h3>
        <p style="font-family: 'Bahnschrift Condensed'; font-size: large ; color: #000066">
            1.On your Homepage ,Click the Booking Request tab <br />
            2.In Booking Requests tab ,you can see the request pending for confirmation by the patient <br />
            3.Click the associated Confirm button for confirming an appointment <br />
            4. In History Tab, you can see the history of the patients<br />
            5.In Profile Tab,you can see you full details <br />
            6.In Feedback Tab,Docor can also send feedback to us <br />
            7.You can logout using Logout Tab in your Homepage<br /><br />
             
        </p>
              </div>
                <div class="col-md-4">
                    <asp:Image runat="server" ID="doctor_image" Height="300" Width="300" class="img-circle"></asp:Image>
                </div>
            </div>
        </div>
        </div> 
      
      
      
      
      <div id="book" class="tab-pane fade">
   
        <h4>Click below to see New Appointment Requests..</h4>
        <asp:Button ID ="go" CssClass ="btn btn-primary" runat="server" Text="SEE.."></asp:Button>
         &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
         <asp:Button runat="server" Text="Close" ID ="close_records" CssClass ="btn btn-danger"></asp:Button>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        

        <br />
        <br />
           
        <asp:DataGrid ID="book_requests" runat ="server" AutoGenerateColumns ="False" CellPadding="4" ForeColor="#333333" GridLines="None">
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
          <Columns >
               <asp:BoundColumn HeaderText ="Booking Id" DataField ="booking_id"></asp:BoundColumn>
              <asp:BoundColumn HeaderText ="Patient Name" DataField ="patient_name"></asp:BoundColumn>
              <asp:BoundColumn HeaderText ="Mobile No." DataField ="patient_contact"></asp:BoundColumn>
              <asp:BoundColumn HeaderText ="Patient Age" DataField ="patient_age"></asp:BoundColumn>
              <asp:BoundColumn HeaderText ="Patient Problem" DataField ="patient_problem"></asp:BoundColumn>
              <asp:BoundColumn HeaderText ="Time" DataField ="time"></asp:BoundColumn>
              <asp:BoundColumn HeaderText ="Status" DataField ="status"></asp:BoundColumn>
               
              <asp:TemplateColumn HeaderText ="Confirm Appointment">
                  <ItemTemplate >
                      <asp:Button ID="book"  text="Confirm" runat ="server" ValidationGroup ="conf" />
              </ItemTemplate>
              </asp:TemplateColumn>
               <asp:TemplateColumn HeaderText ="Cancel">
                  <ItemTemplate >
                      <asp:Button ID="cancel" CommandArgument ="booking_id" text="Cancel" runat ="server" validationGroup="canc" />
              </ItemTemplate>
              </asp:TemplateColumn>
          </Columns>

      </asp:DataGrid>

    </div>
    

         <div id="c_bookings" class="tab-pane fade">
      <h3>History of Bookings</h3>

 <h4 >Click Below button to show History..</h4>
        <asp:Button runat="server" ID ="c_book_see" CssClass ="btn btn-primary" Text="SEE..."></asp:Button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button runat="server" ID ="c_book_close" CssClass ="btn btn-danger" Text="Close"></asp:Button>

        <div runat ="server" id ="c_book_div">
      <h4>Here's the list of confirmed bookings...</h4>
            <br />
       <asp:GridView runat="server" ID="c_book_gd" CellPadding="4" ForeColor="#333333" GridLines="None">
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
<div class ="col-md-8">
      <h4>Your Feedback is very Valuable to us..It will help us in improving and serving you better..</h4>
    <div runat ="server" id="feed1">
               <h4>Write your Feedback</h4>
           <asp:TextBox runat="server" ID ="feed" CssClass ="form-ontrol" TextMode="MultiLine"></asp:TextBox>
           <asp:Button runat="server" ID ="submit_feed" cssclass="btn btn-primary" Text="Submit"></asp:Button>
        </div>
    <div runat ="server" id="feed_success">
        <h4>Thanks for writing your feedback...</h4>

    </div>
   </div> 
           <div class ="row"></div>
    </div>



         <div id="profile2" class="tab-pane fade">
          
            <div class ="col-md-8">
          
             
                 <h4>Click Below to see Full Profile Details..</h4>
                 <asp:Button runat="server" CssClass ="btn btn-primary" ID ="see_details" Text="See Details"></asp:Button>
                 <asp:Button runat="server" CssClass ="btn btn-danger" ID ="hide_details" Text="Hide Details"></asp:Button>
                <div runat="server" id ="firstone">

                     <br />
                     <br />
                     <h4 >Hi...</h4>
                      <h4>   Hope you like our services</h4>
                       <h4>  We are trying our best to improve the application... </h4>
                    
                </div>


                 <div runat ="server" id ="secondone">
                     
                    <div class ="jumbotron" style="background-color: #FFCCCC;">
                      <asp:Label runat="server" Text="Name :"></asp:Label>
                      <asp:TextBox runat="server" CssClass ="form-control" ID="e_name" disabled="on"></asp:TextBox>
                     

                      <asp:Label runat="server" Text="Age :"></asp:Label>
                      <asp:TextBox runat="server" CssClass ="form-control" ID="e_age" disabled="on"></asp:TextBox>
                      

                      <asp:Label runat="server" Text="Contact No. :"></asp:Label>
                      <asp:TextBox runat="server" CssClass ="form-control" ID="e_contact" disabled="on" ></asp:TextBox>
                     

                      <asp:Label runat="server" Text="Email Id :"></asp:Label>
                      <asp:TextBox runat="server" CssClass ="form-control" ID="e_email" disabled="on" ></asp:TextBox>
                      

                      <asp:Label runat="server" Text="Address :"></asp:Label>
                      <asp:TextBox runat="server" CssClass ="form-control" ID="e_address" disabled="on" ></asp:TextBox>
                      

                      <asp:Label runat="server" Text="Gender :"></asp:Label>
                      <asp:TextBox runat="server" CssClass ="form-control" ID="e_gender" disabled="on"></asp:TextBox>
                     


<%--                      <asp:Label runat="server" Text="Fee :"></asp:Label>
                      <asp:TextBox runat="server" CssClass ="form-control" ID="e_fee" disabled="on"></asp:TextBox>
                      

                      <asp:Label runat="server" Text="Category :"></asp:Label>
                      <asp:TextBox runat="server" CssClass ="form-control" ID="e_category" disabled="on"></asp:TextBox>
                     

                      <asp:Label runat="server" Text="Experience :"></asp:Label>
                      <asp:TextBox runat="server" CssClass ="form-control" ID="e_experience" disabled="on"></asp:TextBox>
                     


                      <asp:Label runat="server" Text="Timings :"></asp:Label>
                      <asp:TextBox runat="server" CssClass ="form-control" ID="e_time" disabled="on"></asp:TextBox>
                     

                      <asp:Label runat="server" Text="Old PassWord :"></asp:Label>
                      <asp:TextBox runat="server" CssClass ="form-control" ID="e_old" disabled="on"></asp:TextBox>
                      

                      <asp:Label runat="server" Text="New Password :"></asp:Label>
                      <asp:TextBox runat="server" CssClass ="form-control" ID="e_new" disabled="on"></asp:TextBox>
                  



                      <asp:Label runat="server" Text="Confirm Password :"></asp:Label>
                      <asp:TextBox runat="server" CssClass ="form-control" ID="e_confirm" disabled="on"></asp:TextBox>
                      --%>

                    <%--<asp:Button runat="server" CssClass ="btn btn-primary" ID ="update" Text="Update.."></asp:Button>--%>

                </div> 


                 </div>


                
            </div> 

             <div class ="col-md-4">
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
                      <asp:CustomValidator runat="server" ID ="userimagevalidator" ErrorMessage="File not supported. Only .jpg or .jpeg" ControlToValidate="imgupload"  Display="Dynamic" ClientValidationFunction="user_image_validation"></asp:CustomValidator>
           <br />
           <asp:Button runat="server" CssClass ="btn btn-success" ID ="update_img" Text="Update Image"></asp:Button>
          

             </div>

         <div class ="row">

         </div>
             
         </div> 

        <div id="history" class="tab-pane fade">
      <h3>History of Bookings</h3>

 <h4 >Click Below button to show History..</h4>
        <asp:Button runat="server" ID ="history_see" CssClass ="btn btn-primary" Text="SEE..."></asp:Button>
        <asp:Button runat="server" ID ="history_close" CssClass ="btn btn-danger" Text="Close"></asp:Button>

        <div runat ="server" id ="history_div">
      <h4>Here's your booking history...</h4>
            <br />
       <asp:GridView runat="server" ID="history_book" CellPadding="4" ForeColor="#333333" GridLines="None">
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


      <div id="resetpwd" class="tab-pane fade">
          <asp:Label runat="server" Text="Old Password"></asp:Label>
           <asp:TextBox runat="server" placeholder="Enter Old Password" CssClass="form-control" ID="oldpwd"></asp:TextBox>
           <asp:Label runat="server" Text="New Password"></asp:Label>
           <asp:TextBox runat="server" placeholder="Enter New Password" CssClass="form-control" ID="newpwd"></asp:TextBox>
           <asp:Button runat="server" Text="Reset Password" ID="rpwd" OnClick ="rpwd_Click"></asp:Button>
    </div>

          <div id="logout1" class="tab-pane fade">
      <h3>On the Edge to logout..</h3>
      <p>Are you sure you want to logout..</p>
           <br />
           <br />
    <asp:Button runat="server" ID ="logyes" CssClass ="btn btn-primary" Text="YES"></asp:Button> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <asp:Button runat="server" ID ="logno" CssClass ="btn btn-primary" Text="NO"></asp:Button>
    </div></div> 
</asp:Content>