<%@ Page Title="" Language="C#" MasterPageFile="~/Estudiantes/MasterEstudiante.master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Principal.Estudiantes.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoMedio" runat="server">
    <h1 style="font-size: xx-large; width: 318px; margin-left: 282px; height: 32px;">Cambiar Contraseña</h1>
    <form id="Form1" runat="server" style="width: 864px; margin-top: 27px; height: 575px;">
        <asp:Label ID="lblUsuario" runat="server" Text="Usuario"  Style="margin-left: 274px" Font-Bold="True" Font-Size="Medium" ForeColor="#333333"></asp:Label>
        <asp:TextBox ID="txtUsuario" runat="server" BackColor="#CCCCCC" BorderColor="#333333" Height="25px" Style="margin-left: 120px; margin-top: 106px;" Width="238px" Font-Size="Medium" TextMode="Number"></asp:TextBox>
        <br/>
        <asp:Label ID="lblContraseñaActual" runat="server" Text="Contraseña"  Style="margin-left: 274px" Font-Bold="True" Font-Size="Medium" ForeColor="#333333"></asp:Label>
        <asp:TextBox ID="txtContraseñaActual" runat="server" BackColor="#CCCCCC" BorderColor="#333333" Height="25px" Style="margin-left: 92px; margin-top: 26px;" Width="238px" Font-Size="Medium" TextMode="Password"></asp:TextBox>
        <br/>
        <asp:Label ID="lblNuevaContraseña" runat="server" Text="Nueva Contraseña"  Style="margin-left: 274px" Font-Bold="True" Font-Size="Medium" ForeColor="#333333"></asp:Label>
        <asp:TextBox ID="txtNuevaContraseña" runat="server" BackColor="#CCCCCC" BorderColor="#333333" Height="25px" Style="margin-left: 40px; margin-top: 23px;" Width="238px" Font-Size="Medium" TextMode="Password"></asp:TextBox>
        <br/>
        <asp:Label ID="lblConfirmarNuevaContrasena" runat="server" Text="Confirmar Contraseña" Style="margin-left: 274px" Font-Bold="True" Font-Size="Medium" ForeColor="#333333"></asp:Label>
        <asp:TextBox ID="txtConfirmarNuevaContraseña" runat="server" BackColor="#CCCCCC" BorderColor="#333333" Height="25px" Style="margin-left: 12px; margin-top: 25px;" Width="238px" Font-Size="Medium" TextMode="Password"></asp:TextBox>
        <br/>
        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" Font-Bold="True" Font-Italic="False" Font-Size="Medium" BackColor="Gray" BorderColor="#333333" BorderStyle="Solid" Height="31px" Style="margin-left: 273px; margin-top: 47px" Width="200px" OnClick="btnCancelar_Click"/>
        <asp:Button ID="btnAceptar" runat="server" Text="Guardar" Font-Bold="True" Font-Italic="False" Font-Size="Medium" BackColor="Gray" BorderColor="#333333" BorderStyle="Solid" Height="31px" Style="margin-left: 25px; margin-top: 4px" Width="200px" OnClick="btnAceptar_Click" />
    </form>
</asp:Content>
