package www.deadlock.model.cbbs;

import org.springframework.web.multipart.MultipartFile;

public class CbbsDTO {
	
	private int cnum;
	private String title;
	private String content;
	private String cdate;
	private String fname;
	private int ccount;
	private String id;
	private int filesize;
	private MultipartFile filenameMF;
	private String urllink;
	
	
	
	
	
	public String getUrllink() {
		return urllink;
	}
	public void setUrllink(String urllink) {
		this.urllink = urllink;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public MultipartFile getFilenameMF() {
		return filenameMF;
	}
	public void setFilenameMF(MultipartFile filenameMF) {
		this.filenameMF = filenameMF;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public int getCcount() {
		return ccount;
	}
	public void setCcount(int ccount) {
		this.ccount = ccount;
	}
	
}
