<!DOCTYPE html>
<html>
<head>
<meta http-equiv='cache-control' content='no-cache'>
<meta http-equiv='expires' content='0'>
<meta http-equiv='pragma' content='no-cache'>

<script src="s/lib/json2.js" type="text/javascript"></script>
<script src="s/lib/raphael.js" type="text/javascript"></script>
<script src="s/src/joint.js" type="text/javascript"></script>
<script src="s/src/joint.arrows.js" type="text/javascript"></script>
<script src="s/src/joint.dia.js" type="text/javascript"></script>
<script src="s/src/joint.dia.serializer.js" type="text/javascript"></script>
<script src="s/src/joint.dia.fsa.js" type="text/javascript"></script>
<script src="s/src/joint.dia.uml.js" type="text/javascript"></script>
<script src="s/src/joint.dia.pn.js" type="text/javascript"></script>
<script src="s/src/joint.dia.devs.js" type="text/javascript"></script>
<script src="s/src/joint.dia.cdm.js" type="text/javascript"></script>
<script src="s/src/joint.dia.erd.js" type="text/javascript"></script>
<script src="s/src/joint.dia.org.js" type="text/javascript"></script>

<title>Runner.</title>
<style type="text/css">
body {
	background-color: #161c1c
}

#world {
	background-color: white;
	margin: 0 auto 0 auto;
	width: 800px;
	height: 1000px;
	border: 3px solid gray;
	border-radius: 30px;
}

#title {
	position: fixed;
	left: 10px;
	top: 10px;
	color: white;
	font-size: 14px;
}

#description {
	position: fixed;
	left: 10px;
	top: 45px;
	color: white;
	font-size: 12px;
	width: 250px;
}

#source {
	position: fixed;
	left: 20px;
	top: 37px;
	color: white;
	font-size: 12px;
}
</style>
<script type="text/javascript">
	function gup(name) {
		name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
		var regexS = "[\\?&]" + name + "=([^&#]*)";
		var regex = new RegExp(regexS);
		var results = regex.exec(window.location.href);
		if (results == null)
			return "";
		else
			return results[1];
	}
	function init() {
		var srcs = gup("unit").split(',');
		for ( var i = 0, l = srcs.length; i < l; i++) {
			var sel = document.createElement("script");
			sel.type = "text/javascript";
			// 			sel.src = srcs[i] + ".js?" + new Date;
			sel.src = "http://" + document.location.host
					+ "/test/data.jsp?id=${param.id}";
			document.getElementById("source").href = "#";
			document.getElementsByTagName("head").item(0).appendChild(sel);
		}
	}
	function title(s) {
		document.getElementById('title').innerHTML = s;
	}
	function description(s) {
		document.getElementById('description').innerHTML = s;
	}
	function dimension(w, h) {
		var world = document.getElementById('world');
		world.style.width = w + 'px';
		world.style.height = h + 'px';
	}
</script>
</head>
<body onload="init()">
	<div id="world"></div>


	<a id="source" href="#" onclick="save()">(save)</a>

	<script>
		function save() {
			var pos = "";
			for ( var i = 0; i < all.length; i++) {
				var x = (all[i].properties.dx + all[i].properties.position.x);
				var y = (all[i].properties.dy + all[i].properties.position.y);
				if (x < 0)
					x = x * (-1);
				if (y < 0)
					y = y * (-1);
				pos += x + "," + y + ";";
			}
			console.log("--" + pos);
			document.getElementById('points').value = pos;
			document.getElementById('uppointsForm').submit();
		}
	</script>
	<form action="updatePoints.jspa" id="uppointsForm" method="post"
		target="upformframe">
		<input type="hidden" name="id" value="${param.id}"> <input
			type="hidden" name="points" id="points" />
	</form>
	<iframe name="upformframe" width="0" height="0"
		style="overflow: hidden"></iframe>
</body>
</html>
