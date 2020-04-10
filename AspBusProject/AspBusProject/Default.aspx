<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AspBusProject.Default" Theme="all" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 align="center">Search For Services</h2>
<div style="padding-left:35%">
<table >
<tr>
<td align="right">From : </td>
<td><asp:DropDownList ID="ddlFrom" runat="server" DataSourceID="SqlDataSource1"  
        DataTextField="fromcity" DataValueField="fromcity"  Width="200px" 
        AutoPostBack="True"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [fromcity] FROM [services]"></asp:SqlDataSource>
</td>
</tr>
<tr>
<td align="right">To : </td>
<td><asp:DropDownList ID="ddlTo" runat="server" DataSourceID="SqlDataSource2" DataTextField="tocity" DataValueField="tocity" Width="200px"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [tocity] FROM [services]"></asp:SqlDataSource>
</td>
</tr>
<tr>
<td>Journey Date(MM/DD/YYYY) : </td>
<td> <asp:TextBox ID="txtJdate" runat="server"></asp:TextBox>
</td>
</tr>

<tr>
<td align="right">Service Type : </td>
<td> <asp:DropDownList ID="ddlBusType" runat="server" Width="200px">
    <asp:ListItem Value="all">ALL</asp:ListItem>
    <asp:ListItem Value="vo-ss">VO-SS</asp:ListItem>
    <asp:ListItem Value="vo-sl">V0-SL</asp:ListItem>
    
    </asp:DropDownList>
</td>
</tr>
    <tr><td colspan="2" align="center"><asp:Button ID="btnSearch" runat="server" Text="Search" 
        onclick="btnSearch_Click" /></td></tr>
</table>
    </div>
<p />

        
            &nbsp;<asp:Panel ID="Panel1" runat="server" GroupingText="Selected Buses" Visible = "false" >
            
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:TemplateField>
               <ItemTemplate>
                  <input type="radio" 
                      name="selectservice" value='<%# Eval("serviceid")%>'>
                   </input>
               </ItemTemplate>
            </asp:TemplateField>
            
            <asp:BoundField  DataField="serviceid" HeaderText = "Serviec ID" >
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField  DataField="bustype" HeaderText = "Bus Type">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField  DataField="fare" HeaderText = "Fare">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField  DataField="availableseats" HeaderText = "Available Seats">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>


            <asp:BoundField  DataField="sttime" HeaderText = "Dept Time">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField  DataField="runningtime" HeaderText = "Journey Time">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
     </asp:GridView>
     <p align="center" />
            <asp:Button ID="btnBooking" runat="server" Text="Book Seats" 
                onclick="btnBooking_Click" />
            <p />
    </asp:Panel>
</asp:Content>
