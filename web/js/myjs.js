function doLike(pid, uid){
	console.log(pid+" ," +uid)
	
	const d={
		uid:uid,
		pid:pid,
		operation:'like'
	}
	
	$.ajax({
		type: 'POST',
		url: 'LikeServlet',
		data: d,
		success: function(data, textStatus, jqXHR){
                    let c = $(".like-counter").html();
                    console.log(c);
                    console.log(data);
                    if(data.trim() === 'dolike')c++;
                    else c--; 
                    $('.like-counter').html(c);
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log(data)
		}
		
	})
}