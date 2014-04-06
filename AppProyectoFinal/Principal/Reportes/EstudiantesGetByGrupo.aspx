<%@ Page Title="" Language="C#" MasterPageFile="~/Estudiantes/MasterEstudiante.master" AutoEventWireup="true" CodeBehind="EstudiantesGetByGrupo.aspx.cs" Inherits="Principal.Reportes.EstudiantesGetByGrupo" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoMedio" runat="server">
    <form id="form1" runat="server" style="width: 844px">
        <asp:DropDownList ID="boxGrupo" runat="server" Width="169px" AutoPostBack="true" OnSelectedIndexChanged="boxGrupo_SelectedIndexChanged" Height="16px">
        </asp:DropDownList>
        <br/>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Height="278px" style="margin-left: 94px; margin-right: 18px; margin-bottom: 0px" Width="414px">
        </rsweb:ReportViewer>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

    </form>
</asp:Content>
