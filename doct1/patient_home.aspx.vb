Imports System.Data.SqlClient

Public Class patient_home
    Inherits System.Web.UI.Page
    Dim received As String
    Dim valid_image As Integer
    Dim old_password_match As Integer
    Dim up_name As String
    Dim up_age As String

    Dim up_contact As String
    Dim up_email As String
    Dim up_gender As String
    Dim up_address As String
    Dim up_password As String


    Protected Sub nameleave(ByVal sender As Object, ByVal e As System.EventArgs) Handles e_name.TextChanged

        up_name = e_name.Text

    End Sub

    Protected Sub emailleave(ByVal sender As Object, ByVal e As System.EventArgs) Handles e_email.TextChanged

        up_email = e_email.Text

    End Sub

    Protected Sub ageleave(ByVal sender As Object, ByVal e As System.EventArgs) Handles e_age.TextChanged

        up_age = e_age.Text

    End Sub

    Protected Sub contactleave(ByVal sender As Object, ByVal e As System.EventArgs) Handles e_contact.TextChanged

        up_contact = e_contact.Text

    End Sub

    Protected Sub addressleave(ByVal sender As Object, ByVal e As System.EventArgs) Handles e_address.TextChanged

        up_address = e_address.Text

    End Sub

    'Protected Sub passwordleave(ByVal sender As Object, ByVal e As System.EventArgs) Handles e_confirm.TextChanged

    '    ' up_password = e_confirm.Text

    'End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            user_image.ImageUrl = ""
            profile_image.ImageUrl = ""
            ' MsgBox("load called")
            invalid_image.Visible = False
            secondone.Visible = False
            firstone.Visible = True
            thirdone.Visible = True
            feed_success.Visible = False
            track_data.Visible = False
            feed1.Visible = True
            history_div.Visible = False
            not_found.Visible = False
            cancelledbooking.Visible = False
            received = Request.QueryString("Passthevalue")
            Dim rootfolder As String = Server.MapPath(received)

            'Dim imagepath As String = rootfolder + ".jpg"
            Dim imagepath As String = "/userimages/" + received + ".jpg"
            'MsgBox(imagepath)
            user_image.ImageUrl = imagepath
            profile_image.ImageUrl = imagepath
            'loginuser.Text = "Welcome  " + received
            Dim aa As String
            aa = Server.MapPath("/App_Data\Database1.mdf")
            Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
            Dim query As String
            query = "select * from regis_user1 where emailid =@email"
            Dim cmd As New SqlCommand(query, con)
            cmd.Parameters.AddWithValue("@email", received)
            Dim dr As SqlDataReader
            con.Open()
            dr = cmd.ExecuteReader

            If dr.HasRows Then
                dr.Read()
                loginuser.Text = "Welcome  " + dr(1)

            End If

            con.Close()
        Catch ex As Exception
        End Try
    End Sub
    Protected Sub t_close_click(ByVal sender As Object, ByVal e As EventArgs) Handles t_close.Click

        track_data.Visible = False
        not_found.Visible = False
        cancelledbooking.Visible = False
    End Sub

    Protected Sub track_click(sender As Object, e As EventArgs) Handles track_button.Click
        Try
            Dim aa As String
            aa = Server.MapPath("/App_Data\Database1.mdf")
            Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
            Dim cmd As New SqlCommand("select * from bookings where booking_id=@id", con)
            cmd.Parameters.AddWithValue("@id", track_id.Text)
            Dim dr As SqlDataReader
            con.Open()
            dr = cmd.ExecuteReader
            If dr.HasRows Then
                dr.Read()
                t_status.Text = dr(7)
                If t_status.Text = "pending" Or t_status.Text = "confirmed" Or t_status.Text = "Pending" Or t_status.Text = "Confirmed" Then
                    not_found.Visible = False
                    track_data.Visible = True
                    t_name.Text = dr(1)
                    t_contact.Text = dr(4)
                    t_age.Text = dr(3)
                    t_date.Text = dr(9).ToString
                    t_time.Text = dr(8).ToString
                    t_problem.Text = dr(5)
                    t_dname.Text = dr(11)
                    t_address.Text = dr(12)
                Else
                    not_found.Visible = True
                    track_data.Visible = False
                End If
            Else
                track_data.Visible = False
                not_found.Visible = True

            End If

            track_data.Focus()
        Catch ex As Exception
        End Try
    End Sub
    Protected Sub proceed_click(ByVal sender As Object, ByVal e As EventArgs) Handles proceed.Click
        Try
            gd1.Visible = True
            Dim aa As String
            aa = Server.MapPath("/App_Data\Database1.mdf")
            Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
            Dim adp As New SqlDataAdapter("select * from doctor where category='" + choose_category.SelectedItem.Text + "' and Address LIKE'" + choose_location.SelectedItem.Text + "'", con)

            Dim ds As New DataSet

            adp.Fill(ds)
            gd1.DataSource = ds.Tables(0)

            gd1.DataBind()
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub book_click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim s As String

    End Sub

    Protected Sub close_click(ByVal sender As Object, ByVal e As EventArgs) Handles close.Click

        gd1.Visible = False

    End Sub

    'Protected Sub confirm_click(ByVal sender As Object, ByVal e As EventArgs) Handles confirm.Click
    '    Dim pass As String

    '    '   Dim aa As String aa = Server.MapPath("/App_Data\Database1.mdf") Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
    '    'Dim cmd As SqlCommand("selct name from regis")
    '    pass = received



    '    Response.Redirect("booking.aspx?passthevalue=" + pass)

    'End Sub

    Protected Sub book(source As Object, e As DataGridCommandEventArgs)

    End Sub

    Protected Sub book_click(source As Object, e As DataGridCommandEventArgs) Handles gd1.ItemCommand
        Dim user_email, pass As String
        user_email = Convert.ToString(e.Item.Cells(1).Text)
        pass = received + "`" + user_email
        Response.Redirect("booking.aspx?passthevalue=" + pass)
    End Sub

    Protected Sub historysee_click(sender As Object, e As EventArgs) Handles history_see.Click
        Try
            history_div.Visible = True
            Dim aa As String
            aa = Server.MapPath("/App_Data\Database1.mdf")
            Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
            Dim adp As New SqlDataAdapter("select booking_id As BookingId,patient_name As Patient,doctor_name As Doctor,date As Date from bookings where patient_email='" + received + "'", con)


            Dim ds As New DataSet

            adp.Fill(ds)
            history_book.DataSource = ds.Tables(0)

            history_book.DataBind()
        Catch ex As Exception
        End Try
    End Sub
    Protected Sub historyclose_click(sender As Object, e As EventArgs) Handles history_close.Click
        history_div.Visible = False
        not_found.Visible = False
    End Sub

    Protected Sub Submitfeed_click(sender As Object, e As EventArgs) Handles submit_feed.Click
        Try
            Dim aa As String
            aa = Server.MapPath("/App_Data\Database1.mdf")

            Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
            Dim cmd As New SqlCommand("insert into user_feedback(email,feed) values(@email,@feed)", con)
            cmd.Parameters.AddWithValue("@email", received)
            cmd.Parameters.AddWithValue("@feed", feed.Text)
            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
            'modal_feedback.Visible = True
            feed1.Visible = False
            feed_success.Visible = True
            fedfocus.Focus()
        Catch ex As Exception
        End Try

    End Sub

    Protected Sub Seedetails_click(sender As Object, e As EventArgs) Handles see_details.Click

        '  firstone.Visible = False
        Dim aa As String
        aa = Server.MapPath("/App_Data\Database1.mdf")
        Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
        Dim cmd As New SqlCommand("select * from regis_user1 where emailid=@email", con)
        cmd.Parameters.AddWithValue("@email", received)
        Dim dr As SqlDataReader
        con.Open()
        dr = cmd.ExecuteReader
        dr.Read()
        e_name.Text = dr(1)
        up_name = e_name.Text
        e_email.Text = dr(2)
        up_email = e_email.Text
        e_age.Text = dr(4)
        up_age = e_age.Text
        e_gender.Text = dr(5)
        e_address.Text = dr(6)
        up_address = e_address.Text
        'MsgBox(up_address)
        e_contact.Text = dr(3)
        up_contact = e_contact.Text
        dr.Close()
        con.Close()
        Dim imagepath As String = "/userimages/" + received + ".jpg"
        profile_image.ImageUrl = imagepath
        secondone.Visible = True
        thirdone.Visible = False

    End Sub

    Protected Sub hidedetails_click(sender As Object, e As EventArgs) Handles hide_details.Click
        secondone.Visible = False
        thirdone.Visible = True
        ' firstone.Visible = True

    End Sub
    Protected Sub abcd(sender As Object, e As EventArgs)
        Dim str As String = imgupload.FileName
        'MsgBox(str)
        profile_image.ImageUrl = str
    End Sub

    Protected Sub updateimg_click(sender As Object, e As EventArgs) Handles update_img.Click
        If valid_image = 10 Then
            Dim folderpath As String = Server.MapPath("/userimages/")
            Dim fullpath, extension As String

            extension = System.IO.Path.GetExtension(imgupload.PostedFile.FileName)
            fullpath = folderpath + received + ".jpg"
            System.IO.File.Delete(fullpath)
            imgupload.SaveAs(fullpath)

        Else

        End If


    End Sub
    Protected Sub user_image_validation(sender As Object, e As ServerValidateEventArgs)
        Dim extension As String
        extension = System.IO.Path.GetExtension(imgupload.PostedFile.FileName)
        If extension = ".JPG" Or extension = ".jpeg" Or extension = ".jpg" Or extension = ".JPEG" Then
            valid_image = 10
            e.IsValid = True



        Else
            valid_image = 0
            e.IsValid = False

        End If

        'Dim folderpath As String = Server.MapPath("/userimages/")
        'Dim fullpath As String

        'extension = System.IO.Path.GetExtension(imgupload.PostedFile.FileName)
        'fullpath = folderpath + received + ".jpg"

        'imgupload.SaveAs(fullpath)
    End Sub

    Protected Sub log_no_click(sender As Object, e As EventArgs) Handles logno.Click
        ' fedfocus.Focus()
    End Sub
    Protected Sub log_yes_click(sender As Object, e As EventArgs) Handles logyes.Click
        Response.Redirect("default.aspx")
    End Sub

    Protected Sub cancel_appointment_click(sender As Object, e As EventArgs) Handles t_cancel.Click
        Dim aa As String
        aa = Server.MapPath("/App_Data\Database1.mdf")
        Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
        Dim cmd As New SqlCommand("update bookings set status='Cancelled' where booking_id=" + track_id.Text, con)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
        cancelledbooking.visible = True
    End Sub

    'Protected Function old_password_validation(sender As Object, e As ServerValidateEventArgs)
    '    'MsgBox("old password validator called")
    '    Dim aa As String
    '    aa = Server.MapPath("/App_Data\Database1.mdf")
    '    Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
    '    Dim cmd As New SqlCommand("select * from regis_user1 where emailid=@email and password=@pwd", con)
    '    cmd.Parameters.AddWithValue("@email", received)
    '    cmd.Parameters.AddWithValue("@pwd", e_old.Text)
    '    Dim dr As SqlDataReader
    '    con.Open()
    '    dr = cmd.ExecuteReader
    '    If dr.HasRows Then
    '        e.IsValid = True
    '        old_password_match = 1
    '    Else
    '        e.IsValid = False
    '        old_password_match = 0
    '    End If

    '    con.Close()

    'End Function

    'Protected Sub update_click(sender As Object, e As EventArgs) Handles update.Click
    '    If old_password_match = 1 Then
    '        Dim aa As String
    '        aa = Server.MapPath("/App_Data\Database1.mdf")
    '        Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
    '        Dim query, valemail, valcontact As String
    '        valemail = "select * from regis_user1 where emailid= @e"
    '        valcontact = "select * from regis_user1 where contactno = @c"
    '        query = "update regis_user1  set name=@name,contactno=@contact_no,age=@age,address=@address,password=@password where emailid=@email; "

    '        Dim cmd As New SqlCommand(query, con)
    '        cmd.Parameters.AddWithValue("@email", e_email.Text)
    '        cmd.Parameters.AddWithValue("@name", up_name)
    '        'cmd.Parameters.AddWithValue("@email", up_email)
    '        cmd.Parameters.AddWithValue("@contact_no", up_contact)
    '        cmd.Parameters.AddWithValue("@age", Convert.ToInt32(up_age))

    '        cmd.Parameters.AddWithValue("@address", up_address)
    '        cmd.Parameters.AddWithValue("@password", e_confirm.Text)
    '        con.Open()
    '        'MsgBox(up_address)
    '        cmd.ExecuteNonQuery()
    '        MsgBox("success")
    '        con.Close()
    '    Else
    '        MsgBox("old password doesnt match")
    '    End If
    'End Sub

    Protected Sub rpwd_Click(sender As Object, e As EventArgs)
        Try
            MsgBox("Reset pwd called")
            Dim aa As String
            aa = Server.MapPath("/App_Data\Database1.mdf")
            Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
            Dim cmd As New SqlCommand("update regis_user1 SET password=@newpwd where password=@oldpwd and emailid=@user", con)
            cmd.Parameters.AddWithValue("@oldpwd", oldpwd.Text + "@32")
            cmd.Parameters.AddWithValue("@newpwd", newpwd.Text + "@32")
            cmd.Parameters.AddWithValue("@user", received)
            con.Open()
            Dim a As Int32
            a = cmd.ExecuteNonQuery()
            If a > 0 Then
                MsgBox("password Reset Successfully")
                oldpwd.Text = ""
                newpwd.Text = ""
            End If
        Catch ex As Exception

        End Try
    End Sub
End Class