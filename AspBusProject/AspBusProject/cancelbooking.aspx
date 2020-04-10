<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" Inherits="AspBusProject.cancelbooking" Codebehind="cancelbooking.aspx.cs" Theme="all" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2 align="center">Cancel Booking</h2>
    <div style="padding-left:35%">
        <table>
            <tr>
                <td>
                    <asp:Label ID="label1" runat="server" Text="Enter Booking Id"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtBookingid" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                </td>
            </tr>
        </table>
    </div>
    <p align="center" />
    <asp:Button ID="btnCancelBooking" runat="server" Text="Cancel Booking" 
            onclick="btnCancelBooking_Click" />
    <asp:Panel ID="Panel1" runat="server">
        <asp:Label ID="lblMsg" runat="server" Text="" ></asp:Label>
    </asp:Panel>
</asp:Content>

