<%@ Page Title="" Language="C#" MasterPageFile="~/Test.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApp.Design1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <div class="intro">
        <table>
            <tr>
                <td style="width: 10px">
                </td>

                <td>
                     <asp:Button ID="btnShift" runat="server" OnClick="btnShift_Click" Text="INV RECON LOG" Height="80px" Width="150px" />
                </td>
            </tr>
        </table>
        

    </div>
</asp:Content>
