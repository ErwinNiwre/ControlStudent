<%@ Page Title="" Language="C#" MasterPageFile="~/Estudiantes/MasterEstudiante.master" AutoEventWireup="true" CodeBehind="Notas.aspx.cs" Inherits="Principal.Estudiantes.Notas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoMedio" runat="server">

    <h1 style="font-size: xx-large; width: 346px; margin-left: 261px; height: 32px;">NOTAS ESTUDIANTES</h1>

    <form id="formNotas" runat="server" style="width: 864px; margin-top: 27px; height: 575px;">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="panelNotas" runat="server">
            <ContentTemplate>
                <asp:Label ID="lblGrupo" runat="server" Text="Grupo: " Style="margin-left: 204px" Font-Bold="True" Font-Size="Medium" ForeColor="#333333"></asp:Label>
                <asp:DropDownList ID="boxGrupos" runat="server" BackColor="#CCCCCC" BorderColor="#333333" Height="35px" Style="margin-left: 41px; margin-top: 0px; margin-bottom: 5px;" Width="159px" Font-Bold="False" Font-Size="Medium" AutoPostBack="True" OnSelectedIndexChanged="boxGrupos_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:DropDownList ID="boxEvaluacion" runat="server" BackColor="#CCCCCC" BorderColor="#333333" Height="35px" Style="margin-left: 41px; margin-top: 0px; margin-bottom: 5px;" Width="159px" Font-Bold="False" Font-Size="Medium" AutoPostBack="True" OnSelectedIndexChanged="boxEvaluacion_SelectedIndexChanged"></asp:DropDownList>
                <br />
                <asp:GridView ID="gridNotas" runat="server" AutoGenerateColumns="False" Style="margin-top: 15px; margin-left: 23px; margin-right: 12px;" Width="788px" Font-Size="Medium">
                    <Columns>
                        <asp:BoundField DataField="Nit" HeaderText="Codigo" ReadOnly="True" SortExpression="Nit">
                            <ControlStyle Width="0px" />
                            <HeaderStyle Width="900px" />
                            <ItemStyle Width="50px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="nombre" HeaderText="Nombre" ReadOnly="True" SortExpression="nombre">
                            <ControlStyle Width="0px" />
                            <HeaderStyle Width="900px" />
                            <ItemStyle Width="50px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="apellido" HeaderText="Apellido" ReadOnly="True" SortExpression="apellido">
                            <ControlStyle Width="0px" />
                            <HeaderStyle Width="900px" />
                            <ItemStyle Width="50px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Nota">
                            <ItemTemplate>
                                <asp:TextBox ID="txtNota" runat="server" TextMode="Number"></asp:TextBox>
                            </ItemTemplate>
                            <ControlStyle Width="50px" />
                            <HeaderStyle Width="50px" />
                            <ItemStyle Width="50px" />
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
                <asp:Button ID="btnAceptar" runat="server" Text="Guardar Notas" style="margin-left: 303px; margin-top: 13px; margin-bottom: 9px" Width="225px" BackColor="Gray" BorderColor="#333333" BorderStyle="Solid" Font-Bold="True" Font-Italic="False" Font-Size="Medium" OnClick="btnAceptar_Click" Height="43px" />
            </ContentTemplate>

        </asp:UpdatePanel>

    </form>
</asp:Content>
