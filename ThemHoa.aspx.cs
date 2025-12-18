using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab_05
{
    public partial class ThemHoa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["HoaTuoiDB"].ConnectionString;
            using (System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(connStr))
            {
                string sql = "INSERT INTO Hoa(TenHoa, Gia, Hinh, MaLoai, NgayDang, SoLuotXem) VALUES (@Ten, @Gia, @Hinh, @MaLoai, @Ngay, 0)";
                System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(sql, conn);

                string fileName = "no_image.png";
                if (fHinh.HasFile)
                {
                    fileName = fHinh.FileName;
                    fHinh.SaveAs(Server.MapPath("~/hinh_san_pham/") + fileName);
                }

                cmd.Parameters.AddWithValue("@Ten", txtTen.Text);
                cmd.Parameters.AddWithValue("@Gia", txtGia.Text);
                cmd.Parameters.AddWithValue("@Hinh", fileName);
                cmd.Parameters.AddWithValue("@MaLoai", ddlLoai.SelectedValue);
                cmd.Parameters.AddWithValue("@Ngay", calNgay.SelectedDate == DateTime.MinValue ? DateTime.Now : calNgay.SelectedDate);

                conn.Open();
                if (cmd.ExecuteNonQuery() > 0) lblMsg.Text = "Thêm thành công!"; // [cite: 97]
                else lblMsg.Text = "Thêm thất bại!";
            }
        }
    }
}