<%@ Page Title="" Language="C#" MasterPageFile="~/layout.Master" AutoEventWireup="true" CodeBehind="ShowHoa.aspx.cs" Inherits="Lab_05.ShowHoa" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center">
        <h2>DANH MỤC HOA</h2>
        Chọn loại hoa: 
        <asp:DropDownList ID="ddlLoai" runat="server" AutoPostBack="True"
            DataSourceID="dsLoai" DataTextField="TenLoai" DataValueField="MaLoai">
        </asp:DropDownList>
    </div>

    <asp:SqlDataSource ID="dsLoai" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDB %>" SelectCommand="SELECT * FROM Loai"></asp:SqlDataSource>

    <asp:SqlDataSource ID="dsHoa" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDB %>"
        SelectCommand="SELECT * FROM Hoa WHERE MaLoai = @MaLoai">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlLoai" Name="MaLoai" PropertyName="SelectedValue" Type="Int32" DefaultValue="1" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:DataList ID="dlHoa" runat="server" DataSourceID="dsHoa" RepeatColumns="4" RepeatDirection="Horizontal" Width="100%">
        <ItemTemplate>
            <div style="border: 1px solid #ccc; margin: 10px; padding: 10px; text-align: center;">
                <asp:Image ID="imgHoa" runat="server" ImageUrl='<%# "~/Hinh_San_Pham/" + Eval("Hinh") %>' Width="150px" Height="150px" /><br />
                <asp:Label ID="lblTen" runat="server" Text='<%# Eval("TenHoa") %>' Font-Bold="True"></asp:Label><br />
                Giá bán:
                <asp:Label ID="lblGia" runat="server" Text='<%# Eval("Gia", "{0:#,##0} đồng") %>'></asp:Label><br />
                <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart" BackColor="#4CAF50" ForeColor="White" />
            </div>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>