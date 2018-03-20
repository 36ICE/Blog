package cn.jxufe.interceptor;

import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.i18n.AcceptHeaderLocaleResolver;
//可参考AcceptHeaderLocaleResolver的源码，其中setLocal只包含了一个异常处理
public class MyAcceptHeaderLocaleResolver extends AcceptHeaderLocaleResolver {

    private Locale myLocal;

    public Locale resolveLocale(HttpServletRequest request) {
        return myLocal;
    } 

    public void setLocale(HttpServletRequest request, HttpServletResponse response, Locale locale) {
        myLocal = locale;
    }
  
}
