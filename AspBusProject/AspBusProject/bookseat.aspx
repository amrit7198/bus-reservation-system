<%@ Page Title="Book Seat" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="True" CodeBehind="bookseat.aspx.cs" Inherits="AspBusProject.bookseat" Theme="all"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2 align="center">Book Seat</h2>
<div style="padding-left:35%">
<table>
<tr>
<td>Passenger Name :  </td>
<td> <asp:TextBox ID="txtPassengerName" runat="server" Width="200px" AutoCompleteType="Disabled"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPassengerName" ErrorMessage="*"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPassengerName" ErrorMessage="Enter valid name" ValidationExpression="[A-Za-z]* ?[A-Za-z]*"></asp:RegularExpressionValidator>
</td>
</tr>

<tr>
<td>Gender : </td>
<td>
  <asp:RadioButton GroupName ="gender" ID="rbMale" runat="server"  Text="Male"/>
  <asp:RadioButton GroupName ="gender" ID="rbFemale" runat="server" Text="Female" />
</td>
</tr>

<tr>
<td>Age : </td>
<td> <asp:TextBox ID="txtAge" runat="server"  Width="100px" AutoCompleteType="Disabled"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAge" ErrorMessage="*"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtAge" ErrorMessage="Enter valid age" ValidationExpression="[0-9][0-9]?"></asp:RegularExpressionValidator>
</td>
</tr>

<tr>
<td>Phone Number : </td>
<td><asp:TextBox ID="txtPhone" runat="server" Width="200px" OnTextChanged="txtPhone_TextChanged" AutoCompleteType="Disabled" ></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPhone" ErrorMessage="*"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPhone" ErrorMessage="Enter valid mobile number" ValidationExpression="[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]"></asp:RegularExpressionValidator>
</td>
</tr>
</table>
</div>
<p  align="center" />
    <asp:Button ID="btnBook" runat="server" Text="Book Seat" 
        onclick="btnBook_Click" />
    <p />
    
    <asp:Label ID="lblMsg" runat="server" EnableViewState ="false" ></asp:Label> 
    
    <asp:Panel ID="panelInfo" runat="server" GroupingText = "Booking Information"  Visible ="false">
    <h4>
        Please use the following information and contact the agency from Contact Us page to get your confirmation ticket. 
    </h4>
    
    <table>
    <tr> 
      <td>Booking Id :  </td>
      <td><asp:Label ID="lblBookingId" runat="server"  Text=""  ></asp:Label></td>
    </tr>
    <tr>      
    <td>Seat No. :  </td>
    <td><asp:Label ID="lblSeatno" runat="server"  Text=""  ></asp:Label> </td>
    </tr>
    </table>
    
    </asp:Panel>
</asp:Content>

