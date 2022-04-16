﻿<%@ Page Title="" Language="C#" MasterPageFile="~/templates/Home.Master" AutoEventWireup="true" CodeBehind="ViewApplications.aspx.cs" Inherits="OSAG.student.ViewApplications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left: auto; margin-right: auto; text-align: center;">
        <h3>Jobs In Progress:</h3>
        <asp:GridView ID="grdvwJobs"
            runat="server"
            DataSourceID="sqlsrc"
            OnRowDataBound="grdvwJobs_RowDataBound"
            AllowSorting="true"
            AutoGenerateSelectButton="false"
            HorizontalAlign="Center"
            AutoGenerateColumns="false"
            DataKeyNames="JobID, AppStatus">
            <Columns>
                <asp:BoundField HeaderText="Position" DataField="JobName" SortExpression="JobName" />
                <asp:BoundField HeaderText="Company" DataField="CompanyName" SortExpression="CompanyName" />
                <asp:TemplateField HeaderText="Application Status">
                    <ItemTemplate>
                        <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                            <asp:ListItem Text="Applied" Value="Applied"></asp:ListItem>
                            <asp:ListItem Text="Interviewing" Value="Interviewing"></asp:ListItem>
                            <asp:ListItem Text="Offered" Value="Offered"></asp:ListItem>
                            <asp:ListItem Text="Accepted" Value="Accepted"></asp:ListItem>
                            <asp:ListItem Text="Declined" Value="Declined"></asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnView" runat="server" Text="View" OnClick="btnView_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sqlsrc" runat="server"
            ConnectionString="<%$ ConnectionStrings:OSAG %>"></asp:SqlDataSource>
        <br />
        <br />
        <h3>Internships In Progress:</h3>
        <asp:GridView ID="grdvwInternships"
            runat="server"
            DataSourceID="sqlsrc2"
            OnRowDataBound="grdvwInternships_RowDataBound"
            AllowSorting="true"
            AutoGenerateSelectButton="false"
            HorizontalAlign="Center"
            AutoGenerateColumns="false"
            DataKeyNames="InternshipID, AppStatus">
            <Columns>
                <asp:BoundField HeaderText="Position" DataField="InternshipName" SortExpression="InternshipName" />
                <asp:BoundField HeaderText="Company" DataField="CompanyName" SortExpression="CompanyName" />
                <asp:BoundField HeaderText="Status" DataField="AppStatus" SortExpression="AppStatus" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnView2" runat="server" Text="View" OnClick="btnView2_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:DropDownList ID="ddlStatus2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus2_SelectedIndexChanged">
                            <asp:ListItem Text="Applied" Value="Applied"></asp:ListItem>
                            <asp:ListItem Text="Interviewing" Value="Interviewing"></asp:ListItem>
                            <asp:ListItem Text="Offered" Value="Offered"></asp:ListItem>
                            <asp:ListItem Text="Accepted" Value="Accepted"></asp:ListItem>
                            <asp:ListItem Text="Declined" Value="Declined"></asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sqlsrc2" runat="server"
            ConnectionString="<%$ ConnectionStrings:OSAG %>"></asp:SqlDataSource>
        <br />
        <br />
        <h3>Opportunities In Progress:</h3>
        <asp:GridView ID="grdvwOpportunities"
            runat="server"
            DataSourceID="sqlsrc3"
            OnRowDataBound="grdvwOpportunities_RowDataBound"
            AllowSorting="true"
            AutoGenerateSelectButton="false"
            HorizontalAlign="Center"
            AutoGenerateColumns="false" 
            DataKeyNames="OpportunityID, AppStatus">
            <Columns>
                <asp:BoundField HeaderText="Opportunity" DataField="OpportunityName" SortExpression="OpportunityName" />
                <asp:BoundField HeaderText="Company" DataField="CompanyName" SortExpression="CompanyName" NullDisplayText="N/A" />
                <asp:BoundField HeaderText="Status" DataField="AppStatus" SortExpression="AppStatus" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnView3" runat="server" Text="View" OnClick="btnView3_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:DropDownList ID="ddlStatus3" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus3_SelectedIndexChanged">
                            <asp:ListItem Text="N/A" Value=""></asp:ListItem>
                            <asp:ListItem Text="Applied" Value="Applied"></asp:ListItem>
                            <asp:ListItem Text="Interviewing" Value="Interviewing"></asp:ListItem>
                            <asp:ListItem Text="Offered" Value="Offered"></asp:ListItem>
                            <asp:ListItem Text="Accepted" Value="Accepted"></asp:ListItem>
                            <asp:ListItem Text="Declined" Value="Declined"></asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sqlsrc3" runat="server"
            ConnectionString="<%$ ConnectionStrings:OSAG %>"></asp:SqlDataSource>
    </div>
</asp:Content>
