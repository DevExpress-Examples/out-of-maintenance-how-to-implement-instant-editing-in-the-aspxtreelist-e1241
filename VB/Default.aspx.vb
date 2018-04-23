Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls

Namespace InstantEditing
	Partial Public Class _Default
		Inherits System.Web.UI.Page
		Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
			If (Not IsPostBack) Then
				ASPxTreeList1.DataBind()
				ASPxTreeList1.ExpandAll()
				If ASPxTreeList1.FocusedNode Is Nothing Then
					ASPxTreeList1.Nodes(0).Focus()
				End If
				ASPxTreeList1.StartEdit(ASPxTreeList1.FocusedNode.Key)
			End If
		End Sub

		Protected Sub ASPxTreeList1_CustomCallback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxTreeList.TreeListCustomCallbackEventArgs)
			Dim param() As String = e.Argument.Split(";"c)
			If param.Length = 2 AndAlso param(0) = "UpdateAndEdit" Then
				ASPxTreeList1.UpdateEdit()
				ASPxTreeList1.StartEdit(param(1))
			End If
		End Sub
	End Class
End Namespace
