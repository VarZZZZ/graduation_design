package utils;

public class Page {
	private int start=0;
	private int count = 5;
	private int last = 0;
	private Boolean isNull=false;
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
	public Boolean getIsNull() {
		return isNull;
	}
	public void setIsNull(Boolean isNull) {
		this.isNull = isNull;
	}
	public void caculateLast(int total) {
		if(total!=0) {
			if (0 == total % count) {
				last = total - count;
			}else {
				last = total - total % count;	
			}
		}
	}
	public int getPageCount(int total) {
		int pageCount=0;
		if(total!=0) {
			if (0 == total % count) {
				pageCount= total / count;
			}else {
				pageCount= total / count+1;	
			}
		}
		return pageCount;
	}
	public int getCurrentPage(int pageStart,Boolean isNull) {
		int currentPage=0;
		if(pageStart!=0) {
			currentPage= pageStart / count+1;
		}else {
			if(isNull==true) {
				currentPage=0;
			}else {
				currentPage=1;
			}
		}
		return currentPage;
	}
}
