<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loadpage.aspx.cs" Inherits="BD8.loadpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="width: 604px">
    <form id="form1" runat="server">
        <div>
            <b>Лабораторная работа №8</b></div>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
        <p style="margin-left: 80px">
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Query1" runat="server" OnClick="Query1_Click" PostBackUrl="~/query1.aspx" Text="Запрос №1" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Query2" runat="server" PostBackUrl="~/query2.aspx" Text="Запрос №2" />
        </p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="UpdateTable" runat="server" OnClick="UpdateTable_Click" Text="Обновить таблицы" />
        </p>
        <p>
            <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
            <asp:Label ID="Label2" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </p>
        <p style="margin-left: 0px">
            Выполнили студенты группы ПМ-43&nbsp;Нестёркина А. А., Щанкина Л. Ю.</p>
    </form>
</body>
</html>
