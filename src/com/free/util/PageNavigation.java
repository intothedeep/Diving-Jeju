package com.free.util;

public class PageNavigation {

	private String root;
	private boolean nowFirst;// 이전관리
	private boolean nowEnd;// 다음관리
	private int newArticleCount;// 새글수
	private int totalArticleCount;// 전체글수
	private int totalPageCount;// 전체페이지수
	private int pageNo;// 현재페이지
	private String navigator;// 페이징

	public String getRoot() {
		return root;
	}

	public void setRoot(String root) {
		this.root = root;
	}

	public boolean isNowFirst() {
		return nowFirst;
	}

	public void setNowFirst(boolean nowFirst) {
		this.nowFirst = nowFirst;
	}

	public boolean isNowEnd() {
		return nowEnd;
	}

	public void setNowEnd(boolean nowEnd) {
		this.nowEnd = nowEnd;
	}

	public int getNewArticleCount() {
		return newArticleCount;
	}

	public void setNewArticleCount(int newArticleCount) {
		this.newArticleCount = newArticleCount;
	}

	public int getTotalArticleCount() {
		return totalArticleCount;
	}

	public void setTotalArticleCount(int totalArticleCount) {
		this.totalArticleCount = totalArticleCount;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public String getNavigator() {
		return navigator;
	}

	public void setNavigator() {
		StringBuffer tmpNavigator = new StringBuffer();

		int prePage = (pageNo - 1) / Constant.PAGE_SIZE * Constant.PAGE_SIZE;
		
		if (this.isNowFirst()) {
			tmpNavigator.append("\t\t\t\t\t\t\t\t\t\t\t\t<li>\n");  
			tmpNavigator.append("	\t\t\t\t\t\t\t\t\t\t\t\t<a href='#' class='recent'>&laquo;</a>\n");
			tmpNavigator.append("\t\t\t\t\t\t\t\t\t\t\t\t</li>\n");
			tmpNavigator.append("\t\t\t\t\t\t\t\t\t\t\t\t<li>\n");			
			tmpNavigator.append("  \t\t\t\t\t\t\t\t\t\t\t\t\t<a>Prev</a>\n");
		} else {
			tmpNavigator.append("\t\t\t\t\t\t\t\t\t\t\t\t<li>\n");  
			tmpNavigator.append("  \t\t\t\t\t\t\t\t\t\t\t\t\t<a href='#' class='recent'>&laquo;</a>\n");
			tmpNavigator.append("\t\t\t\t\t\t\t\t\t\t\t\t</li>\n");
			tmpNavigator.append("\t\t\t\t\t\t\t\t\t\t\t\t<li>\n");			
			tmpNavigator.append("  \t\t\t\t\t\t\t\t\t\t\t\t\t<a href='#' data-page='" +prePage + "' class='list'>Prev</a>\n");
		}
		tmpNavigator.append("\t\t\t\t\t\t\t\t\t\t\t\t</li>\n");
	
		int startPage = prePage + 1;
		int endPage = startPage + (Constant.PAGE_SIZE - 1);
		if(endPage > totalPageCount)
			endPage = totalPageCount;
		
		for (int i = startPage; i <= endPage; i++) {
			if (pageNo == i) {
				tmpNavigator.append("\t\t\t\t\t\t\t\t\t\t\t\t<li>\n");  
				tmpNavigator.append("  \t\t\t\t\t\t\t\t\t\t\t\t\t<a>" + i + "</a>\n");
			} else {
				tmpNavigator.append("\t\t\t\t\t\t\t\t\t\t\t\t<li>\n");  
				tmpNavigator.append("  \t\t\t\t\t\t\t\t\t\t\t\t\t<a href='#' data-page='" + i + "' class='list'>" + i + "</a>\n");
			}
			tmpNavigator.append("\t\t\t\t\t\t\t\t\t\t\t\t</li>\n");
		}
		
		if (this.isNowEnd()) {
			tmpNavigator.append("\t\t\t\t\t\t\t\t\t\t\t\t<li>\n");  
			tmpNavigator.append("  \t\t\t\t\t\t\t\t\t\t\t\t\t<a>Next</a>\n");
			tmpNavigator.append("\t\t\t\t\t\t\t\t\t\t\t\t</li>\n");
			tmpNavigator.append("\t\t\t\t\t\t\t\t\t\t\t\t<li>\n");			
			tmpNavigator.append("  \t\t\t\t\t\t\t\t\t\t\t\t\t<a>&raquo;</a>\n");
		} else {
			int nextPage = prePage + Constant.PAGE_SIZE + 1;
			tmpNavigator.append("\t\t\t\t\t\t\t\t\t\t\t\t<li>\n");  
			tmpNavigator.append("  \t\t\t\t\t\t\t\t\t\t\t\t\t<a href='#' data-page='" + nextPage + "' class='list'>Next</a>\n");
			tmpNavigator.append("\t\t\t\t\t\t\t\t\t\t\t\t</li>\n");
			tmpNavigator.append("\t\t\t\t\t\t\t\t\t\t\t\t<li>\n");			
			tmpNavigator.append("  \t\t\t\t\t\t\t\t\t\t\t\t\t<a href='#' data-page='" + totalPageCount + "' class='list'>&raquo;</a>\n");
		}
		tmpNavigator.append("\t\t\t\t\t\t\t\t\t\t\t\t</li>\n");

		this.navigator = tmpNavigator.toString();
//		System.out.println(this.navigator);
	}
}
