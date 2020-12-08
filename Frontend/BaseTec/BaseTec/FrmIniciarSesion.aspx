<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="FrmIniciarSesion.aspx.cs" Inherits="BaseTec.FrmIniciarSesion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="Css/footer.css" rel="stylesheet" />
        <link href="Css/form.css" rel="stylesheet" />
        <link href="Css/header.css" rel="stylesheet" />
        <link href="Css/index.css" rel="stylesheet" />
        <link href="Css/nav.css" rel="stylesheet" />
        <link href="Css/template.css" rel="stylesheet" />
        <script src="Recursos/Librerias/Jquery/external/jquery/jquery.js"></script>
        <script src="Recursos/Librerias/Jquery/jquery-ui.js"></script>
        <script src="Recursos/Librerias/Jquery/jquery-ui.min.js"></script>
        <link href="Recursos/Librerias/Jquery/jquery-ui.css" rel="stylesheet" />
        <script src="Js/index.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="server">
    <table align="center">
            <tr>
                <td colspan="2" style="text-align: center">INICIAR SESIÓN</td>
            </tr>
            <tr>
                <td class="auto-style2">Usuario:</td>
                <td>
                    <asp:TextBox ID="txtUsuario" runat="server" Width="306px" Font-Size="Medium" required></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Password:</td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" Width="306px" Font-Size="Medium" TextMode="Password" required></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" OnClick="btnIngresar_Click" />
                </td>
            </tr>
        </table>
    <br />
    <p style="text-align:center"> 
        <asp:Label ID="lblMensaje" runat="server"></asp:Label></p>
 
</asp:Content>
