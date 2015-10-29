package lionsclubs.com.cmm.pagging;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.Collection;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

public class Page extends PaginationInfo implements Serializable {

//    public static final Page EMPTY_PAGE = new Page(Collections.EMPTY_LIST, 0, 0);

    /**
     * 해당 Object의 목록
     */
    private Collection resultList;
    private PaginationInfo paginationInfo;
    private int totalCount;
    
	public Collection getResultList() {
		return resultList;
	}

	public void setResultList(Collection resultList) {
		this.resultList = resultList;
	}

	public PaginationInfo getPaginationInfo() {
		return paginationInfo;
	}

	public void setPaginationInfo(PaginationInfo paginationInfo) {
		this.paginationInfo = paginationInfo;
	}
	
	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	/**
     * Page Class의 Constructor ( pageunit & pagesize : 10 (default) )
     * 
     * @param objects
     *            Collection
     * @param currentPage
     * @param totalCount
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 * @throws IllegalArgumentException 
     */
    public Page(Collection resultList, PaginationInfo paginationInfo) throws Exception {
    	this.resultList = resultList;
		this.paginationInfo = paginationInfo;
		this.totalCount = paginationInfo.getTotalRecordCount();
    }
}