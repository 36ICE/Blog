package cn.jxufe.core.web;

import java.text.DateFormat;
import java.util.Collection;
import java.util.Date;

import org.springframework.beans.propertyeditors.CustomBooleanEditor;
import org.springframework.beans.propertyeditors.CustomCollectionEditor;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.support.WebBindingInitializer;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

import cn.jxufe.core.utils.FormatConstants;
import cn.jxufe.core.web.editors.CustomStringEditor;

/**
 * 功能描述(Description):<br><b>
 * Spring MVC WebBindingInitializer绑定属性类型
 * </b><br>作 者(Author): <i><b>张鹏(Zhang.Peng)</b></i>
 * <br>建立日期(Create Date): <b>2010-7-7下午02:47:14</b>
 * <br>项目名称(Project Name): <b>wisdom-core.3.0</b>
 * <br>包及类名(Package Class): <b>com.wisdom.core.web.DefaultBindingInitializer.java</b>
 */
public class DefaultBindingInitializer implements WebBindingInitializer{

	@Override
	public void initBinder(WebDataBinder binder, WebRequest request) {
		DateFormat dateFormat = FormatConstants.DATE_TIME_FORMAT;
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
		binder.registerCustomEditor(Integer.class,new CustomNumberEditor(Integer.class,true));
		binder.registerCustomEditor(Long.class,new CustomNumberEditor(Long.class,true));
		binder.registerCustomEditor(String.class,new CustomStringEditor(String.class));
		binder.registerCustomEditor(Collection.class, new CustomCollectionEditor(Collection.class, true));
		binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
		binder.registerCustomEditor(Boolean.class, new CustomBooleanEditor(true));
	}
	
}
