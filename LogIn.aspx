<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="WebApp.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LOG IN</title>
   <%-- <link href="CSS/LogIn.css" rel="stylesheet" />--%>
    

    <style type="text/css">
        .auto-style2 {
            height: 750px;
           
        }
        .auto-style4 {
            width: 1530px;
            height: 111px;
            padding-left:1150px;
        }

        .loginbox{
            position:absolute;
            top:45%;
            left:75%;
            transform:translate(-50%,-50%);
            width:250px;
            height:300px;
            padding: 70px 35px;
            box-sizing:border-box;
            background:rgba(0,0,0,0.5);
            
        }
        .userimage{
            width:100px;
            height:100px;
            overflow:hidden;
            top: calc(-100px/2);
            left: calc(50% -50px);      
        }

        .h10{
            padding:0;
            margin:0;
            text-align:center;
            color:blue;
        }

        .btnLog{
            border:none;
            background-color:#ED1C28;
            border-radius:20px;
            color:white;
            cursor:pointer;
        }

        .btnLog:hover{
            background-color:rgb(255 216 0);
        }
    </style>
    

</head>
<body>
   
    <div>
        <table>
                <tr>
                    <td class="auto-style4" style="background-color:#ED1C28">
                        <img src="images/veloxlogo1.png"  />
                    </td>
                </tr>
          </table>
    </div>           
        

    <div class="auto-style2" style=" width: 1530px;background-image: url('images/velox22.jpeg'); background-repeat:repeat" >
        
       <div class="loginbox">
                    <%--<img src="images/th.jpg" class="userimage"/><br />
                    <h10 class="h10">Log In Here</h10>
                    <br />--%>
            <form id="form1" runat="server">
                    <asp:TextBox ID="txtName" placeholder="UserName" runat="server" BackColor="#99FFCC" BorderColor="Blue" BorderStyle="Solid" Width="170px" Height="30px" ></asp:TextBox> <br />
                    <br/>
                    <asp:TextBox ID="txtPass" placeholder="Password" runat="server" TextMode="Password" BackColor="#99FFCC" BorderColor="Blue" BorderStyle="Solid" Width="170px" Height="30px"></asp:TextBox> <br />
                    <br />
                    <br />
                    <asp:Button ID="btnLog" runat="server" Text="Log In" OnClick="btnLog_Click" Height="56px" Width="170px" class="btnLog"/><br />
                    <br />
                    <asp:Label ID="lblError" runat="server" Text="Incorrect data! Try again" CssClass="label"></asp:Label><br />
                    <asp:Label ID="lblAccess1" runat="server" Text="Label" ></asp:Label>
                    <asp:Label ID="lblAccess2" runat="server" Text="Label"></asp:Label>
            </form>
       </div>                  
     </div>
                   
    
   
    </body>
</html>
