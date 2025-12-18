<%@ Page Title="" Language="C#" MasterPageFile="~/layout.Master" AutoEventWireup="true" CodeBehind="TraCuu.aspx.cs" Inherits="Lab_05.TraCuu" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center; padding: 10px; background-color: #eee;">
        Giá từ:
        <asp:TextBox ID="txtTu" runat="server"></asp:TextBox>
        đến:
        <asp:TextBox ID="txtDen" runat="server"></asp:TextBox>
        <asp:Button ID="btnTim" runat="server" Text="Tìm kiếm" />
        <br />
        <asp:CompareValidator ID="cv1" runat="server" ControlToValidate="txtTu" Operator="DataTypeCheck" Type="Double" ErrorMessage="Giá từ phải là số!" ForeColor="Red"></asp:CompareValidator>
        <asp:CompareValidator ID="cv2" runat="server" ControlToValidate="txtDen" Operator="DataTypeCheck" Type="Double" ErrorMessage="Giá đến phải là số!" ForeColor="Red"></asp:CompareValidator>
    </div>

    <asp:SqlDataSource ID="dsSearch" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDB %>"
        SelectCommand="SELECT * FROM Hoa WHERE Gia >= @GiaTu AND Gia <= @GiaDen">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtTu" Name="GiaTu" PropertyName="Text" Type="Double" DefaultValue="0" />
            <asp:ControlParameter ControlID="txtDen" Name="GiaDen" PropertyName="Text" Type="Double" DefaultValue="999999999" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:DataList ID="dlSearch" runat="server" DataSourceID="dsSearch" RepeatColumns="4" Width="100%">
        <ItemTemplate>
            <div style="border: 1px solid #ccc; text-align: center; margin: 5px; padding: 10px;">
                <img src='<%# "hinh_san_pham/" + Eval("Hinh") %>' width="150" /><br />
                <b><%# Eval("TenHoa") %></b><br />
                Giá: <%# Eval("Gia", "{0:#,##0} đ") %>
            </div>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
