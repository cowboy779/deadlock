<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<script type="text/javascript">

	alert('인증코드가 발송되었습니다. \n메일을 확인해주세요');
	location.href='email_proc';
	self.close();

// 	alert('메일 발송에 실패하였습니다.');history.back();
// 	return;

</script>


