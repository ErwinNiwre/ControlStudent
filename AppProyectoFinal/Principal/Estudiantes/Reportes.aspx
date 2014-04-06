<%@ Page Title="" Language="C#" MasterPageFile="~/Estudiantes/MasterEstudiante.master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="Principal.Estudiantes.Reportes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoMedio" runat="server">
    <h1 style="font-size: xx-large; width: 151px; margin-left: 384px; height: 32px;">Reportes</h1>

    <form id="FormAdministrarNotas" runat="server" style="width: 864px; margin-top: 27px; height: 575px;">
        <asp:HyperLink ID="HyperLink1" runat="server" Style="font-size: large;" OnLoad="HyperLink1_Load"> <a href="/Reportes/EstudiantesGetAll.aspx"/>Reporte de las materias a los que esta asignado</asp:HyperLink>
        <br />
        <br />
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server" Style="font-size: large;" OnLoad="HyperLink1_Load"> <a href="/Reportes/EstudiantesGetByGrupo.aspx"/>Reporte de estudiantes por grupo </asp:HyperLink>
        <br />
        <br />
        <br />
        <asp:HyperLink ID="HyperLink3" runat="server" Style="font-size: large;" OnLoad="HyperLink1_Load"> <a href="/Reportes/EvaluacionEstudiantes.aspx"/>Reporte de las evaluaciones </asp:HyperLink>
        <br />
        <br />
        <br />
        <asp:HyperLink ID="HyperLink4" runat="server" Style="font-size: large;" OnLoad="HyperLink1_Load"> <a href="/Reportes/AsistenciaEstudiantes.aspx"/>Reporte de asistencias </asp:HyperLink>
        <br />
        <br />
        <br />
        <asp:HyperLink ID="HyperLink5" runat="server" Style="font-size: large;" OnLoad="HyperLink1_Load"> <a href="/Reportes/TareaEstudiantes.aspx"/>Reporte de tareas enviadas </asp:HyperLink>
        <br />
        <br />
        <br />
        <asp:HyperLink ID="HyperLink6" runat="server" Style="font-size: large;" OnLoad="HyperLink1_Load"> <a href="/Reportes/NotaTotalEstudiante.aspx"/>Reporte del total de las notas</asp:HyperLink>
        <br />
        <br />
        <br />
        <asp:HyperLink ID="HyperLink7" runat="server" Style="font-size: large;" OnLoad="HyperLink1_Load"> <a href="/Reportes/DocentesGetAll.aspx"/>Reporte De todos los docentes</asp:HyperLink>
        <br />
        <br />
        <br />
        <asp:HyperLink ID="HyperLink8" runat="server" Style="font-size: large;" OnLoad="HyperLink1_Load"> <a href="/Reportes/CarrerasGetAll.aspx"/>Reporte De todas las carreras</asp:HyperLink>
        <br />
        <br />
        <br />
        <asp:HyperLink ID="HyperLink9" runat="server" Style="font-size: large;" OnLoad="HyperLink1_Load"> <a href="/Reportes/MateriasGetAll.aspx"/>Reporte De todas las materias</asp:HyperLink>
        <br />
        <br />
        <br />
        <asp:HyperLink ID="HyperLink10" runat="server" Style="font-size: large;" OnLoad="HyperLink1_Load"> <a href="/Reportes/NotasAdministradas.aspx"/>Reporte De las notas que fueron administradas</asp:HyperLink>
        <br />
        <br />
        <br />
        <asp:HyperLink ID="HyperLink11" runat="server" Style="font-size: large;" OnLoad="HyperLink1_Load"> <a href="/Reportes/GruposGetAll.aspx"/>Reporte De todos lso grupos existentes</asp:HyperLink>
        <asp:HyperLink ID="HyperLink12" runat="server" Style="font-size: large;" OnLoad="HyperLink1_Load"> <a href="/Reportes/EjemploSergio.aspx"/>Sergio</asp:HyperLink>
    </form>

</asp:Content>
