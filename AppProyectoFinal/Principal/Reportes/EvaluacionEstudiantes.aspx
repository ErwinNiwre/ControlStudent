<%@ Page Title="" Language="C#" MasterPageFile="~/Estudiantes/MasterEstudiante.master" AutoEventWireup="true" CodeBehind="EvaluacionEstudiantes.aspx.cs" Inherits="Principal.Reportes.EvaluacionEstudiantes" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoMedio" runat="server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" style="width: 853px">
            <ContentTemplate>
                <asp:DropDownList ID="boxGrupos" runat="server" BackColor="#CCCCCC" BorderColor="#333333" Height="35px" Style="margin-left: 195px; margin-top: 0px; margin-bottom: 5px;" Width="159px" Font-Bold="False" Font-Size="Medium" AutoPostBack="True" OnSelectedIndexChanged="boxGrupos_SelectedIndexChanged"></asp:DropDownList>
                <asp:DropDownList ID="boxParaMetroNota" runat="server" BackColor="#CCCCCC" BorderColor="#333333" Height="35px" Style="margin-left: 41px; margin-top: 0px; margin-bottom: 5px;" Width="159px" Font-Bold="False" Font-Size="Medium" AutoPostBack="True" OnSelectedIndexChanged="boxParaMetroNota_SelectedIndexChanged"></asp:DropDownList>
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" style="margin-left: 86px; margin-right: 0px; margin-top: 36px" Width="684px">
                </rsweb:ReportViewer>
            </ContentTemplate>
        </asp:UpdatePanel>

    </form>
</asp:Content>
