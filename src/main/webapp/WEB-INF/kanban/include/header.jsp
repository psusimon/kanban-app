<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import="com.metservice.kanban.model.WorkItem"%>

<c:set var="secondLevel" value="${project.workItemTypes.root.children[0].value}" /> 

<script type="text/javascript">
    $(document).ready(function(){
        $("#graphs").click(function(){
            $("#graph_dropdown").fadeToggle();
            $("#graphs").toggleClass("active");
        });
    });
</script>

    <div class="header">
        <div class="user-home">${service.home.absolutePath}</div>
        <div class="version">VERSION: ${service.version}</div>
        <div id="projectDropdown">
			<form id="header" method="post" action="" style="display: inline;">
    			<label class="projectPicker" for="projectPicker">Project:</label>

				<select id="projectPicker" onchange="changeProject('projectPicker')">
						<c:forEach var="projectName" items="${service.projects}">
					        <option <c:if test="${projectName == project.name}">selected="selected"</c:if>>${projectName}</option>
						</c:forEach>
				</select>
			</form>
 			<form action="${boardName}/set-work-stream" style="display: inline;">
			<label for="workStreamPicker">Work stream:</label>
 				<select id="workStreamPicker" name="workStream" onchange="form.submit()"> 
					<option value="">[all streams]</option>
					<c:forEach var="workStream" items="${project.workStreams}">
						<option <c:if test="${workStreams[projectName] == workStream}">selected="selected"</c:if>>${workStream}</option>
					</c:forEach>
				</select>
 			</form>
        </div>
<%--         <div id="add-top-level-item-button" class="button" onclick="javascript:addTopLevel(<%= WorkItem.ROOT_WORK_ITEM_ID%>);" > --%>
<%--         	<div class ="textOnButton"><span style="font-weight:bold;font-size:120%;line-height:100%">+</span> Add ${project.workItemTypes.root.value}</div> --%>
<!--         </div> -->
   		<a id="add-top-level-item-button" href="${pageContext.request.contextPath}/projects/${project.name}/backlog/add-item?id=<%= WorkItem.ROOT_WORK_ITEM_ID%>" class="button">
      			<span style="font-weight:bold;font-size:120%;line-height:100%">+</span> Add ${project.workItemTypes.root.value}
   		</a>
       	
       	<a id="backlog-button" href="${pageContext.request.contextPath}/projects/${project.name}/backlog" class="button">Backlog</a>
        <a id="wall" href="${pageContext.request.contextPath}/projects/${project.name}/wall" class="button">Wall</a>
        <a id="journal" href="${pageContext.request.contextPath}/projects/${project.name}/journal" class="button">Journal</a>
        <a id="complete" href="${pageContext.request.contextPath}/projects/${project.name}/completed" class="button">Complete</a>

        <c:if test="${boardType == 'wall' || boardType == 'backlog' }">
        <div id="print" class="button" onclick="javascript:printCards();" ><div class ="textOnButton">Print</div></div>
		</c:if>
      <!-- Start of graph menu -->
			
					<div id="graphs" class="button">
					  <div class ="textOnButton">
					    Graphs
					  </div>
          </div>
          <div id="graph_dropdown">
          
          	<a id="cumulative-flow-chart-1-button" href="${pageContext.request.contextPath}/projects/${project.name}/backlog/chart?chartName=cumulative-flow-chart&workItemTypeName=${project.workItemTypes.root.value.name}" class="button">
              <img src="${pageContext.request.contextPath}/images/cumulative-flow-chart.png" /> ${project.workItemTypes.root.value.name}
	        </a>
			      
            <c:if test="${secondLevel != null}" >
            	<a id="cumulative-flow-chart-2-button" href="${pageContext.request.contextPath}/projects/${project.name}/backlog/chart?chartName=cumulative-flow-chart&workItemTypeName=${secondLevel.name}" class="button">
                	<img src="${pageContext.request.contextPath}/images/cumulative-flow-chart.png" /> ${secondLevel.name}
                </a>
            </c:if>
           
           <a id="cycle-time-chart-1-button" href="${pageContext.request.contextPath}/projects/${project.name}/backlog/chart?chartName=cycle-time-chart&workItemTypeName=${project.workItemTypes.root.value.name}" class="button">
                <img src="${pageContext.request.contextPath}/images/cycle-time-chart.png" /> ${project.workItemTypes.root.value.name}
           </a>
            
            <c:if test="${secondLevel != null}" >
            	<a id="cycle-time-chart-2-button" href="${pageContext.request.contextPath}/projects/${project.name}/backlog/chart?chartName=cycle-time-chart&workItemTypeName=${secondLevel.name}" class="button">
              		<img src="${pageContext.request.contextPath}/images/cycle-time-chart.png" /> ${secondLevel.name}
            	</a>
            </c:if>
          </div>			
			
			<!-- End of graph buttons -->
        <a id="burn-up-chart-button" href="${pageContext.request.contextPath}/projects/${project.name}/backlog/chart?chartName=burn-up-chart&workItemTypeName=${project.workItemTypes.root.value.name}" class="button">Burn-Up Chart</a>
        <a id="admin" href="${pageContext.request.contextPath}/projects/${project.name}/admin" class="button">Admin</a>
        <a id="pet" href="${pageContext.request.contextPath}/projects/${project.name}/pet-project" class="button">P.E.T.</a>
    </div>