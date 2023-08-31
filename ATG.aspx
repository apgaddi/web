<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ATG.aspx.cs" Inherits="WebApp.ATG" %>

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
                    <td style="background-color:#ED1C28; width:1530px">
                        <img src="images/veloxlogo1.png"  />
                    </td>
                </tr>
          </table>
        </div>        
        <div>
            <table style="background-color:#ED1C28">
                <tr>
                    <td style="width:1530px; height:10px">
                        <asp:Label ID="lblUser" runat="server" Text="Label" Forecolor="white"></asp:Label>
                        <asp:Label ID="lblPass" runat="server" Text="Label" Forecolor="white"></asp:Label>
                        <asp:Button ID="btnCuInv" runat="server" OnClick="btnCuInv_Click" Text="Current Inventory" Height="30px" Width="150px" BackColor="red" ForeColor="White" />
                        <asp:Button ID="btnInvRecon" runat="server" Height="30px" Text="Inventory Reconciliation" Width="200px" OnClick="bntInvRecon_Click" BackColor="red" ForeColor="White"/>
                        <asp:Button ID="btnOrder" runat="server" Height="30px" Text="Order" Width="100px" OnClick="btnOrder_Click" BackColor="red" ForeColor="White" />
                        <asp:Button ID="btnSales" runat="server" Height="30px" Text="Sales" Width="100px" OnClick="btnSales_Click" BackColor="red" ForeColor="White" />
                        <asp:Button ID="btnLogOut" runat="server" Height="30px" Text="Log Out" Width="100px" OnClick="bntLogOut_Click" BackColor="red" ForeColor="White" />
                    </td>
                </tr>
            </table>
        </div>

       

        <div style="background-image: url('images/velox1.jpg'); background-repeat:repeat;width:1530px" >
            
         <table>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Region:   " ForeColor="White"></asp:Label>
                        <asp:DropDownList ID="ddlRegion"  runat="server" AutoPostBack = "true" ontextchanged="ontextchanged" AppendDataBoundItems="True">
                        <asp:ListItem Selected="True" Value="0" Text="--Select--"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="Label3" runat="server">0</asp:Label>
                <asp:Label ID="Label4" runat="server" Text="Station:   " ForeColor="White"></asp:Label>
                        <asp:DropDownList ID="ddlStation"  runat="server" AutoPostBack = "true" ontextchanged="ontextchanged" AppendDataBoundItems="True">
                        <asp:ListItem Selected="True" Value="0" Text="--Select--"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="Label5" runat="server">0</asp:Label>
                    </td>
                    
                    <td>
                        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
                        <script type="text/javascript" src="http://code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
                        <link rel="stylesheet" media="all" type="text/css" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css" />
            
                        <asp:Label ID="lblSDateFuelInv" runat="server" Text="    Start Date:" ForeColor="White"></asp:Label>
                        <asp:TextBox ID="txtSDateFuelInv" runat="server" Width="100"></asp:TextBox>        
                            <script type="text/javascript">
                            $(document).ready(function () {
                            $("#<%= txtSDateFuelInv.ClientID%>").datepicker({ dateFormat: "mm/dd/yy" });
                            });
                            </script>
                    </td>

                    <td>
                        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
                        <script type="text/javascript" src="http://code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
                        <link rel="stylesheet" media="all" type="text/css" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css" />
            
                        <asp:Label ID="lblEDateFuelInv" runat="server" Text="   End Date:" ForeColor="White"></asp:Label>
                        <asp:TextBox ID="txtEDateFuelInv" runat="server" Width="100"></asp:TextBox> 
                            <script type="text/javascript">
                            $(document).ready(function () {
                            $("#<%= txtEDateFuelInv.ClientID%>").datepicker({ dateFormat: "mm/dd/yy" });
                            });
                            </script>
                    </td>

                    <td>
                       
                        <asp:Button ID="bntGenerate" runat="server" Height="37px" Text="Generate" Width="109px" OnClick="bntGenerate_Click" />
                        <asp:Button ID="btnExcel" runat="server" Height="37px" Text="Export to Excel" Width="109px" OnClick="btnExcel_Click" />

                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <h1 class="h1">Delivery Analysis</h1>
                    </td>
                </tr>
                <tr>
                    <td> 
                    </td>
                </tr>
                <tr>
                    <td colspan="9"> 
                        <asp:GridView ID="gvInvRecon" runat="server" CellPadding="3" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ShowFooter="true" OnRowDataBound="gvInvRecon_RowDataBound" Width="1349px">
                                <AlternatingRowStyle BackColor="#DCDCDC" />
                                <Columns>
                                    <asp:BoundField DataField="Region" DataFormatString="" HeaderText="Region" SortExpression="Region" FooterText="Total"/>
                                    <asp:BoundField DataField="StationName" DataFormatString="" HeaderText="Station" SortExpression="StationName" />
                                    <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date" SortExpression="Date"/>
                                    <asp:BoundField DataField="Batch" DataFormatString="" HeaderText="Batch" SortExpression="Batch" />
                                    <asp:BoundField DataField="Product" DataFormatString="" HeaderText="Product" SortExpression="Product" />
                                    <asp:BoundField DataField="BegATG" DataFormatString="{0:N}" HeaderText="Beginning ATG" SortExpression="BegATG" />
                                    
                                    <asp:BoundField DataField="EndATG" DataFormatString="{0:N}" HeaderText="Ending ATG" SortExpression="EndATG" />
                                    <asp:BoundField DataField="PumpSales" DataFormatString="{0:N}" HeaderText="Pump Sales" SortExpression="PumpSales" />
                                    <asp:BoundField DataField="DeliveryReceived" DataFormatString="{0:N}" HeaderText="Delivery Received" SortExpression="DeliveryReceived" />
                                    <asp:BoundField DataField="EncodedDelivery" DataFormatString="{0:N}" HeaderText="Encoded Delivery" SortExpression="EncodedDelivery" />
                                    <asp:BoundField DataField="Var" DataFormatString="{0:N}" HeaderText="Vol Variance" SortExpression="Var" />
                                 
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
	Region.Region, 
	Station.StationName, 
	SalesData.[Date], 
	ATG_DELIVERY.BatchNumber as [Batch], 
	Item.ItemName as [Product], 
	ATG_DELIVERY.BeforeATG as [BegATG], 
	ATG_DELIVERY.PumpSales, 
	ATG_DELIVERY.AfterATG as [EndATG], 
    ATG_DELIVERY.EncodedDelivery as [EncodedDelivery],
	(ATG_DELIVERY.AfterATG-ATG_DELIVERY.BeforeATG+ATG_DELIVERY.PumpSales) as [DeliveryReceived],
	(ATG_DELIVERY.AfterATG-ATG_DELIVERY.BeforeATG+ATG_DELIVERY.PumpSales-ATG_DELIVERY.EncodedDelivery) as [Var]

FROM     
	SalesData 
INNER JOIN
    ATG_DELIVERY 
ON 
	SalesData.Batch = ATG_DELIVERY.BatchNumber AND SalesData.StationID = ATG_DELIVERY.StoreID 
INNER JOIN
    Station ON SalesData.StationID = Station.StationCode 
INNER JOIN
    Region ON Station.Region = Region.ID 
INNER JOIN
    Item ON ATG_DELIVERY.ItemID = Item.ID
order by
	SalesData.[Date],
	Station.StationName,
	ATG_DELIVERY.BatchNumber"
                                filterexpression="">
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
