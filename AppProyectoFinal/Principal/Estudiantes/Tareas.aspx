<%@ Page Title="" Language="C#" MasterPageFile="~/Estudiantes/MasterEstudiante.master" AutoEventWireup="true" CodeBehind="Tareas.aspx.cs" Inherits="Principal.Estudiantes.Tareas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoMedio" runat="server">
    <h1 style="font-size: xx-large; width: 346px; margin-left: 279px; height: 32px;">TAREA ESTUDIANTES</h1>


    <form id="formTareas" runat="server" style="width: 864px; height: 600px;">

        <asp:UpdatePanel ID="UpdatePanel" runat="server">
            <ContentTemplate>
                <asp:ScriptManager ID="ScriptTareas" runat="server">
                </asp:ScriptManager>
                <asp:Label ID="lblGrupo" runat="server" Text="Grupo" Style="margin-left: 274px" Font-Bold="True" Font-Size="Medium" ForeColor="#333333"></asp:Label>
                <asp:DropDownList ID="boxGrupos" runat="server" Height="28px" Style="margin-left: 73px; margin-bottom: 2px" BackColor="#CCCCCC" BorderColor="#333333" Font-Bold="False" Font-Size="Medium" AutoPostBack="True" Width="192px"></asp:DropDownList>
                <br />
                <asp:Label ID="lblCorreoDocente" runat="server" Text="Correo" Style="margin-left: 274px" Height="29px" Font-Bold="True" Font-Size="Medium" ForeColor="#333333"></asp:Label>
                <asp:TextBox ID="txtCorreoDocente" runat="server" Style="margin-left: 69px; margin-top: 27px;" Width="183px" Height="22px" Font-Size="Medium" BackColor="#CCCCCC" BorderColor="#333333" TextMode="Email"></asp:TextBox>
                <br />
                <asp:Label ID="lblContrasenaCorreo" runat="server" Text="Contraseña" Style="margin-left: 274px" Height="27px" Font-Bold="True" Font-Size="Medium" ForeColor="#333333"></asp:Label>
                <asp:TextBox ID="txtContraseña" runat="server" Style="margin-left: 32px; margin-top: 22px;" Width="182px" Height="22px" Font-Size="Medium" BackColor="#CCCCCC" BorderColor="#333333" TextMode="Password"></asp:TextBox>
                <br />
                <asp:Label ID="lblPara" runat="server" Text="Para: " Style="margin-left: 274px" Height="27px" Font-Bold="True" Font-Size="Medium" ForeColor="#333333"></asp:Label>
                <asp:TextBox ID="txtPara" runat="server" Style="margin-left: 81px; margin-top: 22px;" Width="182px" Height="22px" Font-Size="Medium" BackColor="#CCCCCC" BorderColor="#333333" TextMode="Email"></asp:TextBox>
                <asp:CheckBox ID="checkTodos" runat="server" Text="Todos" AutoPostBack="True" Font-Bold="True" Font-Size="Medium" ForeColor="#333333" OnCheckedChanged="checkTodos_CheckedChanged" />
                <br />
                <asp:Label ID="lblAsunto" runat="server" Text="Asunto" Style="margin-left: 274px" Height="27px" Font-Bold="True" Font-Size="Medium" ForeColor="#333333"></asp:Label>
                <asp:TextBox ID="txtAsunto" runat="server" Style="margin-left: 68px; margin-top: 22px;" Width="182px" Height="22px" Font-Size="Medium" BackColor="#CCCCCC" BorderColor="#333333"></asp:TextBox>
                <br />
                <asp:Label ID="lblArchivo" runat="server" Text="Archivos" Style="margin-left: 274px; margin-top: 5px;" Height="16px" Font-Bold="True" Font-Size="Medium" ForeColor="#333333"></asp:Label>
                <asp:FileUpload ID="adjuntar1" runat="server" Style="margin-left: 54px; margin-top: 18px;" Width="386px" Font-Size="Medium" BackColor="#CCCCCC" BorderColor="#333333" />
                <br/>
                <asp:FileUpload ID="adjuntar2" runat="server" Style="margin-left: 399px; margin-top: 3px;" Width="386px" Font-Size="Medium" BackColor="#CCCCCC" BorderColor="#333333"/>
                <br />
                <asp:FileUpload ID="adjuntar3" runat="server" Style="margin-left: 399px; margin-top: 3px;" Width="386px" Font-Size="Medium" BackColor="#CCCCCC" BorderColor="#333333"/>
                <br />
                <asp:Label ID="lblMensaje" runat="server" Text="Mensaje" Style="margin-left: 274px; margin-top: 0px;" Height="27px" Font-Bold="True" Font-Size="Medium" ForeColor="#333333"></asp:Label>
                <asp:TextBox ID="txtMensaje" runat="server" Style="margin-left: 59px; margin-top: 17px;" Width="274px" Height="138px" Font-Size="Medium" BackColor="#CCCCCC" BorderColor="#333333" TextMode="MultiLine"></asp:TextBox>
                <br />
                <asp:Button ID="btnEnviar" runat="server" Text="Enviar" Font-Bold="True" Font-Italic="False" Font-Size="Medium" BackColor="Gray" BorderColor="#333333" BorderStyle="Solid" Height="41px" Style="margin-left: 336px; margin-top: 4px" Width="250px" OnClick="btnEnviar_Click" />
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnEnviar" />
                <asp:AsyncPostBackTrigger ControlID="checkTodos" EventName="CheckedChanged" />
            </Triggers>
        </asp:UpdatePanel>
    </form>

</asp:Content>
