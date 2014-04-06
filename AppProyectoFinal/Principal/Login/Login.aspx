<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Principal.Login.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>Login</title>

    <meta name="keywords" content="free website templates, CSS templates, Metal Website, HTML CSS" />

    <meta name="description" content="Metal Website - free CSS website template, Free HTML CSS Layout" />

    <link href="templatemo_style.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        #ContenidoCentro
        {
            height: 516px;
        }
    </style>

</head>
<body style="height: 498px">
    <form id="formLogin" runat="server">
        <div id="ContenidoCentro">
            <asp:Label ID="lblUsuarion" runat="server" Text="Usuario" Style="margin-left: 464px" Height="27px" Font-Bold="True" Font-Size="Large" ForeColor="#333333" ></asp:Label>
            <asp:TextBox ID="txtUsuario" runat="server" Height="18px" style="margin-left: 82px; margin-top: 178px" Width="209px" Font-Size="Medium" BackColor="#CCCCCC" BorderColor="#333333"></asp:TextBox>
            <br/>
            <asp:Label ID="lblContraseña" runat="server" Text="Contraseña" Style="margin-left: 464px" Height="27px" Font-Bold="True" Font-Size="Large" ForeColor="#333333"></asp:Label>
            <asp:TextBox ID="txtContraseña" runat="server" style="margin-left: 55px; margin-top: 31px;" Width="208px" Font-Size="Medium" BackColor="#CCCCCC" BorderColor="#333333" TextMode="Password"></asp:TextBox>
            <br/>
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" Font-Bold="True" Font-Italic="False" Font-Size="Medium" BackColor="Gray" BorderColor="#333333" BorderStyle="Solid" Height="31px" style="margin-left: 484px; margin-top: 40px;" Width="138px" OnClick="btnCancelar_Click"/>
            <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" Font-Bold="True" Font-Italic="False" Font-Size="Medium" BackColor="Gray" BorderColor="#333333" BorderStyle="Solid" Height="31px" OnClick="btnIngresar_Click" style="margin-left: 64px; margin-top: 40px;" Width="138px" />
        </div>
    </form>
</body>
</html>
