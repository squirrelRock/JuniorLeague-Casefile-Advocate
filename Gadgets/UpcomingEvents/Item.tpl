<li<$if (it.IsLastItem)$> class="last"<$else$><$endif$>>
	<span class="event-time-zone" style="display: none;" ><$it.EventTimeZone$></span>
	<div class="title"><a href="<$it.Url$>"><$it.Title$></a></div>
	<div class="date">
		<span client-tz-display client-tz-item="<$it.EventTimeZone$>" client-tz-formatted="<$it.FormattedEventTimeZone$>"><$it.EventDate$></span>
	</div>
	<div class="location">
		<span><$it.Location$></span>
	</div>
</li>
