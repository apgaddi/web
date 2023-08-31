<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CurrentInv.aspx.cs" Inherits="WebApp.CurrentInv" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .hiddencol
            {
                display: none;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <table style="width:1530px">
                <tr>
                    <td style="background-color:#ED1C28; width:1530px">
                        <img src="images/veloxlogo1.png"  />
                    </td>
                </tr>
          </table>
        </div>        
        <div>
            <table style="background-color:#ED1C28;width:1530px">
                <tr>
                    
                    <td style="width:1530px; height:10px">
                        <asp:Label ID="lblUser" runat="server" Text="Label" Forecolor="white"></asp:Label>
                        <asp:Label ID="lblPass" runat="server" Text="Label" Forecolor="white"></asp:Label>
                        <asp:Button ID="btnInvRecon" runat="server" Height="30px" Text="Inventory Reconciliation" Width="200px" OnClick="bntInvRecon_Click" BackColor="red" ForeColor="White"/>
                        <asp:Button ID="btnOrder" runat="server" Height="30px" Text="Order" Width="100px" OnClick="btnOrder_Click" BackColor="red" ForeColor="White" />
                        <asp:Button ID="btnSales" runat="server" Height="30px" Text="Sales" Width="100px" OnClick="btnSales_Click" BackColor="red" ForeColor="White" />
                        <asp:Button ID="btnATG" runat="server" Height="30px" Text="ATG Delivery" Width="100px" OnClick="btnATG_Click" BackColor="red" ForeColor="White" />
                        <asp:Button ID="btnLogOut" runat="server" Height="30px" Text="Log Out" Width="100px" OnClick="bntLogOut_Click" BackColor="red" ForeColor="White" />
                    </td>
                </tr>
            </table>
        </div >

        <%--<div style="background-color:#ED1C28">
            <table>
                <tr>
                    <td> 
                        <asp:Button ID="bntGenerate" runat="server" Height="37px" Text="Generate" Width="109px" OnClick="bntGenerate_Click" Visible="False" />
                    </td>
                </tr>
            </table>
        </div>--%>
            
        <div style="background-image: url('images/velox22.jpeg'); background-repeat: repeat; width:1530px">
            <table style="width:1440px">
                
                <tr>
                    <td style="width:100px"></td>
                    <td style="width:1130px">
                        <h1>Current Inventory</h1>
                        <h2>Misamis Oriental</h2>
                    </td>
                    <td style="width:300px">
                        <asp:Label ID="Label4" runat="server" Text="GREEN-Stock Level is normal" Forecolor="green"></asp:Label>
                        <br />
                        <asp:Label ID="Label5" runat="server" Text="ORANGE-Close Monitoring" Forecolor="orange"></asp:Label>
                         <br />
                        <asp:Label ID="Label6" runat="server" Text="RED-Reorder Now" Forecolor="red"></asp:Label>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td style="width:100px"></td>
                    <td style="width:1430px"> 
                        <asp:GridView ID="gvInv" runat="server" CellPadding="3" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"  OnRowCommand="gvInv_OnRowCommand" OnRowDataBound="gvInv_RowDataBound">
                                <AlternatingRowStyle BackColor="#DCDCDC" />
                                <Columns>
                                    <asp:BoundField DataField="Station" DataFormatString="" HeaderText="Station" SortExpression="Station" />
                                    <asp:BoundField DataField="D1" DataFormatString="{0:N}" HeaderText="Diesel 1" SortExpression="D1" />
                                    <asp:BoundField DataField="D2" DataFormatString="{0:N}" HeaderText="Diesel 2" SortExpression="D2" />
                                    <asp:BoundField DataField="R1" DataFormatString="{0:N}" HeaderText="Regular 1" SortExpression="R1" />
                                    <asp:BoundField DataField="R2" DataFormatString="{0:N}" HeaderText="Regular 2" SortExpression="R2" />
                                    <asp:BoundField DataField="P1" DataFormatString="{0:N}" HeaderText="Premium 1" SortExpression="P1" />
                                    <asp:BoundField DataField="P2" DataFormatString="{0:N}" HeaderText="Premium 2" SortExpression="P2" />
                                    <asp:BoundField DataField="Date" DataFormatString="{0:d-MMM-yyyy h:mm tt}" HeaderText="Date Updated" SortExpression="Date"/>
                                    <asp:BoundField DataField="D1AS" DataFormatString="{0:N}" HeaderText="D1AS" SortExpression="D1AS" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
                                    <asp:BoundField DataField="U1AS" DataFormatString="{0:N}" HeaderText="U1AS" SortExpression="U1AS" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"/>
                                    <asp:BoundField DataField="P1AS" DataFormatString="{0:N}" HeaderText="P1AS" SortExpression="P1AS" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"/>
                                    <asp:BoundField DataField="Multiplier" DataFormatString="{0:N}" HeaderText="Multiplier" SortExpression="Multiplier" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"/>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button ID="Button1" runat="server" CommandName="Select" Text="Select" CommandArgument="<%# Container.DataItemIndex %>" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                
                                <HeaderStyle BackColor="#ED1C28" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                <RowStyle  BackColor="#EEEEEE" ForeColor="Black" />
                                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#000065" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" ProviderName="<%$ ConnectionStrings:connect.ProviderName %>" 
                            SelectCommand="
                                SELECT 
                                    dbo.Station.StationName as [Station], 
                                    dbo.Inventory.D1 as [D1], 
                                    dbo.Inventory.D2 as [D2], 
                                    dbo.Inventory.U1 as [R1], 
                                    dbo.Inventory.U2 as [R2], 
                                    dbo.Inventory.P1 as [P1], 
                                    dbo.Inventory.P2 as [P2], 
                                    dbo.Inventory.DateUpdated as [Date],
                                    dbo.Inventory.D1AS as [D1AS],
                                    dbo.Inventory.U1AS as [U1AS],
                                    dbo.Inventory.P1AS as [P1AS],
                                    dbo.Inventory.Multiplier as [Multiplier]
                                FROM     dbo.Inventory INNER JOIN
                                dbo.Station ON dbo.Inventory.StationID = dbo.Station.StationCode
                                where Station.Province=1
                                order by dbo.Station.StationName"
                                filterexpression="">
                        </asp:SqlDataSource>
                    </td>
                    
                </tr>
                <tr>
                    <td style="width:100px"></td>
                    <td style="width:1430px">
                        <h2>Bukidnon</h2>
                    </td>
                </tr>
                <tr>
                    <td style="width:100px"></td>
                    <td style="width:1430px"> 
                        <asp:GridView ID="gvProv2" runat="server" CellPadding="3" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" AutoGenerateColumns="False" DataSourceID="SqlDataSource2"  OnRowCommand="gvInv_OnRowCommand" OnRowDataBound="gvInv_RowDataBound">
                                <AlternatingRowStyle BackColor="#DCDCDC" />
                                <Columns>
                                    <asp:BoundField DataField="Station" DataFormatString="" HeaderText="Station" SortExpression="Station"/>
                                    <asp:BoundField DataField="D1" DataFormatString="{0:N}" HeaderText="Diesel 1" SortExpression="D1" />
                                    <asp:BoundField DataField="D2" DataFormatString="{0:N}" HeaderText="Diesel 2" SortExpression="D2" />
                                    <asp:BoundField DataField="R1" DataFormatString="{0:N}" HeaderText="Regular 1" SortExpression="R1" />
                                    <asp:BoundField DataField="R2" DataFormatString="{0:N}" HeaderText="Regular 2" SortExpression="R2" />
                                    <asp:BoundField DataField="P1" DataFormatString="{0:N}" HeaderText="Premium 1" SortExpression="P1" />
                                    <asp:BoundField DataField="P2" DataFormatString="{0:N}" HeaderText="Premium 2" SortExpression="P2" />
                                    <asp:BoundField DataField="Date" DataFormatString="{0:d-MMM-yyyy h:mm tt}" HeaderText="Date Updated" SortExpression="Date"/>
                                    <asp:BoundField DataField="D1AS" DataFormatString="{0:N}" HeaderText="D1AS" SortExpression="D1AS" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
                                    <asp:BoundField DataField="U1AS" DataFormatString="{0:N}" HeaderText="U1AS" SortExpression="U1AS" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"/>
                                    <asp:BoundField DataField="P1AS" DataFormatString="{0:N}" HeaderText="P1AS" SortExpression="P1AS" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"/>
                                    <asp:BoundField DataField="Multiplier" DataFormatString="{0:N}" HeaderText="Multiplier" SortExpression="Multiplier" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"/>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button ID="Button1" runat="server" CommandName="Select" Text="Select" CommandArgument="<%# Container.DataItemIndex %>" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                
                                <HeaderStyle BackColor="#ED1C28" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                <RowStyle  BackColor="#EEEEEE" ForeColor="Black" />
                                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#000065" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:connect %>" ProviderName="<%$ ConnectionStrings:connect.ProviderName %>" 
                            SelectCommand="
                                SELECT 
                                    dbo.Station.StationName as [Station], 
                                    dbo.Inventory.D1 as [D1], 
                                    dbo.Inventory.D2 as [D2], 
                                    dbo.Inventory.U1 as [R1], 
                                    dbo.Inventory.U2 as [R2], 
                                    dbo.Inventory.P1 as [P1], 
                                    dbo.Inventory.P2 as [P2], 
                                    dbo.Inventory.DateUpdated as [Date],
                                    dbo.Inventory.D1AS as [D1AS],
                                    dbo.Inventory.U1AS as [U1AS],
                                    dbo.Inventory.P1AS as [P1AS],
                                    dbo.Inventory.Multiplier as [Multiplier]
                                FROM     dbo.Inventory INNER JOIN
                                dbo.Station ON dbo.Inventory.StationID = dbo.Station.StationCode
                                where Station.Province=3
                                order by dbo.Station.StationName"
                                filterexpression="">
                        </asp:SqlDataSource>
                    </td>

                </tr>
                <%--<tr>
                    <td style="width:100px"></td>
                    <td style="width:1430px">
                        <asp:Label ID="Label1" runat="server" Text="GREEN-Stock Level is normal" Forecolor="green"></asp:Label>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="ORANGE-Close Monitoring" Forecolor="orange"></asp:Label>
                         <br />
                        <asp:Label ID="Label3" runat="server" Text="RED-Reorder Now" Forecolor="red"></asp:Label>
                        <br />
                    </td>
                </tr>--%>
              
            </table>
        </div>
    </form>
</body>
</html>
