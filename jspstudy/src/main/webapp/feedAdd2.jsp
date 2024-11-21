<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="util.FileUtil" %>
<%@ page import="dao.FeedDAO" %>
<%
    request.setCharacterEncoding("utf-8");

    // 세션에서 현재 로그인된 사용자 아이디 가져오기
    String sessionId = (String) session.getAttribute("id");
    if (sessionId == null) {
        out.print("<script>alert('로그인이 필요합니다.'); location.href='loginForm.jsp';</script>");
        return;
    }

    String uid = null, ucon = null, ufname = null;
    byte[] ufile = null;

    // 파일 업로드 처리
    ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
    List items = sfu.parseRequest(request);

    Iterator iter = items.iterator();
    while (iter.hasNext()) {
        FileItem item = (FileItem) iter.next();
        String name = item.getFieldName();
        if (item.isFormField()) {
            String value = new String((item.getString()).getBytes("8859_1"), "utf-8");
            if (name.equals("id")) uid = value;
            else if (name.equals("content")) ucon = value;

        } else {
            if (name.equals("image")) {
                ufname = item.getName();
                ufile = item.get();
                String root = application.getRealPath(java.io.File.separator);
                FileUtil.saveImage(root, ufname, ufile);
            }
        }
    }

    // 아이디 검증
    if (uid == null || !uid.equals(sessionId)) {
        out.print("<script>alert('아이디가 일치하지 않습니다. 다시 시도하세요.'); history.back();</script>");
        return;
    }

    // 데이터베이스에 글 저장
    FeedDAO dao = new FeedDAO();
    if (dao.insert(uid, ucon, ufname)) {
        response.sendRedirect("main.jsp");
    } else {
        out.print("작성 글의 업로드 중 오류가 발생하였습니다.");
    }
%>
