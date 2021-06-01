<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation ="false"  CodeBehind="Default.aspx.vb" Inherits="doct1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   
     <script type="text/javascript">

        function disablekeyboard(e)
        {
            return false
        }
        function numberonly(e)
        {
            var unicode = e.charCode
            if (unicode != 8) {
                if (unicode > 47 && unicode < 58) {
                    return true

                }
                    else
                    return false
            }
        }

        function validate_text(e) {
            var x = e.key;

            if (((x >= 'a') && (x <= 'z')) || ((x >= 'A') && (x <= 'Z')) || (x == ' '))
                return true;
            else {

                return false;
            }
        }

        function validate_number(e) {
            var x = e.key;

            if ((x >= '0') && (x <= '9') || (x == 'Backspace'))
                return true;
            else {

                return false;
            }

        }

        function validate_contactno(e) {
            var x = (textbox2.text).length;
            alert(x);
        }


    </script>
    <div  >

     <div class="jumbotron"  style="background-color: #FFCCCC; background-image: images/image1.jpg;">
        <h1>Get Your Doctor Consultation Appointment</h1>
        <p class="lead">You can Search for doctors in your area, book a consultation appointment</p>
        <button id="book_now"  class="btn btn-primary btn-lg" data-toggle="modal" data-target="#modal_user_login">Book Now &raquo;</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:Button ID="availdoctors" runat="server" text="Available Doctors" CssClass="btn btn-primary btn-lg" href="checkdoctors.aspx" onclick="avail" CausesValidation="True" ValidationGroup="avail" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
         <%--<asp:TextBox id="tb1" CssClass ="form-control" runat="server" ></asp:TextBox>--%>
         
    </div>
 
    <div class="row">
        <div class="col-md-4">
            <h3 style="font-weight: bold">Signup\Login as a Doctor</h3>
            <p>
                Sign up today to explore the new upcomings in your professions
            </p>
            <p><br />
                <button class="btn btn-danger"  data-toggle="modal" data-target="#modal_doctor_signup">Sign Up </button>
                 <button class ="btn btn-primary"  data-toggle="modal" data-target="#modal_doctor_login">Log In</button>
            </p>
        </div>
        <div class="col-md-4">
            <h3 style="font-weight: bold">SignUp\Login as User</h3>
            <p>
                Search about various diseases,connect to doctors through online chat and video conferencing and explore the ease of making a appointment with doctor
            </p>
        <%-- <button class="btn btn-danger" data-toggle="modal" data-target="#modal_user_signup">Sign Up </button>  --%>
            <asp:Button ID="Button1" runat="server" Text="Sign up" class="btn btn-danger" data-toggle="modal" data-target="#modal_user_signup" />
         <%--    <button class ="btn btn-primary"  data-toggle="modal" data-target="#modal_user_login">Log In</button>--%>
           <asp:Button ID="Button2" runat="server" Text="Login" class="btn btn-primary" data-toggle="modal" data-target="#modal_user_login" />
          
            </div>
        <div class="col-md-4">

            <div class="container">
  <%--<h2>Carousel Example</h2>--%>  
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="images/image1.jpg" alt="" style="width:100%;">
      </div>

      <div class="item">
        <img src="images/image2.jpg" alt="" style="width:100%;">
      </div>
    
      <div class="item">
        <img src="images/image3.jpg" alt="" style="width:100%;">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

        </div>
  <!-- Modal -->
  <div   class="modal fade" id="modal_user_login" role="dialog" style="font-family: 'Berlin Sans FB'; font-size: large; font-style: normal; color: #FF66CC; background-image: url('http://localhost:1753/images/image1.jpg');background-size:cover;  background-repeat: no-repeat;">
    <div class="modal-dialog" >
    
      <!-- Modal content-->
      <div class="modal-content" >
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">LOG IN....</h4>
        </div>
        <div class="modal-body">
             <asp:Label ID ="login_warning_user" CssClass ="text-danger" runat="server" Text=""></asp:Label>
        <asp:TextBox runat="server" CssClass="form-control" placeholder="Enter Email id" ID="user_login_id" ValidationGroup="user_login_controls"></asp:TextBox>
        <br />
         <asp:TextBox runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password" ID="user_login_password" ValidationGroup="user_login_controls"></asp:TextBox> 
            
        </div>
        <div class="modal-footer">
            <asp:Button runat="server" Text="Login "  ValidationGroup="user_login_controls" CssClass="btn btn-success" ID="userlogin"></asp:Button>
            <asp:Button runat="server" Text="Close" data-dismiss="modal" class="btn btn-default"></asp:Button>
        </div>
            <br />
        </div>
       </div>
    </div>
          <%--  modal end--%>
            <!-- Modal -->
  <div class="modal fade" id="modal_user_signup" role="dialog" style="background-color: #00CCFF">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
            <br />
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="font-family: 'Century Gothic'">Hey..Dear user fill your details and explore the new way</h4>
        </div>
        <div class="modal-body">
         
    <div class="row">
        <div class="col-md-7">
            <%--<h2 class="heading">Patient Registeration Form</h2>--%>
            
           <div class="form-group">
               <label for ="Name">Name </label>
               <%--<input id="u_name" name="u_name" type="text" placeholder ="Name " class="form-control" required/><br />--%>
               <asp:TextBox type="text" ID ="u_name" class="form-control" MaxLength ="30" placeholder="Name" runat="server" ValidationGroup="aa" ></asp:TextBox><br />
               <asp:RequiredFieldValidator runat="server" ErrorMessage="This Field is requied" ControlToValidate="u_name" CssClass="text-danger"></asp:RequiredFieldValidator>
               <br />
               <label for ="">Email id  </label>
               <%--<input id="u_email"type="email" placeholder ="Email id  " class="form-control" required  /><br />--%>
                <asp:TextBox type="email" ID ="u_email" ValidationGroup="aa" class="form-control" MaxLength ="30" placeholder="Email" runat="server" AutoPostBack="True"></asp:TextBox><br />
              <asp:RequiredFieldValidator runat="server" ErrorMessage="This Field is requied" ControlToValidate="u_email" CssClass="text-danger"></asp:RequiredFieldValidator>
               <br />
              
                <label for ="">Contact No. </label>
               <%--<input id="u_contact_no1" type="text" placeholder ="Contact No. " maxlength ="10" class="form-control" required/><br />--%>
                <asp:TextBox  ID ="u_contact_no" ValidationGroup="aa" onkeypress="return  validate_number(event)" class="form-control" maxlength="10"  placeholder="Contact No." runat="server" ></asp:TextBox><br />
               <asp:RequiredFieldValidator runat="server" ErrorMessage="This Field is requied" ControlToValidate="u_contact_no" CssClass="text-danger"></asp:RequiredFieldValidator>
               <br />
              
                <label for ="">Age </label>
               <%--<input id="u_age" type="text" placeholder ="Age " class="form-control" required  /><br />--%>
                <asp:TextBox  type="text" ID ="u_age" ValidationGroup="aa" MaxLength ="3" class="form-control" onkeypress="return  validate_number(event)" placeholder="Age" runat="server" ></asp:TextBox><br />
         <asp:RequiredFieldValidator runat="server" ErrorMessage="This Field is requied" ControlToValidate="u_age" CssClass="text-danger"></asp:RequiredFieldValidator>
               <asp:RangeValidator runat="server" ErrorMessage="Age must be greater than 18 and less than 100 " ControlToValidate="u_age" Display="Dynamic" CssClass="text-danger" Type="Integer" MinimumValue="19" MaximumValue="100"></asp:RangeValidator>
          
                  <br />
                 <label for ="">Gender</label>
               <asp:RadioButtonList ID="u_gender" runat="server" ValidationGroup="aa" >
                   <asp:ListItem Selected="True" >Male</asp:ListItem>
                   <asp:ListItem>Female</asp:ListItem>
               </asp:RadioButtonList>
               <br />
                <asp:RequiredFieldValidator runat="server" ErrorMessage="This Field is requied" ControlToValidate="u_gender" CssClass="text-danger"></asp:RequiredFieldValidator>
               <br />
              

               <label for ="">Address </label>
               <%--<input id="u_address" type="text" placeholder ="Enter your complete Address" class="form-control" required/><br />--%>
                <asp:TextBox type="text" ValidationGroup="aa" ID ="u_address" class="form-control" placeholder="Address" runat="server" ></asp:TextBox><br />
                <asp:RequiredFieldValidator runat="server" ErrorMessage="This Field is requied" ControlToValidate="u_address" CssClass="text-danger"></asp:RequiredFieldValidator>
               <br />
              

                 <label for ="">Upload your image..</label> <br />
                <asp:FileUpload runat="server" id="user_image_upload" ></asp:FileUpload>
               <asp:CustomValidator runat="server" ID ="userimagevalidator" ErrorMessage="File not supported. Only .jpg or .jpeg" ControlToValidate="user_image_upload" onservervalidate="user_image_validation" Display="Dynamic"></asp:CustomValidator>
               
               <label for ="">Password </label>
               <%--<input id="u_password" type="password" placeholder ="Enter password" class="form-control" value="" required/><br />--%>
                <asp:TextBox type="password" ID ="u_password" ValidationGroup="aa"  class="form-control" placeholder="Password" runat="server" ></asp:TextBox><br />
                <asp:RequiredFieldValidator runat="server" ErrorMessage="This Field is requied" ControlToValidate="u_password" CssClass="text-danger"></asp:RequiredFieldValidator>
       <br /> <asp:Label runat ="server" ID="pwd_error_user" text="" ></asp:Label>
               <br />
              
               <label for ="">Confirm Password </label>
               <%--<input id="u_con_password" type="password" placeholder ="Confirm password" class="form-control" value="" /><br />--%>
                <asp:TextBox type="password" ID ="u_con_password" ValidationGroup="aa" class="form-control" placeholder="Confirm Password" runat="server" ></asp:TextBox><br />
               <asp:RequiredFieldValidator runat="server" ErrorMessage="This Field is requied" ControlToValidate="u_con_password" CssClass="text-danger"></asp:RequiredFieldValidator>
               <br /> <asp:CompareValidator runat="server" ErrorMessage="The password and confirmation password do not match." ControlToCompare="u_password" ControlToValidate="u_con_password" Display="Dynamic" CssClass="text-danger"></asp:CompareValidator>
         
               <br />
              
           </div>
                
            
        </div>
        
        
    </div>
      

        </div>
        <div class="modal-footer">
          <%--  <input type="button"  class="btn btn-success" value="Register"/>--%>
            <asp:Button ID="userregister" runat="server" Text="Register"  class="btn btn-success" value="Register" ValidationGroup="aa" OnClick="abc"  />
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
            <br />
        </div>
       </div>
    </div>
          <%--  modal end--%>

                  
  <!-- Modal -->
  <div class="modal fade" id="modal_doctor_login" role="dialog" style="font-family: 'Berlin Sans FB'; font-size: large; font-style: normal;  background-image: url('http://localhost:1753/images/image1.jpg');background-size:cover;  background-repeat: no-repeat;">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">HELLO DOCTOR..PLEASE LOGIN TO YOUR ACCOUNT</h4>
        </div>
        <div class="modal-body">
            <asp:Label ID ="login_warning_doctor" CssClass ="text-danger" runat="server" Text=""></asp:Label>
         <asp:TextBox runat="server" CssClass="form-control" placeholder="Enter Email id" ID="doctorid" ValidationGroup="doctor_login_controls"></asp:TextBox><br />
         <asp:TextBox runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password" ID="doctorpwd" ValidationGroup="doctor_login_controls"></asp:TextBox> 
           
        </div>
        <div class="modal-footer">
            <asp:Button runat="server" Text="Login "  ValidationGroup="doctor_login_controls" CssClass="btn btn-success" ID="doctorlogin"></asp:Button>
            <asp:Button runat="server" Text="Close" data-dismiss="modal" class="btn btn-default"  ValidationGroup="doctor_login_controls" ></asp:Button>
         </div>
            <br />
        </div>
       </div>
    </div>
          <%--  modal end--%>

        

<!-- Modal -->
  <div class="modal fade" id="modal_doctor_signup" role="dialog" style="background-color: #00CCFF">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="font-family: 'Century Gothic'">Hello Doctor .. Fill your detains and get started</h4>
        </div>
        <div class="modal-body">
   
    
       <div class ="form-group" >
           <asp:Label ID="Label1" runat="server" Text="Name" AssociatedControlID="doctor_name"></asp:Label>
           <asp:TextBox ID="doctor_name" runat="server" ValidationGroup="doctor_controls" type="text" class="form-control" onkeydown="return validate_text(event)" placeholder ="eg:-Rahul singh" TextMode="SingleLine"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ErrorMessage="This Field is Required" CssClass="text-danger" ControlToValidate="doctor_name" Display="Dynamic"></asp:RequiredFieldValidator>
           <br />
            <asp:Label ID="Label2" runat="server" Text="Email id" AssociatedControlID="doctor_email"></asp:Label>
           <asp:TextBox ID="doctor_email" runat="server" class="form-control" ValidationGroup="doctor_controls" placeholder ="eg:-abc@mail.com" TextMode="Email"></asp:TextBox><br />
           <asp:RequiredFieldValidator runat="server" ErrorMessage="This Field is Required" CssClass="text-danger" ControlToValidate="doctor_email" Display="Dynamic"></asp:RequiredFieldValidator>
       
            <br />
            <asp:Label ID="Label3" runat="server" Text="Contact No." AssociatedControlID="doctor_contact"></asp:Label>
           <asp:TextBox ID="doctor_contact" runat="server" type="text" class="form-control" ValidationGroup="doctor_controls" onblur="return validate_contactno(event)"  placeholder ="eg:-7889456789" TextMode="SingleLine"></asp:TextBox><br />
           <asp:RangeValidator runat="server" ErrorMessage="Please Enter 10 Digit Contact No." ControlToValidate="doctor_contact" Display="Dynamic" CssClass="text-danger" Type="Double" MinimumValue="1000000000" MaximumValue="9999999999"></asp:RangeValidator>
          <asp:RequiredFieldValidator runat="server" ErrorMessage="This Field is Required" CssClass="text-danger" ControlToValidate="doctor_contact" Display="Dynamic"></asp:RequiredFieldValidator>
       
           <br />

            <asp:Label ID="Label4" runat="server" Text="Age" AssociatedControlID="doctor_age" CssClass=""></asp:Label>
           <asp:TextBox ID="doctor_age" runat="server" type="text" class="form-control" ValidationGroup="doctor_controls" placeholder ="eg:-20" TextMode="SingleLine"></asp:TextBox><br />
           <asp:RangeValidator runat="server" ErrorMessage="Age must be greater than 25 and less than 100 " ControlToValidate="doctor_age" Display="Dynamic" CssClass="text-danger" Type="Integer" MinimumValue="26" MaximumValue="100"></asp:RangeValidator>
           <asp:RequiredFieldValidator runat="server" ErrorMessage="This Field is Required" CssClass="text-danger" ControlToValidate="doctor_age" Display="Dynamic"></asp:RequiredFieldValidator>
       
            <br />

           <asp:Label ID="Label7" runat="server" Text="Gender" AssociatedControlID="doctor_gender"></asp:Label>
            <asp:RadioButtonList ID="doctor_gender" ValidationGroup="doctor_controls" runat="server" >
                   <asp:ListItem>Male</asp:ListItem>
                   <asp:ListItem>Female</asp:ListItem>
               </asp:RadioButtonList>
            <asp:RequiredFieldValidator runat="server" ErrorMessage="This Field is Required" CssClass="text-danger" ControlToValidate="doctor_gender" Display="Dynamic"></asp:RequiredFieldValidator>
       
           <br />

            <asp:Label ID="Label5" runat="server" Text="Address" AssociatedControlID="doctor_address"></asp:Label>
           <asp:TextBox ID="doctor_address" runat="server" type="text" class="form-control" ValidationGroup="doctor_controls" placeholder ="eg:-Gandhi Nagar Jammu" TextMode="MultiLine"></asp:TextBox><br />
            <asp:RequiredFieldValidator runat="server" ErrorMessage="This Field is Required" CssClass="text-danger" ControlToValidate="doctor_address" Display="Dynamic"></asp:RequiredFieldValidator>
       
           <br />
            <asp:Label ID="Label13" runat="server" Text="Qualifications" ></asp:Label>
           <asp:DropDownList runat="server" CssClass ="form-control" ValidationGroup="doctor_controls" Width="194px" ID="d_qualf" >
               <asp:ListItem >M.B.B.S</asp:ListItem>
               <asp:ListItem>M.D</asp:ListItem>
              <asp:ListItem>B.D.S</asp:ListItem>
           </asp:DropDownList> 
            
            <br />

            <asp:Label ID="Label6" runat="server" Text="Category" AssociatedControlID="doctor_category"></asp:Label>
           <asp:DropDownList runat="server" CssClass ="form-control" ValidationGroup="doctor_controls" Width="194px" ID="doctor_category">
               <asp:ListItem>ENT</asp:ListItem>
               <asp:ListItem>Physician</asp:ListItem>
               <asp:ListItem>Orthopediacs</asp:ListItem>
           </asp:DropDownList> 
            <asp:RequiredFieldValidator runat="server" ErrorMessage="This Field is Required" CssClass="text-danger" ControlToValidate="doctor_category" Display="Dynamic"></asp:RequiredFieldValidator>
       
            <br />

            <asp:Label ID="Label10" runat="server" Text="Fees(In Rupees)" AssociatedControlID="doctor_fee" CssClass=""></asp:Label>
           <asp:TextBox ID="doctor_fee" runat="server" type="text" class="form-control"  onkeydown=validate_number(event) ValidationGroup="doctor_controls" placeholder ="eg:-Rs.2000" TextMode="SingleLine"></asp:TextBox><br />
             <asp:RequiredFieldValidator runat="server" ErrorMessage="This Field is Required" CssClass="text-danger" ControlToValidate="doctor_fee" Display="Dynamic"></asp:RequiredFieldValidator>
       <br />

            <asp:Label ID="Label11" runat="server" Text="Experience(In Years)" AssociatedControlID="doctor_experience" CssClass=""></asp:Label>
           <asp:TextBox ID="doctor_experience" runat="server" type="text" class="form-control"  onkeydown=validate_number(event) ValidationGroup="doctor_controls" placeholder ="eg:-5 years" TextMode="SingleLine"></asp:TextBox><br />
             <asp:RequiredFieldValidator runat="server" ErrorMessage="This Field is Required" CssClass="text-danger" ControlToValidate="doctor_experience" Display="Dynamic"></asp:RequiredFieldValidator>
       <br />

            <asp:Label ID="Label12" runat="server" Text="Timings " AssociatedControlID="doctor_timing" CssClass=""></asp:Label>
           <asp:TextBox ID="doctor_timing" runat="server" type="text" class="form-control"  ValidationGroup="doctor_controls" placeholder ="eg:-20" TextMode="Time"></asp:TextBox><br />
             <asp:RequiredFieldValidator runat="server" ErrorMessage="This Field is Required" CssClass="text-danger" ControlToValidate="doctor_timing" Display="Dynamic"></asp:RequiredFieldValidator>
       <br />

           <label for ="">Upload your image..</label> <br />
                <asp:FileUpload runat="server" id="doctor_image_upload" ></asp:FileUpload>
                <asp:CustomValidator runat="server" ID ="doctorimagevalidator" ErrorMessage="File not supported. Only .jpg or .jpeg" ControlToValidate="doctor_image_upload" onservervalidate="doctor_image_validation" Display="Dynamic"></asp:CustomValidator>
               
        <br />

            <label for ="">Upload one of your medical certificates..</label> <br />
                <asp:FileUpload runat="server" id="certificate" ></asp:FileUpload>
                <asp:CustomValidator runat="server" ID ="CustomValidator1" ErrorMessage="File not supported. Only .jpg or .jpeg" ControlToValidate="certificate" onservervalidate="certificate_validation" Display="Dynamic"></asp:CustomValidator>
               
        <br />

           <asp:Label ID="Label8" runat="server" Text="Password" AssociatedControlID="doctor_password"></asp:Label>
           <asp:TextBox ID="doctor_password" runat="server" class="form-control"  ValidationGroup="doctor_controls" TextMode="Password"></asp:TextBox><br />
            <asp:RequiredFieldValidator runat="server" ErrorMessage="This Field is Required" CssClass="text-danger" ControlToValidate="doctor_password" Display="Dynamic"></asp:RequiredFieldValidator>
      <br />
           <asp:Label runat="server" Text="" ID ="pwd_error"></asp:Label>
            <br />

            <asp:Label ID="Label9" runat="server" Text="Re-Enter your Password" AssociatedControlID="ConfirmPassword"></asp:Label>
           <asp:TextBox ID="ConfirmPassword" runat="server" class="form-control"  ValidationGroup="doctor_controls" TextMode="Password"></asp:TextBox><br />
           <asp:CompareValidator runat="server" ErrorMessage="The password and confirmation password do not match." ControlToCompare="doctor_password" ControlToValidate="ConfirmPassword" Display="Dynamic" CssClass="text-danger"></asp:CompareValidator>
            <asp:RequiredFieldValidator runat="server" ErrorMessage="This Field is Required" CssClass="text-danger" ControlToValidate="ConfirmPassword" Display="Dynamic"></asp:RequiredFieldValidator>
       

           <asp:CustomValidator runat="server" ErrorMessage="CustomValidator"></asp:CustomValidator>
          </div> 

        </div>
        <div class="modal-footer">
          <%--  <input type="button"  class="btn btn-success" value="Register"/>--%>
            <asp:Button ID="doctorreg" runat="server" Text="Register" ValidationGroup="doctor_controls" class="btn btn-success" value="Register" />
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
            <br />
        </div>
       </div>
    </div>
          <%--  modal end--%>


            </div> 
        </div> 
</asp:Content>
