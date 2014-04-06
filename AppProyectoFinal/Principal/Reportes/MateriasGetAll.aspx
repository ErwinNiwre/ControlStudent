<%@ Page Title="" Language="C#" MasterPageFile="~/Estudiantes/MasterEstudiante.master" AutoEventWireup="true" CodeBehind="MateriasGetAll.aspx.cs" Inherits="Principal.Reportes.MateriasGetAll" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoMedio" runat="server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" style="width: 853px">
            <ContentTemplate>
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" style="margin-left: 142px" Width="522px">
                </rsweb:ReportViewer>
            </ContentTemplate>
        </asp:UpdatePanel>

    </form>
</asp:Content>
