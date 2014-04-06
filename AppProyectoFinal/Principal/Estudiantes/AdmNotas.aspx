<%@ Page Title="" Language="C#" MasterPageFile="~/Estudiantes/MasterEstudiante.master" AutoEventWireup="true" CodeBehind="AdmNotas.aspx.cs" Inherits="Principal.Estudiantes.AdmNotas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoMedio" runat="server">
    <h1 style="font-size: xx-large; width: 347px; margin-left: 243px; height: 32px;">ADMINISTRAR NOTAS</h1>
    <form id="FormAdministrarNotas" runat="server" style="width: 864px; margin-top: 27px; height: 575px;">
        <asp:Label ID="lblGrupo" runat="server" Text="Grupo: " Style="margin-left: 274px" Font-Bold="True" Font-Size="Medium" ForeColor="#333333"></asp:Label>
        <asp:DropDownList ID="boxGrupos" runat="server" BackColor="#CCCCCC" BorderColor="#333333" Height="28px" Style="margin-left: 27px; margin-top: 0px; margin-bottom: 5px;" Width="159px" Font-Bold="False" Font-Size="Medium" AutoPostBack="true" OnSelectedIndexChanged="boxGrupos_SelectedIndexChanged"></asp:DropDownList>
        <asp:GridView ID="gridInsertarNota" runat="server" AutoGenerateColumns="False" Style="margin-top: 15px; margin-left: 129px; margin-right: 12px;" Width="617px" Font-Size="Medium">
            <Columns>
                <asp:BoundField DataField="id_ParametroNota" HeaderText="idParametroNOta" ReadOnly="True" SortExpression="id_ParametroNota" />
                <asp:BoundField DataField="observacion" HeaderText="Evaluacion" ReadOnly="True" SortExpression="observacion" />
                <asp:TemplateField HeaderText="Nota">
                    <HeaderStyle Width="62px" />
                    <ControlStyle Width="50px" />
                    <ItemTemplate>
                        <asp:TextBox ID="txtNota" runat="server" BackColor="#CCCCCC" BorderColor="#333333" Height="20px" Style="margin-left: 5px" Width="128px" Font-Size="Medium">
                        </asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" Style="margin-left: 257px; margin-top: 13px; margin-bottom: 9px; height: 29px;" Width="351px" BackColor="Gray" BorderColor="#333333" BorderStyle="Solid" Font-Bold="True" Font-Italic="False" Font-Size="Medium" OnClick="btnGuardar_Click" />
    </form>
</asp:Content>
