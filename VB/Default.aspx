<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="InstantEditing._Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dxwtl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<title>Instant Editing in ASPxTreeList</title>
</head>
<body>
	<form id="form1" runat="server">
	<div>
		<dxwtl:ASPxTreeList ID="ASPxTreeList1" runat="server" ClientInstanceName="tree" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="EmployeeID" ParentFieldName="ReportsTo" Width="179px" OnCustomCallback="ASPxTreeList1_CustomCallback" >
			<Columns>
				<dxwtl:TreeListTextColumn FieldName="FirstName" VisibleIndex="0">
				</dxwtl:TreeListTextColumn>
				<dxwtl:TreeListTextColumn FieldName="LastName" VisibleIndex="1">
				</dxwtl:TreeListTextColumn>
				<dxwtl:TreeListTextColumn FieldName="Title" VisibleIndex="2">
				</dxwtl:TreeListTextColumn>
			</Columns>
			<ClientSideEvents NodeClick="function(s, e) {
	if(e.nodeKey != s.GetEditingNodeKey())
		s.PerformCustomCallback('UpdateAndEdit;' + e.nodeKey)
}" />
		</dxwtl:ASPxTreeList>
		<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
			DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = @EmployeeID" InsertCommand="INSERT INTO [Employees] ([LastName], [FirstName], [Title], [ReportsTo]) VALUES (@LastName, @FirstName, @Title, @ReportsTo)"
			SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title], [ReportsTo] FROM [Employees]"
			UpdateCommand="UPDATE [Employees] SET [LastName] = @LastName, [FirstName] = @FirstName, [Title] = @Title, [ReportsTo] = @ReportsTo WHERE [EmployeeID] = @EmployeeID">
			<DeleteParameters>
				<asp:Parameter Name="EmployeeID" Type="Int32" />
			</DeleteParameters>
			<UpdateParameters>
				<asp:Parameter Name="LastName" Type="String" />
				<asp:Parameter Name="FirstName" Type="String" />
				<asp:Parameter Name="Title" Type="String" />
				<asp:Parameter Name="ReportsTo" Type="Int32" />
				<asp:Parameter Name="EmployeeID" Type="Int32" />
			</UpdateParameters>
			<InsertParameters>
				<asp:Parameter Name="LastName" Type="String" />
				<asp:Parameter Name="FirstName" Type="String" />
				<asp:Parameter Name="Title" Type="String" />
				<asp:Parameter Name="ReportsTo" Type="Int32" />
			</InsertParameters>
		</asp:SqlDataSource>
	</div>
	</form>
</body>
</html>
