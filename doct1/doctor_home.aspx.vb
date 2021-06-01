Imports System.Data.SqlClient


Public Class doctor_home
    Inherits System.Web.UI.Page

    Dim received As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            received = Request.QueryString("Passthevalue")
            feed_success.Visible = False
            feed1.Visible = True
            history_div.Visible = False
            c_book_div.Visible = False
            firstone.Visible = True
            secondone.Visible = False
            Dim imagepath As String = "~/doctorimages/" + received + ".jpg"
            'loginuser.Text = "Welcome  " + received
            Dim aa As String
            aa = Server.MapPath("/App_Data\Database1.mdf")
            Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
            Dim query As String
            query = "select * from doctor where emailid =@email"
            Dim cmd As New SqlCommand(query, con)
            cmd.Parameters.AddWithValue("@email", received)
            Dim dr As SqlDataReader
            con.Open()
            dr = cmd.ExecuteReader

            If dr.HasRows Then
                dr.Read()
                logindoctor.Text = "Welcome  " + dr(1)
                doctor_image.ImageUrl = imagepath
            End If

            con.Close()
            profile_image.ImageUrl = imagepath
        Catch ex As Exception
        End Try
    End Sub

    Protected Sub go_click(ByVal sender As Object, ByVal e As System.EventArgs) Handles go.Click
        Try
            book_requests.Visible = True
            Dim aa As String
            aa = Server.MapPath("/App_Data\Database1.mdf")
            Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")

            '   Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename='C:\Users\Manu Kumar\Desktop\doct2\doct1\App_Data\Database1.mdf';Integrated Security=True")
            'Dim adp As New SqlDataAdapter("select patient_name,patient_age,patient_contact,patient_problem,timing,status from bookings where status='p'", con)
            Dim adp As New SqlDataAdapter("select * from bookings where status='pending' and doctor_email='" + received + "'", con)
            Dim ds As New DataSet

            adp.Fill(ds)
            book_requests.DataSource = ds.Tables(0)
            book_requests.DataBind()

        Catch ex As Exception
        End Try
    End Sub
    Protected Sub close_click(ByVal sender As Object, ByVal e As EventArgs) Handles close_records.Click

        book_requests.Visible = False

    End Sub
    Protected Sub allow_click(ByVal sender As Object, ByVal e As System.EventArgs)


    End Sub
    Protected Sub allow_click(ByVal sender As Object, ByVal e As DataGridCommandEventArgs) Handles book_requests.ItemCommand
        Try
            book_requests.Visible = True
            Dim bookingid, query1, query2, btn As String
            bookingid = Convert.ToString(e.Item.Cells(0).Text)

            Dim aa As String
            aa = Server.MapPath("/App_Data\Database1.mdf")
            Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")

            query1 = "update bookings set status='Confirmed' where booking_id=" + bookingid
            query2 = "update bookings set status='Cancelled' where booking_id=" + bookingid
            Dim cmd As New SqlCommand("", con)

            btn = CType(e.CommandSource, Button).Text
            If btn = "Confirm" Then

                con.Open()
                cmd.CommandText = query1
                cmd.ExecuteNonQuery()
                con.Close()
                MsgBox("Booking Confirmed")
            Else
                If btn = "Cancel" Then

                    con.Open()
                    cmd.CommandText = query2
                    cmd.ExecuteNonQuery()
                    con.Close()
                    MsgBox("Booking Cancelled")

                End If
            End If
            con.Close()

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    'Protected Sub cancel_appointment(sender As Object, e As DataGridCommandEventArgs) Handles book_requests.CancelCommand

    '    Try

    '        MsgBox("cancel entered")
    '        book_requests.Visible = True
    '        Dim query As String
    '        Dim cbookingid As Int32
    '        'cbookingid = Convert.ToInt32())

    '        Dim aa As String
    '        aa = Server.MapPath("/App_Data\Database1.mdf")
    '        Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")

    '        ' MsgBox(bookingid)
    '        query = "update bookings set status='Cancelled' where booking_id=@cbookingid"
    '        ' MsgBox(query)
    '        Dim cmd As New SqlCommand(query, con)
    '        cmd.Parameters.AddWithValue("@cbookingid", cbookingid)
    '        con.Open()
    '        cmd.ExecuteNonQuery()
    '        con.Close()

    '        MsgBox("Booking Cancelled")
    '    Catch ex As Exception

    '    End Try

    'End Sub

    'Protected Sub deny_click(ByVal sender As Object, ByVal e As EventArgs) Handles deny.Click
    '    Dim bookingid As Int64
    '    Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename='C:\Users\Manu Kumar\Desktop\New folder\doct2\doct1\App_Data\Database1.mdf';Integrated Security=True")
    '    Dim adp As New SqlCommand("update bookings set status='Canceled' where booking_id=" + Convert.ToString(bookingid), con)
    '    MsgBox("Booking Canceled")
    'End Sub

    Protected Sub c_book_see_click(sender As Object, e As EventArgs) Handles c_book_see.Click

        Try
            c_book_div.Visible = True
            Dim aa As String
            aa = Server.MapPath("/App_Data\Database1.mdf")
            Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
            Dim adp As New SqlDataAdapter("select booking_id As BookingId,patient_name As Patient,patient_age As Age,patient_problem As Problem,date As Date from bookings where doctor_email='" + received + "' and status = 'Confirmed'", con)


            Dim ds As New DataSet

            adp.Fill(ds)
            c_book_gd.DataSource = ds.Tables(0)

            c_book_gd.DataBind()
        Catch ex As Exception
        End Try

    End Sub

    Protected Sub c_book_close_click(sender As Object, e As EventArgs) Handles c_book_close.Click


        c_book_close.Visible = False

    End Sub


    Protected Sub historysee_click(sender As Object, e As EventArgs) Handles history_see.Click
        Try
            history_div.Visible = True
            Dim aa As String
            aa = Server.MapPath("/App_Data\Database1.mdf")
            Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
            Dim adp As New SqlDataAdapter("select booking_id As BookingId,patient_name As Patient,patient_age As Age,patient_problem As Problem,date As Date from bookings where doctor_email='" + received + "'", con)


            Dim ds As New DataSet

            adp.Fill(ds)
            history_book.DataSource = ds.Tables(0)

            history_book.DataBind()
        Catch ex As Exception
        End Try

    End Sub
    Protected Sub historyclose_click(sender As Object, e As EventArgs) Handles history_close.Click
        history_div.Visible = False
    End Sub
    Protected Sub Submitfeed_click(sender As Object, e As EventArgs) Handles submit_feed.Click
        Try
            Dim aa As String
            aa = Server.MapPath("/App_Data\Database1.mdf")
            Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
            Dim cmd As New SqlCommand("insert into doctor_feedback(email,feed) values(@email,@feed)", con)
            cmd.Parameters.AddWithValue("@email", received)
            cmd.Parameters.AddWithValue("@feed", feed.Text)
            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
            'modal_feedback.Visible = True
            feed1.Visible = False
            feed_success.Visible = True
        Catch ex As Exception

        End Try
    End Sub


    Protected Sub Seedetails_click(sender As Object, e As EventArgs) Handles see_details.Click
        Try
            firstone.Visible = False
            Dim aa As String
            aa = Server.MapPath("/App_Data\Database1.mdf")
            Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
            Dim cmd As New SqlCommand("select * from doctor where emailid=@email", con)
            cmd.Parameters.AddWithValue("@email", received)
            Dim dr As SqlDataReader
            con.Open()
            dr = cmd.ExecuteReader
            dr.Read()
            e_name.Text = dr(1)
            e_email.Text = dr(2)
            e_age.Text = dr(4)
            e_address.Text = dr(6)
            e_contact.Text = dr(3)
            e_gender.Text = dr(5)
            'e_category.Text = dr(7)
            'e_fee.Text = dr(12)
            'e_experience.Text = dr(11)
            'e_time.Text = Convert.ToString(dr(12))
            dr.Close()
            con.Close()
            Dim imagepath As String = "~/doctorimages/" + received + ".jpg"
            profile_image.ImageUrl = imagepath
            secondone.Visible = True
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub hidedetails_click(sender As Object, e As EventArgs) Handles hide_details.Click
        secondone.Visible = False
        firstone.Visible = True

    End Sub
    Protected Sub abcd(sender As Object, e As EventArgs)
        Dim str As String = imgupload.FileName
        MsgBox(str)
        profile_image.ImageUrl = str
    End Sub

    Protected Sub updateimg_click(sender As Object, e As EventArgs) Handles update_img.Click
        Dim folderpath As String = Server.MapPath("~/doctorimages/")
        Dim fullpath, extension As String

        extension = System.IO.Path.GetExtension(imgupload.PostedFile.FileName)
        fullpath = folderpath + received + ".jpg"

        imgupload.SaveAs(fullpath)


    End Sub
    Protected Sub user_image_validation(sender As Object, e As ServerValidateEventArgs)
        Dim extension As String
        extension = System.IO.Path.GetExtension(imgupload.PostedFile.FileName)
        If extension = ".JPG" Or extension = ".JPEG" Then
            update_img.Enabled = True
            e.IsValid = True
        Else
            '  update_img.Enabled = False
            e.IsValid = False

        End If

        Dim folderpath As String = Server.MapPath("~/doctorimages/")
        Dim fullpath As String

        extension = System.IO.Path.GetExtension(imgupload.PostedFile.FileName)
        fullpath = folderpath + received + ".jpg"

        imgupload.SaveAs(fullpath)
    End Sub
    Protected Sub log_no_click(sender As Object, e As EventArgs) Handles logno.Click
        'manu.Focus()
    End Sub
    Protected Sub log_yes_click(sender As Object, e As EventArgs) Handles logyes.Click
        Response.Redirect("default.aspx")
    End Sub

    Protected Sub rpwd_Click(sender As Object, e As EventArgs)
        Try
            MsgBox("Reset pwd called")
            Dim aa As String
            aa = Server.MapPath("/App_Data\Database1.mdf")
            Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
            Dim cmd As New SqlCommand("update doctor SET doctor_password=@newpwd where doctor_password=@oldpwd and emailid=@user", con)
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