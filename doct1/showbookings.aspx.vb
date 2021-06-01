Imports System.Data.SqlClient

Public Class showbookings
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        showbookings.Visible = True
        Dim aa As String
        aa = Server.MapPath("/App_Data\Database1.mdf")
        Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
        Dim adp As New SqlDataAdapter("select * from bookings ", con)

        Dim ds As New DataSet

        adp.Fill(ds)
        showbookings.DataSource = ds.Tables(0)

        showbookings.DataBind()
    End Sub

    Protected Sub filter_click(ByVal sender As Object, ByVal e As System.EventArgs) Handles filter.Click

        Dim aa As String
        aa = Server.MapPath("/App_Data\Database1.mdf")
        Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
        Dim adp As New SqlDataAdapter("select * from bookings where patient_name Like'" + search_patientname.Text + "%'", con)

        Dim ds As New DataSet

        adp.Fill(ds)
        showbookings.DataSource = ds.Tables(0)

        showbookings.DataBind()
    End Sub
    Protected Sub filter2_click(ByVal sender As Object, ByVal e As System.EventArgs) Handles filter2.Click
        Try
            Dim aa As String
            aa = Server.MapPath("/App_Data\Database1.mdf")
            Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
            Dim adp As New SqlDataAdapter("select * from bookings where booking_id =" + search_bookingid.Text, con)

            Dim ds As New DataSet

            adp.Fill(ds)
            showbookings.DataSource = ds.Tables(0)

            showbookings.DataBind()
        Catch
            'MsgBox("Error")
        End Try
    End Sub
    Protected Sub clearfilter_click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clearfilter.Click
        Dim aa As String
        aa = Server.MapPath("/App_Data\Database1.mdf")
        Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
        Dim adp As New SqlDataAdapter("select * from bookings ", con)

        Dim ds As New DataSet

        adp.Fill(ds)
        showbookings.DataSource = ds.Tables(0)

        showbookings.DataBind()
    End Sub

    Protected Sub clearfilter2_click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clearfilter2.Click
        Dim aa As String
        aa = Server.MapPath("/App_Data\Database1.mdf")
        Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
        Dim adp As New SqlDataAdapter("select * from bookings ", con)

        Dim ds As New DataSet

        adp.Fill(ds)
        showbookings.DataSource = ds.Tables(0)

        showbookings.DataBind()
    End Sub
End Class