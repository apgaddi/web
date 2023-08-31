<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sales.aspx.cs" Inherits="WebApp.Sales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <div>
        <table>
                <tr>
                    <td style="background-color:#ED1C28; width:1440px">
                        <img src="images/veloxlogo1.png"  />
                    </td>
                </tr>
          </table>
        </div>        
        <div>
            <table style="background-color:red">
                <tr>
                    <td style="width:1440px; height:10px">
                        <asp:Label ID="lblUser" runat="server" Text="Label" Forecolor="white"></asp:Label>
                        <asp:Label ID="lblPass" runat="server" Text="Label" Forecolor="white"></asp:Label>
                        <asp:Button ID="btnMain" runat="server" Height="30px" Text="Main" Width="100px" OnClick="bntMain_Click" BackColor="red" ForeColor="White"/>
                        <asp:Button ID="Button1" runat="server" Height="30px" Text="Main" Width="100px" OnClick="bntMain_Click" BackColor="red" Visible="False" />
                        <asp:Button ID="btnLogOut" runat="server" Height="30px" Text="Log Out" Width="100px" OnClick="bntLogOut_Click" BackColor="red" ForeColor="White" />
                    </td>
                </tr>
            </table>
        </div>

        <div>
            <%--version 3 modifications--%>
                <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
                <script type="text/javascript" src="http://code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
                <link rel="stylesheet" media="all" type="text/css" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css" />
            <%--version 3 modifications--%>

             <%-- version 3 modifications --%>
                <asp:Label ID="lblSDateFuelInv" runat="server" Text="    Start Date:"></asp:Label>
                <asp:TextBox ID="txtSDateFuelInv" runat="server" Width="100"></asp:TextBox>        
                    <script type="text/javascript">
                        $(document).ready(function () {
                        $("#<%= txtSDateFuelInv.ClientID%>").datepicker({ dateFormat: "mm/dd/yy" });
                        });
                    </script>

        
                <asp:Label ID="lblEDateFuelInv" runat="server" Text="   End Date:"></asp:Label>
                <asp:TextBox ID="txtEDateFuelInv" runat="server" Width="100"></asp:TextBox> 
                    <script type="text/javascript">
                        $(document).ready(function () {
                        $("#<%= txtEDateFuelInv.ClientID%>").datepicker({ dateFormat: "mm/dd/yy" });
                        });
                    </script>
        <%-- version 3 modifications --%> 
                <asp:Button ID="bntGenerate" runat="server" Height="37px" Text="Generate" Width="109px" OnClick="bntGenerate_Click" />
        </div>
        <div style="background-image: url('images/velox1.jpg'); background-repeat:repeat">
            <table>
            <tr>
                    <td> 
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <h1 class="h1">Sales Summary</h1>
                    </td>
                </tr>
                <tr>
                    <td> 
                    </td>
                </tr>
                <tr>
                    <td colspan="3"> 
                        <asp:GridView ID="gvSales" runat="server" CellPadding="3" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ShowFooter="true" OnRowDataBound="gvSales_RowDataBound" Width="878px">
                                <AlternatingRowStyle BackColor="#DCDCDC" />
                                <Columns>
                                    <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date" SortExpression="Date" FooterText="Total"/>
                                    <asp:BoundField DataField="Batch" DataFormatString="" HeaderText="Batch" SortExpression="Batch" />
                                    <asp:BoundField DataField="Cash" DataFormatString="{0:N}" HeaderText="Cash Sales" SortExpression="Cash" />
                                    <asp:BoundField DataField="PO" DataFormatString="{0:N}" HeaderText="PO Sales" SortExpression="PO" />
                                    <asp:BoundField DataField="NonCash" DataFormatString="{0:N}" HeaderText="Other Non-Cash" SortExpression="NonCash" />
                                    <asp:BoundField DataField="Total" DataFormatString="{0:N}" HeaderText="Total Sales" SortExpression="Total" />
                                </Columns>
                                <FooterStyle BackColor="#FFFFCC" Font-Bold="True" ForeColor="Blue" />
                                <HeaderStyle BackColor="#FFFFCC" Font-Bold="True" ForeColor="Blue" />
                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#000065" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" ProviderName="<%$ ConnectionStrings:connect.ProviderName %>" 
                            SelectCommand="
                                SELECT         
	                                convert(date,Date) as [Date], 
	                                Batch,
                                    Cash,
                                    PO,
                                    NonCash,
                                    Total
                                FROM 
                                    [SalesData]
                                where webUpdate=1
                                order by [Date]"
                                filterexpression="">
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
