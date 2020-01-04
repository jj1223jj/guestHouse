<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<title>jQuery UI Datepicker - Select a Date Range</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  $( function() {
    var dateFormat = "yy-mm-dd",
      from = $( "#from" )
        .datepicker({
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 1
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#to" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 1
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });
 
    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( 'yy-mm-dd', element.value );
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
  
    
    
    
    
  } );
  function aaa(root) {
	  var from = $('#from').val();
	  var to = $('#to').val();
	  alert(from+"," +to);
	  if (from.val() == null || to.val() == null) {
		  alert("날짜를 정확히 선택해주세요.");
		  return false;
	  } else {
		  location.href=
	  }
	  
  }
  </script>
</head>
<body>
	<form onsubmit="return aaa('${root}')">
		<label for="from"></label>
		<input type="text" id="from" name="from">
		<label for="to">~</label>
		<input type="text" id="to" name="to">
	 	<input type="submit" value="조회"/>
 	</form>
</body>
</html>