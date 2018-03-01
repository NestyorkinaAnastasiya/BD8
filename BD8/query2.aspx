<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="query2.aspx.cs" Inherits="BD8.query2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <b> Запрос №2:</b>
            Увеличить рейтинг поставщика, выполнившего наибольшую поставку некоторой детали, на указанную величину.</div>
        <p>
            Выберите деталь:
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="n_det" DataValueField="n_det">
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Введите величину:
            <asp:TextBox ID="TextBox1" runat="server" Width="22px">0</asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:studentsConnectionString5 %>" ProviderName="<%$ ConnectionStrings:studentsConnectionString5.ProviderName %>" SelectCommand="select n_det from pmib4306.p order by 1"></asp:SqlDataSource>
        </p>
        <p>
            &nbsp;<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Выполнить запрос" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>&nbsp;</b></p>
        <p style="width: 166px; margin-left: 0px">
            &nbsp;<b>Исходные данные</b><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="n_post" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="n_post" HeaderText="n_post" ReadOnly="True" SortExpression="n_post" />
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:BoundField DataField="reiting" HeaderText="reiting" SortExpression="reiting" />
                    <asp:BoundField DataField="town" HeaderText="town" SortExpression="town" />
                </Columns>
            </asp:GridView>
            &nbsp;</p>
        <p style="width: 212px; margin-left: 0px">
            <b>Результирующие данные</b><asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="n_post" DataSourceID="SqlDataSource2" style="margin-left: 0px; margin-top: 0px">
                <Columns>
                    <asp:BoundField DataField="n_post" HeaderText="n_post" ReadOnly="True" SortExpression="n_post" />
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:BoundField DataField="reiting" HeaderText="reiting" SortExpression="reiting" />
                    <asp:BoundField DataField="town" HeaderText="town" SortExpression="town" />
                </Columns>
            </asp:GridView>
        </p>
        <p style="width: 693px">
            &nbsp;
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:studentsConnectionString6 %>" ProviderName="<%$ ConnectionStrings:studentsConnectionString6.ProviderName %>" SelectCommand="select * from pmib4306.s"></asp:SqlDataSource>
            <asp:Label ID="Label2" runat="server"></asp:Label>
        </p>
        <p style="width: 692px">
            <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
        </p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" PostBackUrl="~/loadpage.aspx" Text="Перейти на главную страницу" style="margin-top: 0px" Width="203px" />
        <br />
        <p style="margin-left: 2px">
            Выполнили студенты группы ПМ-43 Нестёркина А. А., Щанкина Л. Ю.</p>
    </form>
</body>
</html>
