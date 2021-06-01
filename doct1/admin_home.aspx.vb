Public Class admin_home
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("usr") = "" Then
            Response.Redirect("adminlogin.aspx")

        End If
    End Sub

End Class