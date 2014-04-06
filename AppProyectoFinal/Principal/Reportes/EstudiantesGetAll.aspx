<%@ Page Title="" Language="C#" MasterPageFile="~/Estudiantes/MasterEstudiante.master" AutoEventWireup="true" CodeBehind="EstudiantesGetAll.aspx.cs" Inherits="Principal.Reportes.EstudiantesGetAll" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoMedio" runat="server">
    <form id="FormEstudiantesGetAll" runat="server" style="width: 853px">
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" style="margin-right: 301px">
        </rsweb:ReportViewer>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    </form>

</asp:Content>
