Imports System.Data.SqlClient

Public Class adminlogin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub submit_click(ByVal sender As Object, ByVal e As System.EventArgs) Handles submit.Click
        Dim aa As String
        aa = Server.MapPath("/App_Data\Database1.mdf")
        Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")

        Dim query As String
        query = "select * from admin where username =@userid and password =@userpwd"
        Dim cmd As New SqlCommand(query, con)
        cmd.Parameters.AddWithValue("@userid", username.Text)
        cmd.Parameters.AddWithValue("@userpwd", pwd.Text)
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
            Dim pass As String = username.Text
            Session("usr") = username.Text
            Response.Redirect("admin_home.aspx?Passthevalue=" + pass)
        Else
            MsgBox("Invalid Details")
        End If
        dr.Close()
        con.Close()

    End Sub
End Class