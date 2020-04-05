<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerDisplay.aspx.cs" Inherits="SportsPro.CustomerDisplay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 23px;
            width: 600px;
        }
        .auto-style3 {
            height: 23px;
            width: 122px;
        }
        .auto-style4 {
            width: 122px;
        }
        .auto-style5 {
            width: 600px;
        }
        .auto-style6 {
            font-size: xx-large;
            color: #0000FF;
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style7 {
            color: #CC3300;
            font-size: large;
            font-family: Arial, Helvetica, sans-serif;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 class="auto-style6"><em>SportsPro</em></h1>
            <p class="auto-style7">
                Sports management software for the sports enthusiast</p>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CustomerID], [Name], [Address], [City], [State], [ZipCode], [Phone], [Email] FROM [Customers] ORDER BY [Name]"></asp:SqlDataSource>
            <br />
            <br />
            Select a Customer: <asp:DropDownList ID="CustomerDDL" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="CustomerID" AutoPostBack="True">
            </asp:DropDownList>
            <br />
            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">Address:</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBoxAddress" runat="server" ReadOnly="True" TextMode="MultiLine" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Phone: </td>
                    <td class="auto-style5">
                        <asp:Label ID="LabelPhone" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Email: </td>
                    <td class="auto-style5">
                        <asp:Label ID="LabelEmail" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <p>
        Mark Bukovich</p>
</body>
</html>
