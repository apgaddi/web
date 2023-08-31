<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewHome.aspx.cs" Inherits="WebApp.NewHome" %>

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
                    </td>
                </tr>
            </table>
        </div>

        <div style="background-image: url('images/velox22.jpeg'); background-repeat: repeat;height:820px;width=1530px">
            <table>
                <tr>
                    <td>
                        <br />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px">
                    </td>

                    <td>
                        <asp:Button ID="btnCuInv" runat="server" OnClick="btnCuInv_Click" Text="Current Inventory" Height="80px" Width="150px" BackColor="red" ForeColor="White" />
                        
                    </td>

                    <td style="width: 50px">
                    </td>

                    <td>
                        <asp:Button ID="btnInv" runat="server" OnClick="btnInv_Click" Text="Inv Recon Log" Height="80px" Width="150px" BackColor="red" ForeColor="White" />
                    </td>

                    <td style="width: 50px">
                    </td>

                    <td>
                        <asp:Button ID="btnSales" runat="server" OnClick="btnSales_Click" Text="Sales" Height="80px" Width="150px" BackColor="red" ForeColor="White" />
                    </td>

                    <td style="width: 50px">
                    </td>

                    <td>
                        <asp:Button ID="btnOrder" runat="server" OnClick="btnOrder_Click" Text="Order" Height="80px" Width="150px" BackColor="red" ForeColor="White" />
                    </td>
                                        
                    <td style="width: 50px">
                    </td>

                    <td>
                        <asp:Button ID="bntLog" runat="server" OnClick="btnLog_Click" Text="Log Out" Height="80px" Width="150px" BackColor="red" ForeColor="White" />
                    </td>

                </tr>
            </table>
        </div>
    </form>
</body>
</html>
