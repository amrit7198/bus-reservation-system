<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="logincheck.aspx.cs" Inherits="AspBusProject.loginCheck" Theme="all"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-left:35%;padding-top:10%" >
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtUser" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUser" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPass" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPass" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
    </div>
   <p align="center" />
    <asp:Button ID="loginbtn" runat="server" Text="Login" OnClick="loginbtn_Click" />
    <asp:Panel ID="Panel1" runat="server">
        <asp:Label ID="lblmsg" runat="server" Text="lblmsg" Visible="False"></asp:Label>
    </asp:Panel>
</asp:Content>
