<%@ Page Title="" Language="C#" MasterPageFile="~/Estudiantes/MasterEstudiante.master" AutoEventWireup="true" CodeBehind="Asistencia.aspx.cs" Inherits="Principal.Estudiantes.Asistencia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoMedio" runat="server">
    <h1 style="font-size: xx-large; width: 434px; margin-left: 210px; height: 32px;">ASISTENCIA ESTUDIANTES</h1>


    <form id="Form1" runat="server" style="width: 864px; margin-top: 27px; height: 575px;">

        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true">
        </asp:ScriptManager>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:DropDownList ID="boxGrupos" runat="server" BackColor="#CCCCCC" BorderColor="#333333" Height="28px" Style="margin-left: 250px; margin-top: 0px; margin-bottom: 5px;" Width="128px" Font-Bold="False" Font-Size="Medium" AutoPostBack="True" OnTextChanged="boxGrupos_TextChanged"></asp:DropDownList>
                <asp:TextBox ID="txtFecha" runat="server" BackColor="#CCCCCC" BorderColor="#333333" Height="25px" Style="margin-left: 12px" Width="128px" Font-Size="Medium"></asp:TextBox>
                <asp:Button ID="btnFecha" runat="server" Text="Fecha" BackColor="Gray" BorderColor="#333333" BorderStyle="Solid" Height="32px" OnClick="btnFecha_Click" Style="margin-left: 17px; margin-top: 0px" Width="83px" Font-Bold="True" Font-Italic="False" Font-Size="Medium" />
                <asp:Calendar ID="calendario" runat="server" BackColor="Silver" BorderColor="#333333" DayNameFormat="FirstLetter" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="#333333" Height="50px" NextPrevFormat="ShortMonth" Style="margin-left: 369px; margin-top: 18px;" TitleFormat="Month" Width="167px" OnSelectionChanged="calendario_SelectionChanged" Visible="False">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                    <DayStyle Width="14%" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                    <TitleStyle BackColor="#333333" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                    <TodayDayStyle BackColor="#CCCC99" />
                </asp:Calendar>
                <asp:GridView ID="gridAsistencia" runat="server" AutoGenerateColumns="False" Style="margin-top: 15px; margin-left: 129px; margin-right: 12px;" Width="617px" Font-Size="Medium">
                    <Columns>
                        <asp:BoundField HeaderText="Codigo" HeaderStyle-Width="100%" ControlStyle-Width="100px" ItemStyle-Width="50px" DataField="nit">
                            <ControlStyle Width="100px" />
                            <HeaderStyle Width="300px" Font-Overline="False" Font-Strikeout="False" />
                            <ItemStyle Width="50px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="nombre" HeaderStyle-Width="100%" HeaderText="Nombre" ControlStyle-Width="100px" ItemStyle-Width="50px">
                            <HeaderStyle Width="300px" />
                            <ControlStyle Width="100px" />
                            <ItemStyle Width="50px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="apellido" HeaderText="Apellido" >
                        <HeaderStyle Width="300px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Asi">
                            <ItemTemplate>
                                <asp:CheckBox ID="ckBoxAsistio" runat="server" OnCheckedChanged="ckBoxAsistio_CheckedChanged" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar Asistencia" Height="40px" style="margin-left: 257px; margin-top: 13px; margin-bottom: 9px" Width="351px" BackColor="Gray" BorderColor="#333333" BorderStyle="Solid" Font-Bold="True" Font-Italic="False" Font-Size="Medium" OnClick="btnGuardar_Click" Enabled="False"/>

            </ContentTemplate>

        </asp:UpdatePanel>
    </form>

</asp:Content>
