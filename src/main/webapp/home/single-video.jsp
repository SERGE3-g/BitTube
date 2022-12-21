<div class="mb-5">
	<div class="video-container">
		<iframe width="100%" height="100%" src="https://www.youtube.com/embed/${param.codice}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>	
	</div>
	
	<h2 class="titleVideo">${param.titolo}</h2>
	<div>
	<i class="fa fa-clock-o" aria-hidden="true"></i>
	 <b>Durata:</b> ${param.durata}
	</div>
	
	<div>
		<i class="fa fa-music" aria-hidden="true"></i>
		<b>Genere:</b> ${param.genere}
	</div>
	
	<div>
		<i class="fa fa-microphone" aria-hidden="true"></i>		
		<b>Autore:</b> ${param.autore}
	</div>
	
	<input id="desc_state_${param.codice}" type="hidden" value="0" />
	<input id="desc_short_${param.codice}" type="hidden" value="${param.descrizione}" />	
	<input id="desc_long_${param.codice}" type="hidden" value="${param.descrizioneCompleta}" />
	
	<div id="desc_${param.codice}" class="descVideo" onClick="showMoreInformation('${param.codice}');">${param.descrizione}</div>
	
</div>