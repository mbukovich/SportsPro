<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentPage.aspx.cs" Inherits="SportsPro.IncidentPage" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css"> 
        .header {background-color: gainsboro;} 
        .content {border: solid;}
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
        .auto-style8 {
            color: peru;
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
            <br />
            <hr />
            Navigate to 
            <asp:HyperLink ID="HyperLinkCustomers" runat="server" NavigateUrl="~/CustomerDisplay.aspx">Customer Display Page</asp:HyperLink>
            <hr />
            <br />
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            Please select a customer: 
            <asp:DropDownList ID="ddl_customers" runat="server" AutoPostBack="True" TabIndex="0">
            </asp:DropDownList>
            <br />
            <br />
            <ajaxToolkit:TabContainer ID="TabContainer1" runat="server">
                <ajaxToolkit:TabPanel ID="tb_view" runat="server" HeaderText="View Incidents">
                    <ContentTemplate>
                        <p>
                            <ajaxToolkit:Accordion ID="Accd_Incident_View" runat="server" HeaderCssClass="header" HeaderSelectedCssClass="header" ContentCssClass="content" TransitionDuration="250">
                                <HeaderTemplate>
                                    <%#DataBinder.Eval(Container.DataItem, "Title")%>
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:Table runat="server">
                                        <asp:TableRow>
                                            <asp:TableCell Width="10px"></asp:TableCell>
                                            <asp:TableCell>
                                                Incident ID: 
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <%#DataBinder.Eval(Container.DataItem, "IncidentID")%>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Width="10px"></asp:TableCell>
                                            <asp:TableCell>
                                                Technician ID: 
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <%#DataBinder.Eval(Container.DataItem, "TechID")%>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Width="10px"></asp:TableCell>
                                            <asp:TableCell>
                                                Customer ID: 
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <%#DataBinder.Eval(Container.DataItem, "CustomerID")%>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Width="10px"></asp:TableCell>
                                            <asp:TableCell>
                                                Product Code: 
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <%#DataBinder.Eval(Container.DataItem, "ProductCode")%>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Width="10px"></asp:TableCell>
                                            <asp:TableCell>
                                                Date Opened: 
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <%#DataBinder.Eval(Container.DataItem, "DateOpened")%>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Width="10px"></asp:TableCell>
                                            <asp:TableCell>
                                                Date Closed: 
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <%#DataBinder.Eval(Container.DataItem, "DateClosed")%>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Width="10px"></asp:TableCell>
                                            <asp:TableCell>
                                                Description: 
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <%#DataBinder.Eval(Container.DataItem, "Description")%>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell Width="10px"></asp:TableCell>
                                            <asp:TableCell>

                                            </asp:TableCell>
                                            <asp:TableCell>

                                            </asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                </ContentTemplate>
                            </ajaxToolkit:Accordion>
                            <p>
                            </p>
                        </p>
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel ID="tb_add" runat="server" HeaderText="Add New Incident">
                    <ContentTemplate>
                        <p class="auto-style7">
                            Enter an Incident:
                        </p>
                        <br />
                        <asp:Table runat="server">
                            <asp:TableRow>
                                <asp:TableCell Width="150px">
                                    <asp:Label ID="lbl_technicianError" runat="server" Text="You must select a Technician" CssClass="auto-style8" Visible="false"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Right">
                                    Select Technician: 
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:DropDownList ID="ddl_technicians" runat="server" TabIndex="1" AutoPostBack="True"></asp:DropDownList>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell Width="150px">
                                    <asp:Label ID="lbl_productsError" runat="server" Text="You must select a product" CssClass="auto-style8" Visible="false"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Right">
                                    Select Product: 
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:DropDownList ID="ddl_products" runat="server" TabIndex="2" AutoPostBack="True"></asp:DropDownList>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell Width="150px">
                                    <asp:Label ID="lbl_titleError" runat="server" Text="You must enter an incident title" CssClass="auto-style8" Visible="false"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Right">
                                    Title: 
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox ID="tb_title" runat="server" TabIndex="3"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell Width="150px">
                                    <asp:Label ID="lbl_descError" runat="server" Text="You must enter a description" CssClass="auto-style8" Visible="false"></asp:Label>
                                </asp:TableCell>
                                <asp:TableCell HorizontalAlign="Right">
                                    Description: 
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:TextBox ID="tb_description" runat="server" TabIndex="4"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell Width="150px"></asp:TableCell>
                                <asp:TableCell></asp:TableCell>
                                <asp:TableCell>
                                    <asp:Button ID="btn_submit" runat="server" Text="Add Incident" OnClick="btn_submit_Click" TabIndex="5"/>
                                    <br />
                                    <asp:Label ID="lbl_submitted" runat="server" Text=""></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel ID="tb_close" runat="server" HeaderText="Close An Incident">
                    <ContentTemplate>
                        <p class="auto-style7">
                            Select an Incident and Click "Close Incident":
                        </p>
                        <br />
                        <asp:Table runat="server">
                            <asp:TableRow>
                                <asp:TableCell>
                                    Currently Open Incidents: 
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:DropDownList ID="ddl_openIncidents" runat="server" AutoPostBack="True"></asp:DropDownList>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell></asp:TableCell>
                                <asp:TableCell>
                                    <asp:Button ID="btn_closeIncident" runat="server" Text="Close Incident" OnClick="btn_closeIncident_Click" PostBackUrl="~/IncidentPage.aspx" />
                                    <br />
                                    <asp:Label ID="lbl_incident_close" runat="server" Text=""></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
            </ajaxToolkit:TabContainer>

            


            
        </div>
    </form>
</body>
</html>
