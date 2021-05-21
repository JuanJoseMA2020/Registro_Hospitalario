<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmAdmin.aspx.cs" Inherits="Hospital.FrmCita" %>

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
            height: 36px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">CODIGO</td>
                <td class="auto-style2">
                    <asp:TextBox ID="TxtCodigo" runat="server"></asp:TextBox>
                    <asp:Label ID="LblMensaje" runat="server"></asp:Label>
                </td>
                <td class="auto-style2">
                </td>
            </tr>
            <tr>
                <td>
                    NOMBRE CANCHA</td>
                <td>
                    <asp:TextBox ID="txtnombre" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>FECHA</td>
                <td>
                    <asp:TextBox ID="TxtFecha" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>HORA</td>
                <td>
                    <asp:TextBox ID="TxtHora" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>VALOR RESERVA</td>
                <td>
                    <asp:TextBox ID="Txtvalor_reserva" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>LUGAR</td>
                <td>
                    <asp:TextBox ID="Txtlugar_cancha" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    NOMBRE USUARIO</td>
                <td>
                    <asp:TextBox ID="txtnom_usuario" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    TELEFONO USUARIO</td>
                <td>
                    <asp:TextBox ID="txtel_usuario" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="BtnAnular" runat="server" Text="Anular reserva" />
                </td>
                <td>
                    <asp:Button ID="BtnGuardar" runat="server" Text="Guardar reserva" OnClick="BtnGuardar_Click" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
