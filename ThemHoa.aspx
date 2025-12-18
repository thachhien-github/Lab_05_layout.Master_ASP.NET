<%@ Page Title="" Language="C#" MasterPageFile="~/layout.Master" AutoEventWireup="true" CodeBehind="ThemHoa.aspx.cs" Inherits="Lab_05.ThemHoa" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="margin: 0 auto; width: 500px;">
        <tr>
            <td>Danh mục:</td>
            <td>
                <asp:DropDownList ID="ddlLoai" runat="server" DataSourceID="dsLoai" DataTextField="TenLoai" DataValueField="MaLoai"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>Tên hoa:</td>
            <td>
                <asp:TextBox ID="txtTen" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rf1" runat="server" ControlToValidate="txtTen" ErrorMessage="Không được rỗng" ForeColor="Red"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>Giá:</td>
            <td>
                <asp:TextBox ID="txtGia" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rf2" runat="server" ControlToValidate="txtGia" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cv3" runat="server" ControlToValidate="txtGia" Operator="DataTypeCheck" Type="Double" ErrorMessage="Phải là số" ForeColor="Red"></asp:CompareValidator></td>
        </tr>
        <tr>
            <td>Ngày cập nhật:</td>
            <td>
                <asp:Calendar ID="calNgay" runat="server"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <td>Hình:</td>
            <td>
                <asp:FileUpload ID="fHinh" runat="server" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnThem" runat="server" Text="Thêm mới" OnClick="btnThem_Click" /></td>
        </tr>
    </table>
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
    <asp:SqlDataSource ID="dsLoai" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDB %>" SelectCommand="SELECT * FROM Loai"></asp:SqlDataSource>
</asp:Content>
