package model;

import org.codehaus.jackson.annotate.JsonProperty;

public class ChuyenBay {
	
	@JsonProperty("MaChuyenBay")
	private int MaChuyenBay;
	
	@JsonProperty("NgayDi")
	private String NgayDi;
	
	@JsonProperty("NgayDen")
	private String NgayDen;
	
	@JsonProperty("GioDi")
	private String GioDi;
	
	@JsonProperty("GioDen")
	private String GioDen;
	
	@JsonProperty("MaSanBayDi")
	private int MaSanBayDi;
	
	@JsonProperty("MaSanBayDen")
	private int MaSanBayDen;
	
	@JsonProperty("TenSanBayDi")
	private String TenSanBayDi;
	
	@JsonProperty("TenSanBayDen")
	private String TenSanBayDen;
	
	@JsonProperty("MaMayBay")
	private int MaMayBay;
	
	
	public int getMaChuyenBay() {
		return MaChuyenBay;
	}
	public void setMaChuyenBay(int maChuyenBay) {
		MaChuyenBay = maChuyenBay;
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
	public void setTenSanBayDi(String tenSanBayDi) {
		TenSanBayDi = tenSanBayDi;
	}
	public String getTenSanBayDen() {
		return TenSanBayDen;
	}
	public void setTenSanBayDen(String tenSanBayDen) {
		TenSanBayDen = tenSanBayDen;
	}
	public int getMaMayBay() {
		return MaMayBay;
	}
	public void setMaMayBay(int maMayBay) {
		MaMayBay = maMayBay;
	}
	public ChuyenBay(int maChuyenBay, String ngayDi, String ngayDen, String gioDi, String gioDen, int maSanBayDi,
			int maSanBayDen, String tenSanBayDi, String tenSanBayDen, int maMayBay) {
		super();
		MaChuyenBay = maChuyenBay;
		NgayDi = ngayDi;
		NgayDen = ngayDen;
		GioDi = gioDi;
		GioDen = gioDen;
		MaSanBayDi = maSanBayDi;
		MaSanBayDen = maSanBayDen;
		TenSanBayDi = tenSanBayDi;
		TenSanBayDen = tenSanBayDen;
		MaMayBay = maMayBay;
	}
	
	public ChuyenBay() {
		super();
	}
	
	
	
}
