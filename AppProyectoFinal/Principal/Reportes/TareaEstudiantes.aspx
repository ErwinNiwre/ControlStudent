<%@ Page Title="" Language="C#" MasterPageFile="~/Estudiantes/MasterEstudiante.master" AutoEventWireup="true" CodeBehind="TareaEstudiantes.aspx.cs" Inherits="Principal.Reportes.TareaEstudiantes" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoMedio" runat="server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" style="width: 853px" >
            <ContentTemplate>
                <asp:DropDownList ID="boxGrupo" runat="server" BackColor="#CCCCCC" BorderColor="#333333" Height="35px" Style="margin-left: 314px; margin-top: 0px; margin-bottom: 5px;" Width="157px" Font-Bold="False" Font-Size="Medium" AutoPostBack="True" OnSelectedIndexChanged="boxGrupo_SelectedIndexChanged"></asp:DropDownList>

                <rsweb:ReportViewer ID="ReportViewer1" runat="server" style="margin-left: 77px; margin-top: 42px" Width="717px">
                </rsweb:ReportViewer>

            </ContentTemplate>
</asp:UpdatePanel>

    </form>
</asp:Content>
