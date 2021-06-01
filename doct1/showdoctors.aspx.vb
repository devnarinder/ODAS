Imports System.Data.SqlClient

Public Class showdoctors
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        showdoctors.Visible = True
        Dim aa As String
        aa = Server.MapPath("/App_Data\Database1.mdf")
        Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
        Dim adp As New SqlDataAdapter("select * from doctor", con)

        Dim ds As New DataSet

        adp.Fill(ds)
        showdoctors.DataSource = ds.Tables(0)

        showdoctors.DataBind()
    End Sub

    Protected Sub filter_click(ByVal sender As Object, ByVal e As System.EventArgs) Handles filter.Click

        Dim aa As String
        aa = Server.MapPath("/App_Data\Database1.mdf")
        Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
        Dim adp As New SqlDataAdapter("select * from doctor where category='" + choose_category.SelectedItem.Text + "' and name like'" _
                                      + search_name.Text + "%' and Address like '" + search_location.Text + "%'", con)

        Dim ds As New DataSet

        adp.Fill(ds)
        showdoctors.DataSource = ds.Tables(0)

        showdoctors.DataBind()
    End Sub

    Protected Sub clearfilter_click(ByVal sender As Object, ByVal e As System.EventArgs) Handles clearfilter.Click
        Dim aa As String
        aa = Server.MapPath("/App_Data\Database1.mdf")
        Dim con As New SqlConnection("Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + aa + " ;Integrated Security=True")
        Dim adp As New SqlDataAdapter("select * from doctor ", con)

        Dim ds As New DataSet

        adp.Fill(ds)
        showdoctors.DataSource = ds.Tables(0)

        showdoctors.DataBind()
    End Sub
End Class