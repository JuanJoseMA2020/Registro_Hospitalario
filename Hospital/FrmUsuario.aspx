<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmUsuario.aspx.cs" Inherits="Hospital.FrmAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td>CODIGO</td>
                <td>
                    <asp:TextBox ID="TxtCodigo" runat="server" Height="16px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="LblMensaje" runat="server" Font-Size="X-Large" ForeColor="#FF3300"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="BtnConsulta" runat="server" Text="Consultar cancha" OnClick="BtnConsulta_Click" />
                </td>
            </tr>
            <tr>
                <td>NOMBRE</td>
                <td>
                    <asp:Label ID="Lblnombre" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>FECHA</td>
                <td>
                    <asp:Label ID="Lblfecha" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>HORA</td>
                <td>
                    <asp:Label ID="LblHora" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>LUGAR</td>
                <td>
                    <asp:Label ID="LblLugar" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>VALOR</td>
                <td>
                    <asp:Label ID="lblvalor" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblnompersonareserva" runat="server" Font-Italic="True" Font-Size="X-Large" ForeColor="#0000CC"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lbltelpersoreserva" runat="server" ForeColor="#0000CC"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
