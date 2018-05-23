package www.deadlock.model.nbbs;

import org.springframework.web.multipart.MultipartFile;

public class NBbsDTO {
	private int nnum;
	private String title;
	private String content;
	private String ndate;
	private int ncount;
	private String noname;
	private String corname;
	private String cordate;
	private String category;
	private String fname;
	private String fsize;
	private MultipartFile fnameMF;

	
	
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getFsize() {
		return fsize;
	}
	public void setFsize(String fsize) {
		this.fsize = fsize;
	}
	public MultipartFile getFnameMF() {
		return fnameMF;
	}
	public void setFnameMF(MultipartFile fnameMF) {
		this.fnameMF = fnameMF;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getNnum() {
		return nnum;
	}
	public void setNnum(int nnum) {
		this.nnum = nnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getNdate() {
		return ndate;
	}
	public void setNdate(String ndate) {
		this.ndate = ndate;
	}
	public int getNcount() {
		return ncount;
	}
	public void setNcount(int ncount) {
		this.ncount = ncount;
	}
	public String getNoname() {
		return noname;
	}
	public void setNoname(String noname) {
		this.noname = noname;
	}
	public String getCorname() {
		return corname;
	}
	public void setCorname(String corname) {
		this.corname = corname;
	}
	public String getCordate() {
		return cordate;
	}
	public void setCordate(String cordate) {
		this.cordate = cordate;
	}
	
	

}
