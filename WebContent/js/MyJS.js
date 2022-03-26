/**
 * 
 */
function doAdd(pid,cid){
	console.log(pid + "," + cid);
	const d={
			cid: cid,
			pid: pid,
			operation: 'add'
	}
	$.ajax({
		url:"StatusAdd",
		data: d,
		success: function (data, textStatus, jqXHR){
			console.log(data);
		},
		error: function (jqXHR, textStatus, errorThrown){
			console.log(data)
		}
	});
	
}