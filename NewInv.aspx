<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewInv.aspx.cs" Inherits="WebApp.NewInv" %>

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
                        <asp:Button ID="btnOrder" runat="server" Height="30px" Text="Order" Width="100px" OnClick="btnOrder_Click" BackColor="red" ForeColor="White" />
                        <asp:Button ID="btnSales" runat="server" Height="30px" Text="Sales" Width="100px" OnClick="btnSales_Click" BackColor="red" ForeColor="White" />
                        <asp:Button ID="btnATG" runat="server" Height="30px" Text="ATG Delivery" Width="100px" OnClick="btnATG_Click" BackColor="red" ForeColor="White" />
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
                        <asp:Label ID="lblInv" runat="server" Text="Item:   " ForeColor="White"></asp:Label>
                        <asp:DropDownList ID="ddlInv"  runat="server" AutoPostBack = "true" ontextchanged="ontextchanged" AppendDataBoundItems="True">
                        <asp:ListItem Selected="True" Value="0" Text="--Select--"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="Label2" runat="server">0</asp:Label>
                        <asp:Button ID="bntGenerate" runat="server" Height="37px" Text="Generate" Width="109px" OnClick="bntGenerate_Click" />
                        <asp:Button ID="btnExcel" runat="server" Height="37px" Text="Export to Excel" Width="109px" OnClick="btnExcel_Click" />

                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <h1 class="h1">Inventory Reconciliation Log</h1>
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
                                    <asp:BoundField DataField="StationName" DataFormatString="" HeaderText="Station" SortExpression="StationName" FooterText="Total"/>
                                    <asp:BoundField DataField="Region" DataFormatString="" HeaderText="Region" SortExpression="Region" />
                                    <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date" SortExpression="Date"/>
                                    <asp:BoundField DataField="Batch" DataFormatString="" HeaderText="Batch" SortExpression="Batch" />
                                    <asp:BoundField DataField="BegATG" DataFormatString="{0:N}" HeaderText="Beginning ATG" SortExpression="BegATG" />
                                    <asp:BoundField DataField="Delivery" DataFormatString="{0:N}" HeaderText="Delivery" SortExpression="Delivery" />
                                    <asp:BoundField DataField="EndATG" DataFormatString="{0:N}" HeaderText="Ending ATG" SortExpression="EndATG" />
                                    <asp:BoundField DataField="UGTDisp" DataFormatString="{0:N}" HeaderText="UGT Dispensed" SortExpression="UGTDisp" />
                                    <asp:BoundField DataField="POSVolume" DataFormatString="{0:N}" HeaderText="POS Volume" SortExpression="POSVolume" />
                                    <asp:BoundField DataField="VolVar" DataFormatString="{0:N}" HeaderText="Vol Variance" SortExpression="VolVar" />
                                    <asp:BoundField DataField="AllVolVar" DataFormatString="{0:N}" HeaderText="Allowable Variance" SortExpression="AllVolVar" />
                                    <%--<asp:BoundField DataField="PctVar" DataFormatString="{0:N}" HeaderText="Variance %" SortExpression="PctVar" />--%>
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
                                    convert(date,dbo.Data.OpeningDate) as [Date], 
	                                dbo.Data.Batch,
                                    dbo.Data.BegATG,
                                    dbo.Data.Delivery,
                                    dbo.Data.EndATG,
                                    (dbo.Data.BegATG+dbo.Data.Delivery-dbo.Data.EndATG+0.00001) as [UGTDisp],
                                    (dbo.Data.POSVolume+0.00001) as [POSVolume],
                                    (dbo.Data.POSVolume-(dbo.Data.BegATG+dbo.Data.Delivery-dbo.Data.EndATG)) as [VolVar],
                                    (dbo.Data.BegATG+dbo.Data.Delivery-dbo.Data.EndATG)*0.0005 as [AllVolVar],
                                    dbo.Data.ItemID
                                FROM 
                                    [Data] inner join [Station]
					            on
					                Data.StationID = Station.StationCode
                                INNER JOIN
                                    Region ON Station.Region = Region.ID
                                where webposted=1
                                order by [Region],[StationName],[Date]"
                                filterexpression="">
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
