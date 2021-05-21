<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmIngreso.aspx.cs" Inherits="Hospital.FrmIngreso" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 211px;
        }
        .auto-style3 {
            width: 118px;
        }
        .auto-style4 {
            width: 193px;
        }
        .auto-style5 {
            width: 118px;
            height: 22px;
        }
        .auto-style6 {
            width: 211px;
            height: 22px;
        }
        .auto-style7 {
            width: 193px;
            height: 22px;
        }
        .auto-style8 {
            height: 22px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style5">USER</td>
                <td class="auto-style6">
                    <asp:TextBox ID="TxtUsuario" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="rfvuser" runat="server" ControlToValidate="TxtUsuario" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style8">
                    <asp:RegularExpressionValidator ID="revuser" runat="server" ControlToValidate="TxtUsuario" ErrorMessage="Ingrese usuario valido" ForeColor="#FFCC00" ValidationExpression="[A-Z||a-z||\.]+"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">PASSWORD</td>
                <td class="auto-style2">
                    <asp:TextBox ID="TxtClave" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="rfvpass" runat="server" ControlToValidate="TxtClave" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="revpass" runat="server" ControlToValidate="TxtClave" ErrorMessage="No use barra espaciadora ni signos especiales" ForeColor="#FFCC00" ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Button ID="BtnIngresar" runat="server" OnClick="BtnIngresar_Click" Text="Log In" />
                </td>
                <td class="auto-style2">
                    <asp:Label ID="LblMensaje" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style4">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
