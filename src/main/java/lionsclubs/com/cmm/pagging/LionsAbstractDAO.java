package lionsclubs.com.cmm.pagging;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientCallback;

import com.ibatis.sqlmap.client.SqlMapExecutor;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

public class LionsAbstractDAO extends EgovAbstractDAO{

    @SuppressWarnings("rawtypes")
	public Page listWithPaging(String queryId, Object parameterObject) throws Exception {
    	ComDefaultVO param = (ComDefaultVO)parameterObject;
    	
    	int pageIndex = param.getPageIndex();
    	int recordCountPerPage = param.getRecordCountPerPage();
    	int pageSize = param.getPageSize();
    	int totalRecordCount = param.getTotalRecordCount();
    	
    	Class clz = parameterObject.getClass(); //getClass로 그 객체의 class알아올 수 있다!
 	   
    	Field[] fields = clz.getDeclaredFields(); //그 안의 필드를 알아올 수 있다.
    	for(int i = 0; i < fields.length; i++){
    	}    	
    	
    	Method[] getMethods = clz.getMethods();
    	for(int i = 0; i < getMethods.length; i++){
    		//get메서드만 가져오기~
    		if(getMethods[i].getName().startsWith("get")){
    			if(getMethods[i].getName().equals("getPageIndex")){
    				pageIndex = (Integer)getMethods[i].invoke(parameterObject, null);
    			}
    			
    			if(getMethods[i].getName().equals("recordCountPerPage")){
    				recordCountPerPage = (Integer) getMethods[i].invoke(parameterObject, null);
    			}
    			
    			if(getMethods[i].getName().equals("getPageSize")){
    				pageSize = (Integer) getMethods[i].invoke(parameterObject, null);
    			}
    		}
    	}
    	
    	/** pageing */
    	PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(pageIndex);
		paginationInfo.setRecordCountPerPage(recordCountPerPage);
		paginationInfo.setPageSize(pageSize);	
		
    	Method[] setMethods = clz.getMethods();
    	for(int i = 0; i < setMethods.length; i++){
    		//get메서드만 가져오기~
    		if(setMethods[i].getName().startsWith("set")){
    			if(setMethods[i].getName().equals("setFirstIndex")){
    				setMethods[i].invoke(parameterObject, paginationInfo.getFirstRecordIndex());
    			}
    			
    			if(setMethods[i].getName().equals("setLastIndex")){
    				setMethods[i].invoke(parameterObject, paginationInfo.getLastRecordIndex());
    			}
    			
    			if(setMethods[i].getName().equals("setRecordCountPerPage")){
    				setMethods[i].invoke(parameterObject, paginationInfo.getRecordCountPerPage());
    			}
    		}
    	}		    	
    	
    	ArrayList resultList = (ArrayList) getSqlMapClientTemplate().queryForList(queryId, parameterObject);
    	for(Object obj : resultList){
    		Class c = obj.getClass();
    		
        	Method[] mothods = c.getMethods();
        	
        	for(int i = 0; i < mothods.length; i++){
        		if(mothods[i].getName().startsWith("getTotalRecordCount")){
        			totalRecordCount = (Integer)mothods[i].invoke(obj, null);
        		}
        	}
    	}
    	
    	paginationInfo.setTotalRecordCount(totalRecordCount);
    	
    	Page resultPage = new Page(resultList, paginationInfo);

    	return resultPage;
    }
    
    /**
     * 배치Insert를 실행한다.
     * @param queryId
     *        <code>String</code>
     * @param list
     *        <code>List&lt;Object&gt;</code>
     * @return
     */
    @SuppressWarnings({ "unchecked", "rawtypes" })
	public Integer batchInsert(final String queryId, final Object object) {
        return (Integer) getSqlMapClientTemplate().execute(
            new SqlMapClientCallback() {
            	
            	List<Object> list = (List<Object>) object;
            	
                public Object doInSqlMapClient(SqlMapExecutor executor)
                        throws SQLException {

                    executor.startBatch();

                    for (Iterator<Object> itr = list.iterator(); itr.hasNext();) {
                        executor.insert(queryId, itr.next());
                    }

                    return executor.executeBatch();
                }
            });
    }
}
