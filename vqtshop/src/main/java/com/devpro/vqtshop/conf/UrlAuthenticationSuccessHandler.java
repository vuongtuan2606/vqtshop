package com.devpro.vqtshop.conf;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

/**
 * Class này sẽ kiểm tra Role của User Logined. Nếu guest thì về trang người dùng
 * ngược lại nếu là Admin thì vào trang Admin
 * @author daing
 *
 */
public class UrlAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		handle(request, response, authentication); // lấy targetUrl -> admin nhảy vào trang nào người dùng nhảy vào trang nào
		clearAuthenticationAttributes(request);
	}

	protected void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException {
		String targetUrl = determineTargetUrl(authentication);
		if (response.isCommitted()) { // isCommitted() trả về rồi thì return
			return;
		}
		redirectStrategy.sendRedirect(request, response, targetUrl); // chuyển hướng người tới url tương ứng
	}

	/**
	 * Lấy Role của user và trả về Url tương ứng
	 * @param authentication
	 * @return
	 */
	protected String determineTargetUrl(final Authentication authentication) {
		Map<String, String> roleTargetUrlMap = new HashMap<>();
		roleTargetUrlMap.put("ADMIN", "/admin/home");
		roleTargetUrlMap.put("USER", "/home");

		final Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities(); // list này authorities là tên của role
		for (final GrantedAuthority grantedAuthority : authorities) {
			String authorityName = grantedAuthority.getAuthority();
			if (roleTargetUrlMap.containsKey(authorityName)) {
				return roleTargetUrlMap.get(authorityName);
			}
		}
		throw new IllegalStateException();
	}

	protected void clearAuthenticationAttributes(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return;
		}
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}
}
