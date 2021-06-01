Imports System.Data.SqlClient

Public Class showpatients
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        showpatient.Visible = True
        Dim aa As String
        aa = Server.MapPath("/App_Data\Database1.mdf")
        Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
        Dim adp As New SqlDataAdapter("select * from regis_user1", con)

        Dim ds As New DataSet

        adp.Fill(ds)
        showpatient.DataSource = ds.Tables(0)

        showpatient.DataBind()
    End Sub

    Protected Sub filter_click(ByVal sender As Object, ByVal e As System.EventArgs) Handles filter.Click
        Dim aa As String
        aa = Server.MapPath("/App_Data\Database1.mdf")
        Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
        Dim adp As New SqlDataAdapter("select * from regis_user1 where name like '" + search_name.Text + "%'" _
            + "and address like '" + search_location.Text + "%'", con)

        Dim ds As New DataSet

        adp.Fill(ds)
        showpatient.DataSource = ds.Tables(0)

        showpatient.DataBind()
    End Sub

    Protected Sub clearfilter_click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clearfilter.Click
        Dim aa As String
        aa = Server.MapPath("/App_Data\Database1.mdf")
        Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
        Dim adp As New SqlDataAdapter("select * from regis_user1", con)

        Dim ds As New DataSet

        adp.Fill(ds)
        showpatient.DataSource = ds.Tables(0)

        showpatient.DataBind()
    End Sub
End Class