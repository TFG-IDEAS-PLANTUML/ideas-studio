<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
    
    <script>
	$(function(){$("#versions").hide();});          
    </script>

<div class="container">

	<h2>Edit Workspace</h2>
	<br/>
        
	<spring:url value="app/wsm/workspaces" var="wsActionUrl" />
        
	<form:form class="form-horizontal" method="post" 
                modelAttribute="wsForm" action="${wsActionUrl}">

		<form:hidden path="id" />
                <div class="control-group">
		<spring:bind path="name">
		  <div class="input-group ${status.error ? 'has-error' : ''}">
			<span class="input-group-addon">Name</span>
			
				<form:input path="name" type="text" class="form-control" 
                                id="name" placeholder="Name" />
				<form:errors path="name" class="control-label" />
			
		  </div>
		</spring:bind>
                </div>
                <br />
                <div class="control-group">
		<spring:bind path="description">
		  <div class="input-group ${status.error ? 'has-error' : ''}">
			<span class="input-group-addon">Description</span>
			
				<form:input path="description" type="text" class="form-control" 
                                id="description" placeholder="Description" />
				<form:errors path="description" class="control-label" />
			
		  </div>
		</spring:bind>
                </div>
                <br />
                <!--TODO: TAGS-->
                <button type="submit" class="btn btn-primary pull-right">Save</button>
                <a href="/IDEAS/app/wsm" target="_self" type="submit" class="btn pull-right" style="margin-right: 4px;">Back</a>
                
	</form:form>

</div>

</body>
</html>