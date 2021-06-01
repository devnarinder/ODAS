Imports System.Data.SqlClient

Public Class booking
    Inherits System.Web.UI.Page
    Dim received As String
    Dim user_email, doctor_email As String
    Dim username As String
    Dim userage As String
    Dim usercontact As String



    Protected Sub p_nameleave(ByVal sender As Object, ByVal e As System.EventArgs) Handles p_name.TextChanged

        username = p_name.Text

    End Sub

    Protected Sub p_ageleave(ByVal sender As Object, ByVal e As System.EventArgs) Handles p_age.TextChanged

        userage = p_age.Text

    End Sub

    Protected Sub p_contactleave(ByVal sender As Object, ByVal e As System.EventArgs) Handles p_contact.TextChanged

        usercontact = p_contact.Text

    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        received = Request.QueryString("Passthevalue")
        Dim aa As String
        aa = Server.MapPath("/App_Data\Database1.mdf")
        Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")

        ' MsgBox("load called")
        Dim pos As Int16
        pos = received.IndexOf(Convert.ToChar("`"))
        user_email = received.Substring(0, pos)
        doctor_email = received.Substring(pos + 1, received.Length - (pos + 1))
        Dim query2 As String
        query2 = "select name,fee,contact_no,Address,timing from doctor  where emailid=@doct_email"
        Dim cmd2 As New SqlCommand(query2, con)
        cmd2.Parameters.AddWithValue("@doct_email", doctor_email)
        Dim dr2 As SqlDataReader
        con.Open()
        dr2 = cmd2.ExecuteReader
        If dr2.HasRows Then
            dr2.Read()
            d_name.Text = dr2(0)
            d_fee.Text = dr2(1).ToString
            d_phone.Text = dr2(2)
            d_address.Text = dr2(3)
            d_time.Text = dr2(4).ToString
        End If
        dr2.Close()
        con.Close()


        Dim query As String
        query = "select name,contactno,age from regis_user1 where emailid =@email"
        Dim cmd As New SqlCommand(query, con)
        cmd.Parameters.AddWithValue("@email", user_email)
        Dim dr As SqlDataReader
        con.Open()
        dr = cmd.ExecuteReader
        If dr.HasRows Then
            dr.Read()
            'p_name.Text = dr(0)
            'p_contact.Text = dr(1)
            'p_age.Text = dr(2)
        End If

        dr.Close()
        con.Close()



    End Sub

    Protected Sub confirm(ByVal sender As Object, ByVal e As EventArgs)
        Try
            Dim b_date As Date = Date.Now
            Dim b_time As TimeSpan = b_date.TimeOfDay
            Dim aa As String
            aa = Server.MapPath("/App_Data\Database1.mdf")
            Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
            Dim query As String
            query = "insert into bookings(patient_name,patient_email,patient_age,patient_contact,patient_problem,doctor_email,status,doctor_name,date,time,doctor_address,fee) values(@p_name,@p_email,@p_age,@p_contact,@p_problem,@d_email,@status,@dname,@date,@time,@address,@fee)"
            Dim cmd As New SqlCommand(query, con)
            ' MsgBox(p_name.Text)
            cmd.Parameters.AddWithValue("@p_name", username)
            cmd.Parameters.AddWithValue("@p_email", user_email)
            cmd.Parameters.AddWithValue("@p_age", userage)
            cmd.Parameters.AddWithValue("@p_contact", usercontact)
            cmd.Parameters.AddWithValue("@p_problem", p_problem.Text)
            cmd.Parameters.AddWithValue("@d_email", doctor_email)
            cmd.Parameters.AddWithValue("@dname", d_name.Text)
            cmd.Parameters.AddWithValue("@status", "pending")
            cmd.Parameters.AddWithValue("@date", b_date)
            cmd.Parameters.AddWithValue("@time", d_time.Text)
            cmd.Parameters.AddWithValue("@address", d_address.Text)
            cmd.Parameters.AddWithValue("@fee", d_fee.Text)

            con.Open()
            Dim a As Int32
            a = cmd.ExecuteNonQuery()
            If a > 0 Then
                MsgBox("Message : Request Submitted" + vbLf + "Status Pending")
                con.Close()
                Response.Redirect("patient_home.aspx?passthevalue=" + user_email)
            End If
            'MsgBox("success")
            con.Close()
        Catch ex As Exception
            ' MsgBox(Convert.ToString(ex))
        End Try
    End Sub

End Class