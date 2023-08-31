<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="WebApp.Order" %>

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
                        <asp:Button ID="btnSales" runat="server" Height="30px" Text="Sales" Width="100px" OnClick="btnSales_Click" BackColor="red" ForeColor="White" />
                        <asp:Button ID="btnCuInv" runat="server" OnClick="btnCuInv_Click" Text="Current Inventory" Height="30px" Width="150px" BackColor="red" ForeColor="White" />
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
                    <td style="width:1430px">
                        <h1>Proposed Order (Maximum Volume on the Estimated Date of Delivery)</h1>
                    </td>
                </tr>
                <tr>
                    <td style="width:100px"></td>
                    <td style="width:1430px"> 
                        <asp:GridView ID="gvOrder" runat="server" CellPadding="3" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="gvOrder_RowDataBound">
                                <AlternatingRowStyle BackColor="#DCDCDC" />
                                <Columns>
                                    <asp:BoundField DataField="Station" DataFormatString="" HeaderText="Station" SortExpression="Station"/>
                                    <asp:BoundField DataField="DateToday" DataFormatString="{0:d-MMM-yyyy h:mm tt}" HeaderText="Current Date" SortExpression="DateToday"/>
                                    <asp:BoundField DataField="Multiplier" DataFormatString="{0:N}" HeaderText=" No. of Days till Delivery" SortExpression="Multiplier"/>
                                    <asp:TemplateField HeaderText="Date of Arrival">
                                           <ItemTemplate>
                                             <asp:Label ID="DoA" runat="server" Text="" />
                                          </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--<asp:BoundField DataField="DateArrival" DataFormatString="{0:d-MMM-yyyy h:mm tt}" HeaderText="Date of Next Delivery" SortExpression="DateArrival"/>--%>
                                    <asp:BoundField DataField="D1" DataFormatString="{0:N}" HeaderText="Diesel 1 Current Volume" SortExpression="D1" />
                                    <asp:BoundField DataField="D2" DataFormatString="{0:N}" HeaderText="Diesel 2 Current Volume" SortExpression="D2" />
                                    <asp:BoundField DataField="R1" DataFormatString="{0:N}" HeaderText="Regular 1 Current Volume" SortExpression="R1" />
                                    <asp:BoundField DataField="R2" DataFormatString="{0:N}" HeaderText="Regular 2 Current Volume" SortExpression="R2" />
                                    <asp:BoundField DataField="P1" DataFormatString="{0:N}" HeaderText="Premium 1 Current Volume" SortExpression="P1" />
                                    <asp:BoundField DataField="P2" DataFormatString="{0:N}" HeaderText="Premium 2 Current Volume" SortExpression="P2" />
                                    
                                     <asp:TemplateField HeaderText="Proposed Order Diesel 1">
                                           <ItemTemplate>
                                             <asp:Label ID="POD1" runat="server" Text="" />
                                          </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Proposed Order Regular 1">
                                           <ItemTemplate>
                                             <asp:Label ID="POR1" runat="server" Text="" />
                                          </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Proposed Order Premium 1">
                                           <ItemTemplate>
                                             <asp:Label ID="POP1" runat="server" Text="" />
                                          </ItemTemplate>
                                    </asp:TemplateField>
                                 

                                    <asp:BoundField DataField="D1P" DataFormatString="{0:N}" HeaderText="D1P" SortExpression="D1P" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
                                    <asp:BoundField DataField="D1C" DataFormatString="{0:N}" HeaderText="D1C" SortExpression="D1C" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
                                   <asp:BoundField DataField="U1P" DataFormatString="{0:N}" HeaderText="U1P" SortExpression="U1P" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
                                    <asp:BoundField DataField="U1C" DataFormatString="{0:N}" HeaderText="U1C" SortExpression="U1C" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
                                    <asp:BoundField DataField="P1P" DataFormatString="{0:N}" HeaderText="P1P" SortExpression="P1P" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
                                    <asp:BoundField DataField="P1C" DataFormatString="{0:N}" HeaderText="P1C" SortExpression="P1C" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
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
                                    Station.StationName as [Station], 
                                    Inventory.D1 as [D1], 
                                    Inventory.D2 as [D2], 
                                    Inventory.U1 as [R1], 
                                    Inventory.U2 as [R2], 
                                    Inventory.P1 as [P1], 
                                    Inventory.P2 as [P2], 
                                    Inventory.DateUpdated as [DateToday],
                                    Inventory.Multiplier as [Multiplier],
                                    (INVENTORY.D1C-(INVENTORY.D1-(INVENTORY.Multiplier*INVENTORY.D1AS))) AS D1P,
	                                (INVENTORY.D2C-(INVENTORY.D2-(INVENTORY.Multiplier*INVENTORY.D2AS))) AS D2P,
	                                (INVENTORY.U1C-(INVENTORY.U1-(INVENTORY.Multiplier*INVENTORY.U1AS))) AS U1P,
	                                (INVENTORY.U2C-(INVENTORY.U2-(INVENTORY.Multiplier*INVENTORY.U2AS))) AS U2P,
	                                (INVENTORY.P1C-(INVENTORY.P1-(INVENTORY.Multiplier*INVENTORY.P1AS))) AS P1P,
	                                (INVENTORY.P2C-(INVENTORY.P2-(INVENTORY.Multiplier*INVENTORY.P2AS))) AS P2P,
                                    Inventory.D1C as [D1C],
                                    Inventory.U1C as [U1C],
                                     Inventory.U1C as [P1C]
                                FROM     
                                    Inventory INNER JOIN
                                    Station ON Inventory.StationID = Station.StationCode
                                order by Station.StationName"
                                filterexpression="">
                        </asp:SqlDataSource>
                    </td>         
                </tr>
                
              
            </table>
        </div>
    </form>
</body>
</html>
