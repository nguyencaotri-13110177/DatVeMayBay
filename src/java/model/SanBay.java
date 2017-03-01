package model;


import org.codehaus.jackson.annotate.JsonProperty;


//@JsonIgnoreProperties(ignoreUnknown = true)
public class SanBay {
	
	
	

	@JsonProperty("MaQuocGia")
	private int MaQuocGia;
	
	@JsonProperty("MaSanBay")
	private int MaSanBay;
	
	@JsonProperty("TenSanBay")
	private String TenSanBay;
	
	@JsonProperty("TenThanhPho")
	private String TenThanhPho;
	
	
	public int getMaQuocGia() {
		return MaQuocGia;
	}
	public void setMaQuocGia(int maQuocGia) {
		MaQuocGia = maQuocGia;
	}
	
	
	public int getMaSanBay() {
		return MaSanBay;
	}
	public void setMaSanBay(int maSanBay) {
		MaSanBay = maSanBay;
	}
	public String getTenSanBay() {
		return TenSanBay;
	}
	public void setTenSanBay(String tenSanBay) {
		TenSanBay = tenSanBay;
	}
	public String getTenThanhPho() {
		return TenThanhPho;
	}
	public void setTenThanhPho(String tenThanhPho) {
		TenThanhPho = tenThanhPho;
	}
	
	public SanBay(int maSanBay, String tenSanBay, String tenThanhPho, int maQuocGia) {
		super();
		MaQuocGia = maQuocGia;
		MaSanBay = maSanBay;
		TenSanBay = tenSanBay;
		TenThanhPho = tenThanhPho;	
	}
	
	public SanBay() {
		super();
	}
	
	

}
