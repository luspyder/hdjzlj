package cn.slkj.jzlj.interceptor;

import cn.slkj.jzlj.model.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 登录验证session是否存在。页面拦截。
 */
public class LoginFilter implements Filter {
	public String[] allowUrls = { "/login.jsp", "/js/", "/css/", "/images/", "/user/login" };

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) {

		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		HttpSession session = request.getSession();
		// 获得用户请求的URI
		String path = request.getRequestURI();
		String contextPath = request.getContextPath();
		String requestUrl = path.replace(contextPath, "");
		try {
			if (null != allowUrls && allowUrls.length >= 1) {
				for (String uri : allowUrls) {
					if (requestUrl.contains(uri)) {
						filterChain.doFilter(servletRequest, servletResponse);
						return;
					}
				}
			}
			User u = (User) session.getAttribute(SystemConstants.SESSION_USER);
			if (path.endsWith(".jsp")) {
				if (u == null) {
					response.sendRedirect(contextPath + "/login.jsp");
					return;
				} else {
					filterChain.doFilter(servletRequest, servletResponse);
				}
			} else {
				filterChain.doFilter(servletRequest, servletResponse);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}
}