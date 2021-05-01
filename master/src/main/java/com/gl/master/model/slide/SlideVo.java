package com.gl.master.model.slide;

import org.springframework.web.multipart.MultipartFile;

public class SlideVo {
	private String mainid;
	private String title;
	private String img;
	private MultipartFile sdimgFile;
	
	public SlideVo() {
		// TODO Auto-generated constructor stub
	}
	
	
	public String getMainid() {
		return mainid;
	}
	public void setMainid(String mainid) {
		this.mainid = mainid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public MultipartFile getSdimgFile() {
		return sdimgFile;
	}
	public void setSdimgFile(MultipartFile sdimgFile) {
		this.sdimgFile = sdimgFile;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((mainid == null) ? 0 : mainid.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		SlideVo other = (SlideVo) obj;
		if (mainid == null) {
			if (other.mainid != null)
				return false;
		} else if (!mainid.equals(other.mainid))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "SlideVo [mainid=" + mainid + ", title=" + title + ", img="
				+ img + ", sdimgFile=" + sdimgFile + "]";
	}
	public SlideVo(String mainid, String title, String img,
			MultipartFile sdimgFile) {
		super();
		this.mainid = mainid;
		this.title = title;
		this.img = img;
		this.sdimgFile = sdimgFile;
	}
	
	
	
}
	
 
