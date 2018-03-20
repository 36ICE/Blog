package cn.jxufe.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.jxufe.common.Progress;

@Controller
public class ProgressController {
	@RequestMapping(value = "/upfile/progress", method = RequestMethod.POST)
	@ResponseBody
	public String initCreateInfo(HttpServletRequest request) {
		Progress status = (Progress) request.getSession().getAttribute("status");
		if (status == null) {
			return "{}";
		}
		return status.toString();
	}
}
