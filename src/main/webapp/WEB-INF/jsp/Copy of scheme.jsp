
<div id="box-tabs" class="box">
	<!-- box / title -->
	<div class="title">
		<h5>${scheme.name}</h5>
		<ul class="links">
			<!-- 			<li><a href="#box-ViewFsa">关系图</a></li> -->
			<li><a href="#box-DIY">关系图</a></li>
			<li><a href="#box-Factor">因子属性</a></li>
			<li><a href="#box-FactorRelation">因子参数</a></li>
			<li><a href="#box-FactorAttr">因子关系</a></li>
		</ul>
	</div>
	<!--  
	<div id="box-ViewFsa">
		<jsp:include page="view-fsa.jsp" />
	</div>-->
	<div id="box-DIY">
		<jsp:include page="schemeDiy.jsp" />
	</div>
	<div id="box-Factor">
		<jsp:include page="/tbl.jspa?tbl=Factor&id=${param.id }" />
	</div>


	<div id="box-FactorAttr"><jsp:include
			page="/tbl.jspa?tbl=FactorAttr&id=${param.id }" /></div>

	<div id="box-FactorRelation"><jsp:include
			page="/tbl.jspa?tbl=FactorRelation&id=${param.id }" /></div>
</div>

<script type="text/javascript">
	function delTableDate(tbl, id) {
		dwra.sqlExec("delete from " + tbl + " where id=" + id, {
			callback : function() {
				window.location.reload(true);
			}
		});
	}
</script>