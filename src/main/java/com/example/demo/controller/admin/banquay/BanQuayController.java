package com.example.demo.controller.admin.banquay;


import com.example.demo.entity.auth.RoleEnum;
import com.example.demo.entity.dto.HoaDonDTO;
import com.example.demo.entity.giamgia.GiamGiaSanPhamChiTiet;
import com.example.demo.entity.khachhang.HoaDon;
import com.example.demo.entity.khachhang.HoaDonChiTiet;
import com.example.demo.entity.khachhang.Users;
import com.example.demo.entity.sanpham.Ao;
import com.example.demo.entity.sanpham.AoChiTiet;
import com.example.demo.entity.sanpham.ChatVai;
import com.example.demo.entity.sanpham.Form;
import com.example.demo.entity.sanpham.Hang;
import com.example.demo.entity.sanpham.LoaiAo;
import com.example.demo.entity.sanpham.MauSac;
import com.example.demo.entity.sanpham.Size;
import com.example.demo.repo.users.UsersRepo;
import com.example.demo.ser.chat.ChatSer;
import com.example.demo.ser.giamgia.GiamGiaSanPhamChiTietSer;
import com.example.demo.ser.sanpham.AnhSer;
import com.example.demo.ser.sanpham.AoChiTietSer;
import com.example.demo.ser.sanpham.AoSer;
import com.example.demo.ser.sanpham.ChatVaiSer;
import com.example.demo.ser.sanpham.FormSer;
import com.example.demo.ser.sanpham.HangSer;
import com.example.demo.ser.sanpham.LoaiAoSer;
import com.example.demo.ser.sanpham.MauSacSer;
import com.example.demo.ser.sanpham.SizeSer;
import com.example.demo.ser.users.HoaDonChiTietSer;
import com.example.demo.ser.users.HoaDonSer;
import com.example.demo.ser.users.UsersSer;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/admin/ban-quay")
public class BanQuayController {

    @Autowired
    AoSer aoSer;

    @Autowired
    ChatVaiSer chatVaiSer;

    @Autowired
    LoaiAoSer loaiAoSer;

    @Autowired
    HangSer hangSer;

    @Autowired
    FormSer formSer;

    @Autowired
    AoChiTietSer aoChiTietSer;

    @Autowired
    SizeSer sizeSer;

    @Autowired
    MauSacSer mauSacSer;

    @Autowired
    AnhSer anhSer;

    @Autowired
    private HoaDonSer hoaDonSer;

    @Autowired
    private UsersSer usersSer;

    @Autowired
    private UsersRepo usersRepo;

    @Autowired
    private GiamGiaSanPhamChiTietSer giamGiaSanPhamChiTietSer;

    @Autowired
    private HoaDonChiTietSer hoaDonChiTietSer;

    @Autowired
    ChatSer chatSer;

    @GetMapping("/trang-chu")
    public String view(Model model, HttpServletRequest request) {

//        String url = request.getRequestURI();
//        String[] parts = url.split("/admin/ban-quay/");
//        String ma = parts[1];

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;
        if (user.getRole() == RoleEnum.STAFF){
            model.addAttribute("adminOrStaff", "1");
        }else if (user.getRole() == RoleEnum.ADMIN){
            model.addAttribute("adminOrStaff", "2");
        }
        model.addAttribute("nameUser", user.getTen());

        ArrayList<HoaDon> listHD = (ArrayList<HoaDon>) hoaDonSer.listHoaDonFindByTrangThaiCho(5);
        model.addAttribute("listHD", listHD);

        ArrayList<Users> listKH = (ArrayList<Users>) usersSer.getAll();
        model.addAttribute("listKH", listKH);
        model.addAttribute("allChat", chatSer.soTinNhanChuaDoc());

//        int tongSoLuong= hoaDonChiTietSer.soLuongSanPham(5,);
//        model.addAttribute("soSanPham",tongSoLuong);

//        try {
//            Users users = usersSer.findByMa(ma);
//
//            model.addAttribute("idKh", users.getMa());
//            model.addAttribute("tenKh", users.getTen());
//        } catch (Exception e) {
//            model.addAttribute("idKh", "2");
//            model.addAttribute("tenKh", "2");
//        }

        return "/ban_quay/trang_chu";
    }

    @GetMapping("/view-cart/{id}")
    public String viewHD(Model model, @PathVariable("id") UUID id, HttpSession session, HttpServletRequest request) {

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;
        if (user.getRole() == RoleEnum.STAFF){
            model.addAttribute("adminOrStaff", "1");
        }else if (user.getRole() == RoleEnum.ADMIN){
            model.addAttribute("adminOrStaff", "2");
        }
        model.addAttribute("nameUser", user.getTen());

        List<Users> listKhachHang = usersSer.findAllKhachHang();
        model.addAttribute("listKhachHang", listKhachHang);

        List<Ao> listAos = aoSer.findAllByTrangThai(2);
        List<Hang> listHangs = hangSer.findAllByTrangThai(1);
        List<ChatVai> listChatVais = chatVaiSer.findAllByTrangThai(1);
        List<LoaiAo> listLoaiAos = loaiAoSer.findAllByTrangThai(1);
        List<Form> listForms = formSer.findAllByTrangThai(1);
        List<MauSac> listMauSacs = mauSacSer.findAllByTrangThai(1);
        List<Size> listSizes = sizeSer.findAllByTrangThai(1);

        int slHDCTByHoaDon = hoaDonChiTietSer.soLuongHoaDonCHiTietByHoaDon(id);

        model.addAttribute("listChatVais", listChatVais);
        model.addAttribute("listLoaiAos", listLoaiAos);
        model.addAttribute("listForms", listForms);
        model.addAttribute("listMauSacs", listMauSacs);
        model.addAttribute("listSizes", listSizes);
        model.addAttribute("listAos", listAos);
        model.addAttribute("listHangs", listHangs);
        model.addAttribute("idHoaDon", id);
        model.addAttribute("allChat", chatSer.soTinNhanChuaDoc());
        model.addAttribute("slHDCTByHoaDon", slHDCTByHoaDon);
//Detail
        String aoDetail = (String) session.getAttribute("aoDetail");


        if (aoDetail == null) {
            model.addAttribute("noneOrBlock", "none");
        } else {
            model.addAttribute("noneOrBlock", "block");
            Ao aoDetail1 = aoSer.findByMa(aoDetail);
            model.addAttribute("ao", aoSer.findById(aoDetail1.getId()));
            model.addAttribute("slAoDaBan", aoSer.soLuongBanByUUID(aoDetail1.getId()));
            model.addAttribute("anhs", anhSer.findAllByAoId(aoDetail1.getId()));
            model.addAttribute("mauSacs", aoChiTietSer.findMauSacByIdAo(aoDetail1.getId()));
            model.addAttribute("sizes", aoChiTietSer.findSizeByIdAo(aoDetail1.getId()));
            System.out.println(aoDetail1.getId());

            try {
                GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet = giamGiaSanPhamChiTietSer.findByIdAoAndTrangThai(aoDetail1.getId());
                model.addAttribute("giamgia", giamGiaSanPhamChiTiet.getGiamGiaSanPham().getPhanTramGiam());
                model.addAttribute("time", giamGiaSanPhamChiTiet.getGiamGiaSanPham().getNgayKetThuc());
            } catch (Exception e) {
                model.addAttribute("giamgia", "2");
            }

        }
        session.removeAttribute("aoDetail");

        HoaDon hoaDon = hoaDonSer.findId(id);

        Users users = usersSer.findByHD(hoaDon.getId());
        model.addAttribute("khachHang", users);


        List<HoaDonChiTiet> listHDCT = hoaDonChiTietSer.findByHoaDon(hoaDon.getId());

        List<HoaDonDTO> listHoaDonChiTiets = new ArrayList<>();
        int tongTien = 0;
        for (HoaDonChiTiet hoaDonChiTiet : listHDCT) {
            Ao ao = hoaDonChiTiet.getAoChiTiet().getAo();
            GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet = giamGiaSanPhamChiTietSer.findByIdAoAndTrangThai(ao.getId());

            HoaDonDTO hoaDonDTO = new HoaDonDTO();

            int gia;
            if (giamGiaSanPhamChiTiet != null) {
                gia = ao.getGiaBan().toBigInteger().intValue() * (100 - giamGiaSanPhamChiTiet.getGiamGiaSanPham().getPhanTramGiam()) / 100;
            } else {
                gia = ao.getGiaBan().toBigInteger().intValue();
            }
            hoaDonDTO.setAoChiTiet(hoaDonChiTiet.getAoChiTiet());
            hoaDonDTO.setGia(gia);
            hoaDonDTO.setHoaDonChiTiet(hoaDonChiTiet);
            listHoaDonChiTiets.add(hoaDonDTO);
            tongTien += hoaDonChiTiet.getSoLuong() * gia;
        }
        model.addAttribute("tongTien", tongTien);
        model.addAttribute("listHoaDonChiTiets", listHoaDonChiTiets);
        model.addAttribute("hoaDon", hoaDon.getId());

        return "/ban_quay/gio_hang";
    }

    @GetMapping("/delete/{id}")
    public String delete(Model model, @PathVariable("id") UUID id) {

        hoaDonSer.delete(id);
        return "redirect:/admin/ban-quay/trang-chu";
    }

    @GetMapping("/delete-san-pham/*/*")
    public String deleteSP(HttpServletRequest request) {

        String url = request.getRequestURI();
        String[] parts = url.split("/admin/ban-quay/delete-san-pham/");
        String pStr = parts[1];
        String[] p = pStr.split("/");

        String idHD = p[0];
        String idHDCT = p[1];

        hoaDonChiTietSer.delete(UUID.fromString(idHDCT));

        return "redirect:/admin/ban-quay/view-cart/" + idHD;
    }

    @PostMapping("/addHD")
    public String addHD(Model model, HttpServletRequest request) {

//        String url = request.getRequestURI();
//        String[] parts = url.split("/admin/ban-quay/addHD/");
//        String ma = parts[1];
//
//        Users users = usersSer.findByMa(ma);
//        model.addAttribute("idKh", users.getMa());

        LocalDateTime now = LocalDateTime.now();

        Object object = request.getSession().getAttribute("userLogged");
        Users user = (Users) object;

        HoaDon hoaDon = new HoaDon();
        hoaDon.setMa("HD" + now.getMonthValue() +now.getDayOfMonth()+ now.getHour()+ now.getMinute()+ now.getSecond());
        hoaDon.setKhachHang(null);
        hoaDon.setNhanVien(user);
        hoaDon.setHinhThuc(1);
        hoaDon.setNgayTao(LocalDateTime.now());
        hoaDon.setTrangThai(5);

        hoaDonSer.add(hoaDon);

        return "redirect:/admin/ban-quay/view-cart/" + hoaDon.getId();
    }

    @PostMapping("/add_gio_hang/{id}")
    public String addGioHang(HttpServletRequest request, @PathVariable("id") UUID id) {


        HoaDon hoaDon = hoaDonSer.findId(id);

        String idAo = request.getParameter("idAo");
        String mauSac = request.getParameter("mauSac");
        String size = request.getParameter("size");
        String sl = request.getParameter("sl");

        AoChiTiet aoChiTiet = aoChiTietSer.findIdByIdAoMsSize(UUID.fromString(idAo), UUID.fromString(mauSac), UUID.fromString(size));

        HoaDonChiTiet checkGHCT = hoaDonChiTietSer.findByHoaDonAndAoChiTiet(hoaDon.getId(), aoChiTiet.getId());
        if (checkGHCT == null) {

            HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();

            hoaDonChiTiet.setHoaDon(hoaDonSer.findId(hoaDon.getId()));
            hoaDonChiTiet.setAoChiTiet(aoChiTiet);
            hoaDonChiTiet.setSoLuong(Integer.parseInt(sl));

            hoaDonChiTietSer.add(hoaDonChiTiet);
        } else {
            HoaDonChiTiet hdct = new HoaDonChiTiet();

            int soLuong = checkGHCT.getSoLuong() + Integer.parseInt(sl);

            hdct.setHoaDon(checkGHCT.getHoaDon());
            hdct.setAoChiTiet(checkGHCT.getAoChiTiet());
            hdct.setSoLuong(soLuong);
            hdct.setDonGia(checkGHCT.getDonGia());
            hdct.setTrangThai(checkGHCT.getTrangThai());

            hoaDonChiTietSer.update(checkGHCT.getId(), hdct);
        }
        return "redirect:/admin/ban-quay/view-cart/" + hoaDon.getId();
    }

    @PostMapping("/update-khach-hang/{id}")
    public String updateKH(HttpServletRequest request, @PathVariable("id") UUID id) {

        String idHoaDon = request.getParameter("idHoaDon");

        Users users = usersSer.findById(id);

        for (HoaDon hoaDon : hoaDonSer.getAll()
        ) {
            if (hoaDon.getId().equals(UUID.fromString(idHoaDon))) {
                hoaDon.setKhachHang(users);
                hoaDonSer.update(UUID.fromString(idHoaDon), hoaDon);
            }
        }
        return "redirect:/admin/ban-quay/view-cart/" + idHoaDon;
    }
    @PostMapping("/delete-khach-hang/{id}")
    public String deleteKH(HttpServletRequest request) {

        String idHoaDon = request.getParameter("idHoaDon");

        for (HoaDon hoaDon : hoaDonSer.getAll()
        ) {
            if (hoaDon.getId().equals(UUID.fromString(idHoaDon))) {
                hoaDon.setKhachHang(null);
                hoaDonSer.update(UUID.fromString(idHoaDon), hoaDon);
            }
        }
        return "redirect:/admin/ban-quay/view-cart/" + idHoaDon;
    }

    @PostMapping("/ao-detail")
    public String detail(HttpServletRequest request, HttpSession session) {
        String idSp = request.getParameter("idSp");
        String idHoaDon = request.getParameter("idHoaDon");
        Ao ao = aoSer.findById(UUID.fromString(idSp));
        session.setAttribute("aoDetail", ao.getMa());


        return "redirect:/admin/ban-quay/view-cart/" + idHoaDon;
    }

    @PostMapping("/thanh-toan/{id}")
    public String thanhToan(Model model, @PathVariable("id") UUID id,
                            @RequestParam("tongTien") BigDecimal tongTien,
                            @RequestParam("ghiChu") String ghiChu,
                            @RequestParam(value = "chon", required = false) List<String> chon,
                            @RequestParam(value = "idAoChiTiet", required = false) List<UUID> idAoChiTiet,
                            @RequestParam(value = "soLuong", required = false) List<String> soLuong) {

        HoaDon hd = hoaDonSer.findId(id);
        HoaDon hoaDon = new HoaDon();

        hoaDon.setMa(hd.getMa());
        hoaDon.setTongTien(tongTien);
        hoaDon.setGhiChu(ghiChu);
        hoaDon.setTrangThai(3);
        hoaDon.setKhachHang(hd.getKhachHang());
        hoaDon.setNgayTao(hd.getNgayTao());
        hoaDon.setNgayHoanThanh(LocalDateTime.now());
        hoaDon.setNgayThanhToan(LocalDateTime.now());
        hoaDon.setNhanVien(hd.getNhanVien());
        hoaDon.setHinhThuc(1);

        int tongDonGia = 0;

        for (String selectedValue : chon) {

            HoaDonChiTiet hdct = hoaDonChiTietSer.findByHoaDonAndAoChiTiet(id,idAoChiTiet.get(Integer.parseInt(selectedValue)));

            AoChiTiet act = aoChiTietSer.findById(idAoChiTiet.get(Integer.parseInt(selectedValue)));
            Ao ao = act.getAo();

            GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet = giamGiaSanPhamChiTietSer.findByIdAoAndTrangThai(ao.getId());

            int gia;

            if (giamGiaSanPhamChiTiet != null) {
                gia = ao.getGiaBan().toBigInteger().intValue() * (100 - giamGiaSanPhamChiTiet.getGiamGiaSanPham().getPhanTramGiam()) / 100;
            } else {
                gia = ao.getGiaBan().toBigInteger().intValue();
            }

            int donGia = gia * Integer.parseInt(soLuong.get(Integer.parseInt(selectedValue)));

            tongDonGia += donGia;

            BigDecimal bigDecimalDonGia = new BigDecimal(donGia);

            HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();

            hoaDonChiTiet.setHoaDon(hoaDonSer.findId(id));
            hoaDonChiTiet.setAoChiTiet(act);
            hoaDonChiTiet.setSoLuong(Integer.parseInt(soLuong.get(Integer.parseInt(selectedValue))));
            hoaDonChiTiet.setDonGia(bigDecimalDonGia);
            hoaDonChiTietSer.update(hdct.getId(), hoaDonChiTiet);

            AoChiTiet aoChiTiet = new AoChiTiet();

            int slTon = act.getSlton() - Integer.parseInt(soLuong.get(Integer.parseInt(selectedValue)));
            int slBan = act.getSlban() + Integer.parseInt(soLuong.get(Integer.parseInt(selectedValue)));

            aoChiTiet.setMau_sac(act.getMau_sac());
            aoChiTiet.setSize(act.getSize());
            aoChiTiet.setAo(act.getAo());
            aoChiTiet.setSlton(slTon);
            aoChiTiet.setSlban(slBan);
            aoChiTiet.setTrangthai(act.getTrangthai());

            aoChiTietSer.update(act.getId(), aoChiTiet);
        }
        BigDecimal bigDecimalTongDonGia = new BigDecimal(tongDonGia);
        hoaDon.setTongTien(bigDecimalTongDonGia);

        hoaDonSer.update(id, hoaDon);

        model.addAttribute("hoaDon", id);

        return "redirect:/admin/ban-quay/trang-chu";
    }

    @PostMapping("/luuHD/{id}")
    public String luuHD(Model model, @PathVariable("id") UUID id,
                        @RequestParam("ghiChu") String ghiChu) {

        HoaDon hoaDon1 = hoaDonSer.findId(id);

        for (HoaDon hoaDon : hoaDonSer.getAll()
        ) {
            if (hoaDon.getId().equals(id)) {

                hoaDon.setGhiChu(ghiChu);

                hoaDonSer.update(id, hoaDon);
            }

        }

        model.addAttribute("hoaDon", hoaDon1.getId());

        return "redirect:/admin/ban-quay/trang-chu";
    }

}
