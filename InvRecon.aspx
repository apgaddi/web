<%@ Page Title="" Language="C#" MasterPageFile="Test.Master" AutoEventWireup="true" CodeBehind="InvRecon.aspx.cs" Inherits="WebApp.InvRecon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style>
        .background{
             background-image:url("images/7.jpg");
             background-repeat:no-repeat;
                background-attachment:fixed
        }

        .h1{
           color:blue;
            }
        .auto-style4 {
            width: 614px;
        }
        .auto-style5 {
            padding-left: 250px;
            align-content: center;
            align-items: center;
            align-self: center;
            color: green;
            width: 614px;
        }
    </style>

    <div class="background">

         <%-- version 3 modifications --%>
        <asp:Label ID="lblSDateFuelInv" runat="server" Text="    Start Date:"></asp:Label>
        <asp:TextBox ID="txtSDateFuelInv" runat="server" Width="100"></asp:TextBox>        
        <script type="text/javascript">
            $(document).ready(function () {
                $("#<%= txtSDateFuelInv.ClientID%>").datepicker({ dateFormat: "mm/dd/yy" });
        });
        </script>

        <br />
        <br />
       
        <asp:Label ID="lblEDateFuelInv" runat="server" Text="   End Date:"></asp:Label>
        <asp:TextBox ID="txtEDateFuelInv" runat="server" Width="100"></asp:TextBox> 
        <script type="text/javascript">
            $(document).ready(function () {
                $("#<%= txtEDateFuelInv.ClientID%>").datepicker({ dateFormat: "mm/dd/yy" });
            });
        </script>
        <%-- version 3 modifications --%> 
        <br />
        <br />
       

        <asp:Label ID="lblShift" runat="server" Text="Item:   "></asp:Label>
        <asp:DropDownList ID="ddlShift"  runat="server" AutoPostBack = "true" ontextchanged="ontextchanged" AppendDataBoundItems="True">
                <asp:ListItem Selected="True" Value="0" Text="--Select--"></asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="Label2" runat="server">0</asp:Label>
    
        <br />
        <br />
        <asp:Button ID="bntGenerate" runat="server" Height="37px" Text="Generate" Width="109px" OnClick="bntGenerate_Click" />

         
        
        <table id="pnlCashierReport1" runat="server" >
         <tr>
            <td class="auto-style4"> </td>
        </tr>
        <tr>
            <td colspan="3" class="auto-style5">
                <h1 class="h1">Inventory Reconciliation Log</h1>
            </td>
        </tr>
        <tr>
            <td class="auto-style4"> </td>
        </tr>
        <tr>
            <td colspan="3" class="auto-style4"> 

            <asp:GridView ID="gvCashierReport" runat="server" CellPadding="3" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ShowFooter="true" OnRowDataBound="gvCashierReport_RowDataBound" Width="878px">
             <AlternatingRowStyle BackColor="#DCDCDC" />
             <Columns>
                
                 <asp:BoundField DataField="Date" DataFormatString="{0:d}" HeaderText="Date" SortExpression="Date" FooterText="Total"/>
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
	                convert(date,dbo.Data.OpeningDate) as [Date], 
	                dbo.Data.Batch,
                    dbo.Data.BegATG,
                    dbo.Data.Delivery,
                    dbo.Data.EndATG,
                    (dbo.Data.BegATG+dbo.Data.Delivery-dbo.Data.EndATG+0.00001) as [UGTDisp],
                    (dbo.Data.POSVolume+0.00001) as [POSVolume],
                    (dbo.Data.POSVolume-(dbo.Data.BegATG+dbo.Data.Delivery-dbo.Data.EndATG)) as [VolVar],
                    (dbo.Data.BegATG+dbo.Data.Delivery-dbo.Data.EndATG)*0.005 as [AllVolVar],
                    dbo.Data.ItemID
                FROM 
                    [Data]
                where webposted=1
                order by [Date]"
              filterexpression="">
            </asp:SqlDataSource>
        </td>
        </tr>
        </table>





    </div>

</asp:Content>
