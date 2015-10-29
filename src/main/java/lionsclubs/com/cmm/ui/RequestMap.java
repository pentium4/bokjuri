package lionsclubs.com.cmm.ui;

import java.util.Collection;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

public class RequestMap
  implements Map<String, Object>
{
  private HttpServletRequest request;
  
  public RequestMap(HttpServletRequest request)
  {
    this.request = request;
  }
  
  public void clear() {}
  
  public boolean containsKey(Object key)
  {
    return this.request.getParameter((String)key) != null;
  }
  
  public boolean containsValue(Object value)
  {
    throw new UnsupportedOperationException();
  }
  
  public Set<Map.Entry<String, Object>> entrySet()
  {
    throw new UnsupportedOperationException();
  }
  
  public Object get(Object key)
  {
    return this.request.getParameter((String)key);
  }
  
  public boolean isEmpty()
  {
    return false;
  }
  
  public Set<String> keySet()
  {
    throw new UnsupportedOperationException();
  }
  
  public Object put(String key, Object value)
  {
    throw new UnsupportedOperationException();
  }
  
  public void putAll(Map<? extends String, ? extends Object> t)
  {
    throw new UnsupportedOperationException();
  }
  
  public Object remove(Object key)
  {
    throw new UnsupportedOperationException();
  }
  
  public int size()
  {
    throw new UnsupportedOperationException();
  }
  
  public Collection<Object> values()
  {
    throw new UnsupportedOperationException();
  }
}
