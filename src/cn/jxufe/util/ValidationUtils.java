package cn.jxufe.util;

import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
/**
 * 功能描述：
 * 基于JSR303验证
 * <br>代码作者：<b>ZhangPeng</b>
 * <br>创建日期：<b>2009-10-30</b>
 * <br>创建时间：<b>上午11:23:28</b>
 * <br>文件结构：<b>spring:com.wisdom.example.commons/ValidationUtils.java</b>
 */
public class ValidationUtils{
	/**
	 * 验证符合JSR303规范的数据实体
	 * @param bean实体
	 * @return 错误字符集合
	 */
	public static java.util.List<String> validator(Object bean){
		ValidatorFactory validatorFactory =Validation.buildDefaultValidatorFactory();
		Validator validator = validatorFactory.getValidator();  
		Set<ConstraintViolation<Object>> violations = validator.validate(bean);
		List<String> errors=new LinkedList<String>();
		for (ConstraintViolation<Object> violation : violations) {    
			String message = violation.getMessage(); 
			errors.add(message);
		}
		if(errors.isEmpty()){
			return null;
		}
		return errors;
	}
}
