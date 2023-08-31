<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tank.aspx.cs" Inherits="WebApp.Tank" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width:1530px">
             <table style="width:1530px">
                <tr>
                    <td style="border-style: none; border-color: #ED1C28; background-color:#ED1C28; width:1160px">
                        <asp:Label ID="lblStn" runat="server" Text="Label" Forecolor="White" Font-Size="80px"></asp:Label>
                    </td>
                    <td style="border-style: none; border-color: #ED1C28; background-color:#ED1C28; width:280px">
                        <img src="images/veloxlogo1.png"  />
                    </td>
                </tr>
          </table>
        </div>        
        <div>
            <table style="width:1530px; background-color:#ED1C28">
                <tr>
                    <td style="width:1440px; height:10px">
                        <asp:Label ID="lblUser" runat="server" Text="Label" Forecolor="white"></asp:Label>
                        <asp:Label ID="lblPass" runat="server" Text="Label" Forecolor="white"></asp:Label>
                        <asp:Button ID="btnCuInv" runat="server" OnClick="btnCuInv_Click" Text="Current Inventory" Height="30px" Width="150px" BackColor="red" ForeColor="White" />
                        <asp:Button ID="btnOrder" runat="server" Height="30px" Text="Order" Width="100px" OnClick="btnOrder_Click" BackColor="red" ForeColor="White" />
                        <asp:Button ID="btnInvRecon" runat="server" Height="30px" Text="Inventory Reconciliation" Width="200px" OnClick="bntInvRecon_Click" BackColor="red" ForeColor="White"/>
                        <asp:Button ID="btnSales" runat="server" Height="30px" Text="Sales" Width="100px" OnClick="btnSales_Click" BackColor="red" ForeColor="White" />
                        <asp:Button ID="btnATG" runat="server" Height="30px" Text="ATG Delivery" Width="100px" OnClick="btnATG_Click" BackColor="red" ForeColor="White" />
                        <asp:Button ID="btnLogOut" runat="server" Height="30px" Text="Log Out" Width="100px" OnClick="bntLogOut_Click" BackColor="red" ForeColor="White" />
                    </td>
                </tr>
            </table>
        </div>
        <div style="background-image: url('images/velox23.jpeg'); background-repeat:repeat; height:820px; width:1530px">
            <table>
                <tr>
                    <td style="width:100px;height:100px"></td>
                    <td style="width:300px">
                        <asp:Label ID="Label11" runat="server" Text="Diesel" Font-Bold="True" Font-Size="xx-large" ForeColor="yellow"></asp:Label>
                    </td>
                    <td style="width:200px"></td>
                    <td style="width:300px">
                        <asp:Label ID="Label15" runat="server" Text="Regular" Font-Bold="True" Font-Size="xx-large" ForeColor="green"></asp:Label>
                    </td>
                    <td style="width:200px"></td>
                    <td style="width:300px">
                        <asp:Label ID="Label19" runat="server" Text="Premium" Font-Bold="True" Font-Size="xx-large" ForeColor="#ED1C28"></asp:Label>
                    </td>
                    <td style="width:200px"></td>
                </tr>
                <tr>
                    <td style="width:100px"></td>
                    <td style="width:300px;height:300px">
                        <asp:Image ID="Image1" runat="server" />
                    </td>
                    <td style="width:200px"></td>
                    <td style="width:300px;height:300px">
                        <asp:Image ID="Image2" runat="server" />
                    </td>
                    <td style="width:200px"></td>
                    <td style="width:300px;height:300px">
                        <asp:Image ID="Image3" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="width:100px"></td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="ATG Volume:" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <asp:Label ID="lblD1" runat="server" Text="D1" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Capacity:" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <asp:Label ID="lblD1C" runat="server" Text="D1C" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <br />
                        <asp:Label ID="Label3" runat="server" Text="UGT Space:" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <asp:Label ID="lblD1U" runat="server" Text="D1U" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <br />
                        <asp:Label ID="Label4" runat="server" Text="Dead Stock:" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <asp:Label ID="lblD1DS" runat="server" Text="D1DS" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <br />
                        <asp:Label ID="Label5" runat="server" Text="Liter Avail:" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <asp:Label ID="lblD1LA" runat="server" Text="D1LA" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <br />
                        <asp:Label ID="Label6" runat="server" Text="Average Sales:" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <asp:Label ID="lblD1AS" runat="server" Text="D1AS" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <br />
                        <asp:Label ID="Label7" runat="server" Text="Days to Sell:" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <asp:Label ID="lblD1DTS" runat="server" Text="D1DTS" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <br />
                    </td>
                    <td style="width:200px"></td>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="ATG Volume:" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <asp:Label ID="lblU1" runat="server" Text="U1" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <br />
                        <asp:Label ID="Label10" runat="server" Text="Capacity:" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <asp:Label ID="lblU1C" runat="server" Text="U1C" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <br />
                        <asp:Label ID="Label12" runat="server" Text="UGT Space:" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <asp:Label ID="lblU1U" runat="server" Text="U1U" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <br />
                        <asp:Label ID="Label14" runat="server" Text="Dead Stock:" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <asp:Label ID="lblU1DS" runat="server" Text="U1DS" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <br />
                        <asp:Label ID="Label16" runat="server" Text="Liter Avail:" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <asp:Label ID="lblU1LA" runat="server" Text="U1LA" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <br />
                        <asp:Label ID="Label18" runat="server" Text="Average Sales:" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <asp:Label ID="lblU1AS" runat="server" Text="U1AS" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <br />
                        <asp:Label ID="Label20" runat="server" Text="Days to Sell:" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <asp:Label ID="lblU1DTS" runat="server" Text="U1DTS" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <br />
                    </td>
                    <td style="width:200px"></td>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="ATG Volume:" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <asp:Label ID="lblP1" runat="server" Text="P1" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <br />
                        <asp:Label ID="Label13" runat="server" Text="Capacity:" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <asp:Label ID="lblP1C" runat="server" Text="P1C" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <br />
                        <asp:Label ID="Label17" runat="server" Text="UGT Space:" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <asp:Label ID="lblP1U" runat="server" Text="P1U" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <br />
                        <asp:Label ID="Label21" runat="server" Text="Dead Stock:" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <asp:Label ID="lblP1DS" runat="server" Text="P1DS" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <br />
                        <asp:Label ID="Label23" runat="server" Text="Liter Avail:" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <asp:Label ID="lblP1LA" runat="server" Text="P1LA" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <br />
                        <asp:Label ID="Label25" runat="server" Text="Average Sales:" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <asp:Label ID="lblP1AS" runat="server" Text="P1AS" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <br />
                        <asp:Label ID="Label27" runat="server" Text="Days to Sell:" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <asp:Label ID="lblP1DTS" runat="server" Text="P1DTS" Font-Bold="True" Font-Size="Large" ForeColor="#ED1C28"></asp:Label>
                        <br />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
