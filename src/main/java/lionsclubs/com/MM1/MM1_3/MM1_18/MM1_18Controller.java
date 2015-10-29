package lionsclubs.com.MM1.MM1_3.MM1_18;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

@Controller
public class MM1_18Controller {
	@Resource private MM1_18Service service;
	@Resource MappingJacksonJsonView ajaxMainView;
	
	
}
