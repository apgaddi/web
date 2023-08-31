<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MonthlySales.aspx.cs" Inherits="WebApp.MonthlySales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <div>
        <table style="width:1530px">
                <tr>
                    <td style="background-color:#ED1C28; width:1540px">
                        <img src="images/veloxlogo1.png"  />
                    </td>
                </tr>
          </table>
        </div>        
        <div>
            <table style="width:1530px;background-color:#ED1C28">
                <tr>
                    <td style="width:1460px; height:10px">
                        <asp:Label ID="lblUser" runat="server" Text="Label" Forecolor="white"></asp:Label>
                        <asp:Label ID="lblPass" runat="server" Text="Label" Forecolor="white"></asp:Label>
                        <asp:Button ID="btnCuInv" runat="server" OnClick="btnCuInv_Click" Text="Current Inventory" Height="30px" Width="150px" BackColor="red" ForeColor="White" />
                        <asp:Button ID="btnOrder" runat="server" Height="30px" Text="Order" Width="100px" OnClick="btnOrder_Click" BackColor="red" ForeColor="White" />
                        <asp:Button ID="btnInvRecon" runat="server" Height="30px" Text="Inventory Reconciliation" Width="200px" OnClick="bntInvRecon_Click" BackColor="red" ForeColor="White"/>
                        <asp:Button ID="btnATG" runat="server" Height="30px" Text="ATG Delivery" Width="100px" OnClick="btnATG_Click" BackColor="red" ForeColor="White" />
                        <asp:Button ID="btnLogOut" runat="server" Height="30px" Text="Log Out" Width="100px" OnClick="bntLogOut_Click" BackColor="red" ForeColor="White" />
                    </td>
                </tr>
            </table>
        </div>

        <div style="width:1530px;background-color:#ED1C28">
            
                 <asp:Label ID="lblInv" runat="server" Text="Region:   " ForeColor="White"></asp:Label>
                        <asp:DropDownList ID="ddlRegion"  runat="server" AutoPostBack = "true" ontextchanged="ontextchanged" AppendDataBoundItems="True">
                        <asp:ListItem Selected="True" Value="0" Text="--Select--"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="Label2" runat="server">0</asp:Label>
                <asp:Label ID="Label1" runat="server" Text="Station:   " ForeColor="White"></asp:Label>
                        <asp:DropDownList ID="ddlStation"  runat="server" AutoPostBack = "true" ontextchanged="ontextchanged" AppendDataBoundItems="True">
                        <asp:ListItem Selected="True" Value="0" Text="--Select--"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="Label3" runat="server">0</asp:Label>
                <asp:Label ID="Label5" runat="server" Text="Beginning Month:   " ForeColor="White"></asp:Label>
                        <asp:DropDownList ID="ddlBegMth"  runat="server" AutoPostBack = "true" ontextchanged="ontextchanged" AppendDataBoundItems="True">
                        <asp:ListItem Selected="True" Value="0" Text="--Select--"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="Label6" runat="server">0</asp:Label>
                <asp:Label ID="Label7" runat="server" Text="Ending Month:   " ForeColor="White"></asp:Label>
                        <asp:DropDownList ID="ddlEndMth"  runat="server" AutoPostBack = "true" ontextchanged="ontextchanged" AppendDataBoundItems="True">
                        <asp:ListItem Selected="True" Value="0" Text="--Select--"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="Label8" runat="server">0</asp:Label>
                <asp:Button ID="bntGenerate" runat="server" Height="37px" Text="Generate" Width="109px" OnClick="bntGenerate_Click" />
                        
        </div>
        <div style="width:1530px;background-image: url('images/velox1.jpg'); background-repeat:repeat">
            <table>
            <tr>
                    <td> 
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <h1 class="h1">Monthly Sales Summary</h1>
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
                                    <asp:BoundField DataField="StationName" DataFormatString="" HeaderText="Station" SortExpression="StationName" FooterText="Total"/>
                                    <asp:BoundField DataField="Region" DataFormatString="" HeaderText="Region" SortExpression="Region" />
                                    <asp:BoundField DataField="Month" DataFormatString="" HeaderText="Month" SortExpression="Month" />
                                    <asp:BoundField DataField="Year" DataFormatString="" HeaderText="Year" SortExpression="Year" />
                                    <asp:BoundField DataField="Diesel" DataFormatString="{0:N}" HeaderText="Diesel" SortExpression="Diesel" />
                                    <asp:BoundField DataField="Unleaded" DataFormatString="{0:N}" HeaderText="Unleaded" SortExpression="Unleaded" />
                                    <asp:BoundField DataField="Premium" DataFormatString="{0:N}" HeaderText="Premium" SortExpression="Premium" />
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
	                                Station.StationName as [StationName], 
	                                Region.Region as [Region],
	                                format([Date],'MMMM') as [Month],
	                                datepart(year,[Date]) as [Year],
	                                sum(SalesData.Diesel) as Diesel, 
	                                sum(SalesData.Unleaded) as Unleaded, 
	                                sum(SalesData.Premium) as Premium,
	                                sum(SalesData.Diesel+SalesData.Unleaded+SalesData.Premium) as [Total],
                                    datepart(month,[Date]) as [MonthNumber]
                                FROM     
	                                SalesData
                                INNER JOIN
                                    Station ON SalesData.StationID = Station.StationCode 
                                INNER JOIN
                                    Region ON Station.Region = Region.ID
                                group by
	                                StationName,
	                                datepart(year,[Date]),
	                                format([Date],'MMMM'),
	                                datepart(month,[Date]),
	                                Region.Region
                                order by
	                                datepart(month,[Date])"
                                filterexpression="">
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
