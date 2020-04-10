<%@ Page Title="" Language="C#" MasterPageFile="~/login.master" AutoEventWireup="true" CodeBehind="generatebus.aspx.cs" Inherits="AspBusProject.generatebus" Theme="all" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-left:35%">
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Enter Startding Date"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtStdate" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtStdate" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Enter Ending Date"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEnddate" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEnddate" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
    </div>
   <div style="padding-left:45%">
    <asp:Button ID="btnGenerate" runat="server" Text="Generate Buses" 
            onclick="btnGenerate_Click" />
    </div>
 
    <asp:Panel ID="Panel1" runat="server">
        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
    </asp:Panel>
</asp:Content>
