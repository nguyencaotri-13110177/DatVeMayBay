package model;


import org.codehaus.jackson.annotate.JsonProperty;

public class KetQuaTimVe {
	
	@JsonProperty("MaMayBay")
	private int MaMayBay;
	
	@JsonProperty("MaChuyenBay")
	private int MaChuyenBay;
	
	@JsonProperty("MaGhe")
	private String MaGhe;
	
	@JsonProperty("MaSanBayDi")
	private int MaSanBayDi;
	
	@JsonProperty("MaSanBayDen")
	private int MaSanBayDen;
	
	@JsonProperty("TenSanBayDi")
	private String TenSanBayDi;
	
	@JsonProperty("TenSanBayDen")
	private String TenSanBayDen;
	
	@JsonProperty("NgayDi")
	private String NgayDi;
	
	@JsonProperty("NgayDen")
	private String NgayDen;
	
	@JsonProperty("GioDi")
	private String GioDi;
	
	@JsonProperty("GioDen")
	private String GioDen;
	
	@JsonProperty("Gia")
	private double Gia;

	public int getMaMayBay() {
		return MaMayBay;
	}

	public void setMaMayBay(int maMayBay) {
		MaMayBay = maMayBay;
	}

	public int getMaChuyenBay() {
		return MaChuyenBay;
	}

	public void setMaChuyenBay(int maChuyenBay) {
		MaChuyenBay = maChuyenBay;
	}

	public String getMaGhe() {
		return MaGhe;
	}

	public void setMaGhe(String maGhe) {
		MaGhe = maGhe;
	}

	public int getMaSanBayDi() {
		return MaSanBayDi;
	}

	public void setMaSanBayDi(int maSanBayDi) {
		MaSanBayDi = maSanBayDi;
	}

	public int getMaSanBayDen() {
		return MaSanBayDen;
	}

	public void setMaSanBayDen(int maSanBayDen) {
		MaSanBayDen = maSanBayDen;
	}

	public String getTenSanBayDi() {
		return TenSanBayDi;
	}

	public void setTenSanbayDi(String tenSanBayDi) {
		TenSanBayDi = tenSanBayDi;
	}

	public String getTenSanBayDen() {
		return TenSanBayDen;
	}

	public void setTenSanBayDen(String tenSanBayDen) {
		TenSanBayDen = tenSanBayDen;
	}

	public String getNgayDi() {
		return NgayDi;
	}

	public void setNgayDi(String ngayDi) {
		NgayDi = ngayDi;
	}

	public String getNgayDen() {
		return NgayDen;
	}

	public void setNgayDen(String ngayDen) {
		NgayDen = ngayDen;
	}

	public String getGioDi() {
		return GioDi;
	}

	public void setGioDi(String gioDi) {
		GioDi = gioDi;
	}

	public String getGioDen() {
		return GioDen;
	}

	public void setGioDen(String gioDen) {
		GioDen = gioDen;
	}

	public double getGia() {
		return Gia;
	}

	public void setGia(double gia) {
		Gia = gia;
	}

	public KetQuaTimVe(int maMayBay, int maChuyenBay, String maGhe, int maSanBayDi, int maSanBayDen, String tenSanBayDi,
			String tenSanBayDen, String ngayDi, String ngayDen, String gioDi, String gioDen, double gia) {
		super();
		MaMayBay = maMayBay;
		MaChuyenBay = maChuyenBay;
		MaGhe = maGhe;
		MaSanBayDi = maSanBayDi;
		MaSanBayDen = maSanBayDen;
		TenSanBayDi = tenSanBayDi;
		TenSanBayDen = tenSanBayDen;
		NgayDi = ngayDi;
		NgayDen = ngayDen;
		GioDi = gioDi;
		GioDen = gioDen;
		Gia = gia;
	}
	
	public KetQuaTimVe() {
		super();
	}
	
}
