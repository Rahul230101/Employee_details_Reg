<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Employee_details._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <div align="center" style="font-size: x-large"><strong>Employee Details</strong></div><br />
    <br />
    <div class="col-lg-8 col-lg-offset-2">
        <table class="table table-striped">
            <tr>
                <th style="font-size: medium; width: 512px;">Name</th>
                <td style="width: 864px">
                    <asp:TextBox CssClass="form-control" runat="server" ID="txtName" style="margin-left: 0"></asp:TextBox></td>
            </tr>
            <tr>
                <th style="font-size: medium; width: 512px;">Age</th>
                <td style="width: 864px">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtAge"></asp:TextBox></td>
            </tr>
            <tr>
                <th style="font-size: medium; width: 512px;">Gender</th>
                <td style="width: 864px">
                    <asp:DropDownList CssClass="btn btn-default dropdown-toggle" runat="server" ID="ddlgender" DataSourceID="SqlDataSource1" DataTextField="Gender" DataValueField="Gender_id" >
                    </asp:DropDownList>
                    
                     
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT [Gender_id], [Gender] FROM [gender]"></asp:SqlDataSource>
                    
                     
                </td>
            </tr>
            
            <tr>
                <td style="width: 512px">
                    <asp:Button CssClass="btn-success" runat="server" ID="btnInsert" Text="Insert" OnClick="btnInsert_Click1" Height="38px" Width="117px" /></td>
                <td style="width: 864px">
                    <asp:Button CssClass="btn-info" runat="server" ID="btnUpdate" Text="Update" OnClick="btnUpdate_Click" Height="38px" Width="119px" />
                    </td>
            </tr>
        </table>
    </div>
    <br />
    <br />
    <div>
        <asp:GridView runat="server" OnRowDeleting="Gridview1_RowDeleting" ID="Gridview1" CssClass="table" DataKeyNames="Age" AutoGenerateColumns="false" >
            <Columns>
                <asp:BoundField HeaderText="Employee_name" DataField="Name"/>
                <asp:BoundField HeaderText="Employee_age" DataField="Age"/>
                <asp:BoundField HeaderText="Gender_ID" DataField="Gender"/>
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:Button CssClass="btn-danger" runat="server" ID="btndelete" Text="Delete" Height="38px" Width="119px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

</asp:Content>
