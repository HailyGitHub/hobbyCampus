package com.hobbycam.page;

public class PageModule {

	public static String pageMake(String pageName, int totalCnt, int listSize, int pageSize, int cp) {

		// Total Page
		int totalPage = (totalCnt/listSize) + 1;
		if(totalCnt%listSize==0) totalPage--;

		// ���� �������׷� (������ 0����)
		int pageGroup = cp/pageSize;
		if(cp%pageSize==0) pageGroup--;

		// �� ������ �׷�
		int totalPageGroup = totalPage/pageSize;
		if(totalPage%pageSize==0) totalPageGroup--;
		
		// �� �������׷��� ����, �� index
		int startIdx = pageSize * pageGroup + 1 ;
		int endIdx = pageSize * pageGroup + pageSize;

		int beforeIdx = (pageGroup-1) * pageSize + pageSize; //���� ������ index
		int nextIdx = (pageGroup+1) * pageSize + 1; //���� ������ index
		
		StringBuffer sb = new StringBuffer();
		
		/*Previous*/
		if(pageGroup!=0){
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='");
			sb.append(pageName);
			sb.append("?cp="+beforeIdx);
			sb.append("' aria-label='Previous'>");
			sb.append("<span aria-hidden='true'>&laquo;</span>");
			sb.append("</a></li>");
			
			//sb.append("<a href='");
			//sb.append(pageName);
			//sb.append("?cp=");
			//sb.append(beforeIdx);
			//sb.append("'>&lt;&lt;</a>");	
		}

		/*Page List*/
		for(int i=startIdx; i<=endIdx; i++){
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='");
			sb.append(pageName);
			sb.append("?cp=");
			sb.append(i);
			sb.append("'>");
			sb.append(i);
			sb.append("</a></li>");
			
			if(i==totalPage) break;
		}

		/*Next*/
		if(pageGroup!=totalPageGroup){
			
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='");
			sb.append(pageName);
			sb.append("?cp="+nextIdx);
			sb.append("' aria-label='Next'>");
			sb.append("<span aria-hidden='true'>&raquo;</span>");
			sb.append("</a></li>");
			
			//sb.append("<a href='");
			//sb.append(pageName);
			//sb.append("?cp=");
			//sb.append(nextIdx);
			//sb.append("'>&gt;&gt;</a>");
		}

		return sb.toString();
		
	}
	
}
