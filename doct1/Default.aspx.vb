Imports System.Data.SqlClient

Public Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

    End Sub

    'Protected Sub email_validate(sender As Object, e As EventArgs) Handles u_email.TextChanged
    '    u_name.Focus()
    'End Sub=
    Protected Sub certificate_validation(sender As Object, e As ServerValidateEventArgs)
        Dim extension As String
        extension = System.IO.Path.GetExtension(certificate.PostedFile.FileName)
        If extension = ".jpg" Or extension = ".jpeg" Then
            e.IsValid = True
        Else
            e.IsValid = False
        End If
    End Sub

    Protected Sub user_image_validation(sender As Object, e As ServerValidateEventArgs)
        Dim extension As String
        extension = System.IO.Path.GetExtension(user_image_upload.PostedFile.FileName)
        If extension = ".jpg" Or extension = ".jpeg" Then
            e.IsValid = True
        Else
            e.IsValid = False
        End If
    End Sub
    Protected Sub doctor_image_validation(sender As Object, e As ServerValidateEventArgs)
        Dim extension As String
        extension = System.IO.Path.GetExtension(doctor_image_upload.PostedFile.FileName)
        If extension = ".jpg" Or extension = ".jpeg" Then
            e.IsValid = True
        Else
            e.IsValid = False
        End If
    End Sub
    Protected Sub abc(sender As Object, e As EventArgs) Handles userregister.Click
        ' MsgBox("connect")
        'Dim regdate As String = String.Format("{dd//MM//yyyy}", Date.Now)
        Try
            Dim regdate As Date = DateTime.Now
            Dim counteremail As Int64 = 1
            Dim countercontact As Int64 = 1
            Dim aa As String
            aa = Server.MapPath("/App_Data\Database1.mdf")
            Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
            Dim query, valemail, valcontact As String
            valemail = "select * from regis_user1 where emailid= @e"
            valcontact = "select * from regis_user1 where contactno = @c"
            query = "insert into regis_user1(name,emailid,contactno,age,gender,address,password,registration_date) values(@name,@email,@contact_no,@age,@gender,@address,@password,@regis_date)"
            Dim cmdemail As New SqlCommand(valemail, con)
            Dim cmdcontact As New SqlCommand(valcontact, con)
            Dim dremail, drcontact As SqlDataReader
            cmdemail.Parameters.AddWithValue("@e", u_email.Text)
            cmdcontact.Parameters.AddWithValue("@c", Convert.ToInt64(u_contact_no.Text))
            con.Open()
            dremail = cmdemail.ExecuteReader

            If dremail.HasRows Then
                counteremail = 0

                '  MsgBox("email exist")
            End If

            con.Close()
            con.Open()
            drcontact = cmdcontact.ExecuteReader
            If drcontact.HasRows Then
                countercontact = 0
                u_contact_no.Focus()
                ' MsgBox("Contact exist")
            End If


            Dim cmd As New SqlCommand(query, con)
            cmd.Parameters.AddWithValue("@name", u_name.Text)
            cmd.Parameters.AddWithValue("@email", u_email.Text)
            cmd.Parameters.AddWithValue("@contact_no", u_contact_no.Text)
            cmd.Parameters.AddWithValue("@age", Convert.ToInt32(u_age.Text))
            cmd.Parameters.AddWithValue("@gender", u_gender.SelectedItem.Text)
            cmd.Parameters.AddWithValue("@address", u_address.Text)
            If u_password.Text = u_con_password.Text And u_password.Text.Length >= 8 Then
                cmd.Parameters.AddWithValue("@password", u_password.Text + "@32")
            End If


            cmd.Parameters.AddWithValue("@regis_date", regdate)

            If countercontact = 0 Or counteremail = 0 Then
                MsgBox(" Either Emailid or Contact NO. already exist")
            Else
                con.Close()
                con.Open()
                Dim a As Int16
                a = cmd.ExecuteNonQuery()
                If a > 0 Then
                    MsgBox("Registration Successful")
                End If

            End If

            con.Close()

            '<<<<<<<<<<code for image upload>>>>>>>>>>>
            Dim folderpath As String = Server.MapPath("/userimages/")
            Dim fullpath, extension As String

            extension = System.IO.Path.GetExtension(user_image_upload.PostedFile.FileName)
            fullpath = folderpath + u_email.Text + ".jpg"

            user_image_upload.SaveAs(fullpath)
        Catch ex As Exception
            MsgBox("Registration failed")

        End Try
    End Sub

    Protected Sub userlogin_click(ByVal sender As Object, ByVal e As EventArgs) Handles userlogin.Click
        Try
            Dim aa As String
            aa = Server.MapPath("/App_Data\Database1.mdf")
            Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
            Dim query As String
            query = "select * from regis_user1 where emailid =@userid and password =@userpwd"
            Dim cmd As New SqlCommand(query, con)
            cmd.Parameters.AddWithValue("@userid", user_login_id.Text)
            cmd.Parameters.AddWithValue("@userpwd", user_login_password.Text + "@32")
            If con.State = ConnectionState.Closed Then
                con.Open()
            End If
            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader
            If dr.HasRows Then
                dr.Read()
                Dim st As String
                st = "WELCOME  " + dr(1)
                'MsgBox(st)
                Dim pass As String = user_login_id.Text
                Response.Redirect("patient_home.aspx?Passthevalue=" + pass)
            Else
                login_warning_user.Text = "Invalid E-mail Or Password "
                '  MsgBox(login_warning.Text)
            End If
            dr.Close()
            con.Close()

        Catch ex As Exception
        End Try
    End Sub

    Protected Sub doctorlogin_click(ByVal sender As Object, ByVal e As EventArgs) Handles doctorlogin.Click
        Try
            Dim aa As String
            aa = Server.MapPath("/App_Data\Database1.mdf")
            Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
            Dim query As String
            query = "select * from doctor where emailid =@doctorid and doctor_password =@doctorpwd"
            Dim cmd As New SqlCommand(query, con)
            cmd.Parameters.AddWithValue("@doctorid", doctorid.Text)
            cmd.Parameters.AddWithValue("@doctorpwd", doctorpwd.Text + "@32")
            If con.State = ConnectionState.Closed Then
                con.Open()
            End If
            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader
            If dr.HasRows Then
                dr.Read()
                '  Dim st As String
                ' st = "WELCOME  " + dr(1)
                'MsgBox(st)
                Dim pass As String = doctorid.Text
                Response.Redirect("doctor_home.aspx?Passthevalue=" + pass)
            Else
                login_warning_doctor.Text = "Invalid E-mail Or Password "
            End If
            dr.Close()
            con.Close()
        Catch ex As Exception

        End Try
    End Sub
    Protected Sub doctorreg_Click(ByVal sender As Object, ByVal e As EventArgs) Handles doctorreg.Click
        ' MsgBox("Connect")
        Try
            Dim aa As String
            aa = Server.MapPath("/App_Data\Database1.mdf")
            Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
            Dim counteremail As Int64 = 1
            Dim countercontact As Int64 = 1
            Dim query, valemail, valcontact As String
            query = "insert into doctor(name,emailid,contact_no,age,Address,gender,category,registration_date,doctor_password,fee,experience,timing,qualf) values(@doctor_name,@doctor_email,@doctor_contactno,@doctor_age,@doctor_address,@doctor_gender,@doctor_category,@doctor_registration_date,@doctor_password,@doctor_fee,@doctor_exp,@doctor_timing,@doctor_qualf)"
            valemail = "select * from doctor where emailid= @doctor_email"
            valcontact = "select * from regis_user1 where contactno = @c"
            Dim cmdemail As New SqlCommand(valemail, con)
            Dim cmdcontact As New SqlCommand(valcontact, con)
            Dim dremail, drcontact As SqlDataReader
            cmdemail.Parameters.AddWithValue("@doctor_email", doctor_email.Text)
            cmdcontact.Parameters.AddWithValue("@c", Convert.ToInt64(doctor_contact.Text))
            'code for email validation
            con.Open()
            dremail = cmdemail.ExecuteReader

            If dremail.HasRows Then
                counteremail = 0
                MsgBox("Email Already Exist")

            End If
            dremail.Close()
            con.Close()

            'code for contact validation
            con.Open()
            drcontact = cmdcontact.ExecuteReader
            If drcontact.HasRows Then
                countercontact = 0
                MsgBox("Contact No. Already Exist")

            End If
            drcontact.Close()
            con.Close()

            Dim cmd As New SqlCommand(query, con)
            cmd.Parameters.AddWithValue("@doctor_name", doctor_name.Text)
            cmd.Parameters.AddWithValue("@doctor_email", doctor_email.Text)
            cmd.Parameters.AddWithValue("@doctor_contactno", doctor_contact.Text)
            cmd.Parameters.AddWithValue("@doctor_age", doctor_age.Text)
            cmd.Parameters.AddWithValue("@doctor_address", doctor_address.Text)
            cmd.Parameters.AddWithValue("@doctor_gender", doctor_gender.SelectedItem.Text)
            cmd.Parameters.AddWithValue("@doctor_category", doctor_category.SelectedItem.Text)
            cmd.Parameters.AddWithValue("@doctor_registration_date", DateTime.Now)

            cmd.Parameters.AddWithValue("@doctor_fee", doctor_fee.Text)
            cmd.Parameters.AddWithValue("@doctor_exp", doctor_experience.Text)
            cmd.Parameters.AddWithValue("@doctor_timing", doctor_timing.Text)
            cmd.Parameters.AddWithValue("@doctor_qualf", d_qualf.Text)
            ' MsgBox(CStr(doctor_password.Text.Length))
            If doctor_password.Text = ConfirmPassword.Text And doctor_password.Text.Length >= 8 Then

                cmd.Parameters.AddWithValue("@doctor_password", doctor_password.Text + "@32")
                ' MsgBox(doctor_password.Text)
            End If

            If counteremail = 0 Or countercontact = 0 Then 'check for already exists

            Else

                con.Open()
                Dim a As Int16
                a = cmd.ExecuteNonQuery()
                'MsgBox("a=", +a)
                If a > 0 Then
                    MsgBox("Registration Successful ")
                End If
                con.Close()
            End If

            con.Close()
        Catch ex As Exception
            MsgBox(Convert.ToString(ex))
        End Try
        '<<<<<<<<<<code for image upload>>>>>>>>>>>
        Dim folderpath As String = Server.MapPath("~/doctorimages/")
        Dim fullpath, extension As String

        extension = System.IO.Path.GetExtension(doctor_image_upload.PostedFile.FileName)
        fullpath = folderpath + doctor_email.Text + ".jpg"

        '<<<<<<<<<<<< Code for certificate upload >>>>>>>>>>>

        doctor_image_upload.SaveAs(fullpath)
        folderpath = Server.MapPath("~/doctorcertificates/")
        extension = System.IO.Path.GetExtension(certificate.PostedFile.FileName)
        fullpath = folderpath + doctor_email.Text + ".jpg"

    End Sub


    Protected Sub val_pwd(ByVal sender As Object, ByVal e As EventArgs) Handles doctor_password.TextChanged
        '  MsgBox("Checks password length")
        Dim s As String
        s = doctor_password.Text
        If s.Length >= 8 Then
            pwd_error.Text = ""
        Else
            'MsgBox("password must be of length 8")
            pwd_error.Text = "Password length must be greater than or equal to  8"
        End If
    End Sub

    Protected Sub val_pwd2(ByVal sender As Object, ByVal e As EventArgs) Handles u_password.TextChanged
        Dim s As String
        s = u_password.Text
        If s.Length >= 8 Then
            pwd_error_user.Text = ""
        Else
            'MsgBox("password must be of length 8")
            pwd_error_user.Text = "Password length must be greater than or equal to  8"
        End If
    End Sub

    Protected Sub avail(ByVal sender As Object, ByVal e As EventArgs) Handles availdoctors.Click
        Response.Redirect("checkdoctors.aspx")
    End Sub


End Class