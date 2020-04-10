<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" Inherits="AspBusProject.feedback" Title="Feedback" Codebehind="feedback.aspx.cs" Theme="all" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2 align="center">Feedback</h2>
 <div style="padding-left:35%">
<table>
 <tr>
 <td align="right">Service Id :  </td>
 <td><asp:TextBox ID="txtServiceId" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtServiceId" ErrorMessage="*"></asp:RequiredFieldValidator>
     </td>
 </tr>
 <tr>
 <td>Journey Date(MM/DD/YYYY) :  </td>
 <td><asp:TextBox ID="txtJdate" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtJdate" ErrorMessage="*"></asp:RequiredFieldValidator>
     </td>
 </tr>
 <tr>
 <td align="right">Seat No :  </td>
 <td><asp:TextBox ID="txtSeatno" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSeatno" ErrorMessage="*"></asp:RequiredFieldValidator>
     </td>
 </tr>
 <tr>
 <td align="right">Feedback :  </td>
 <td><asp:TextBox ID="txtFeedback" runat="server" 
     TextMode = "MultiLine"  Rows="5" Columns = "50"
 ></asp:TextBox></td>
 </tr>
</table>
     </div>
<p align="center" />
 <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
        onclick="btnSubmit_Click" />
 <p />
 <asp:Label ID="lblMsg" runat="server" Text="" EnableViewState ="false"></asp:Label>

</asp:Content>

