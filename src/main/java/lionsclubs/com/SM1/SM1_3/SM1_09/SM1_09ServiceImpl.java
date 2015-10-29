package lionsclubs.com.SM1.SM1_3.SM1_09;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lionsclubs.com.login.LoginVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.Caching;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service
public class SM1_09ServiceImpl extends AbstractServiceImpl implements SM1_09Service{

	@Autowired private SM1_09DAO dao;

	@Override
	public List<SM1_09VO> selectList(SM1_09VO vo) throws Exception {
		return dao.selectList(vo);
	}

    @Caching(evict = { @CacheEvict(value = "menu", allEntries=true),
            		   @CacheEvict(value = "menuTitle", allEntries=true) })
	@Override
	public void insert(SM1_09VO vo) throws Exception {
		dao.insert(vo);
	}

    @Caching(evict = { @CacheEvict(value = "menu", allEntries=true),
 		   			   @CacheEvict(value = "menuTitle", allEntries=true) })
	@Override
	public Integer update(SM1_09VO vo) throws Exception {
		return dao.update(vo);
	}

    @Caching(evict = { @CacheEvict(value = "menu", allEntries=true),
 		   			   @CacheEvict(value = "menuTitle", allEntries=true) })
	@Override
	public Integer delete(SM1_09VO vo) throws Exception {
		return dao.delete(vo);
	}
	
	@Cacheable(value="menu", key="{#root.methodName, T(egovframework.com.cmm.util.EgovUserDetailsHelper).getAuthenticatedUser()}")
	@Override
	public List<SM1_09VO> headerMenuList() throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		return dao.headerMenuList(user.getId());
	}
	
	@Cacheable(value="menu", key="{#root.methodName, T(egovframework.com.cmm.util.EgovUserDetailsHelper).getAuthenticatedUser()}")
	@Override
	public List<SM1_09VO> leftMenuList() throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		
		return dao.leftMenuList(user.getId());
	}
	
	@Cacheable(value="menuTitle", key="{#menuId}")
	@Override
	public SM1_09VO menuTitle(String menuId) throws Exception {
		return dao.menuTitle(menuId);
	}
	
	@Cacheable(value="menuAuthenticated", key="{#menuId, T(egovframework.com.cmm.util.EgovUserDetailsHelper).getAuthenticatedUser()}")
	@Override
	public SM1_09VO menuAuthorization(String menuId) throws Exception {
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", user.getId());
		map.put("menuId", menuId);
		
		return dao.menuAuthorization(map);
	}
}
