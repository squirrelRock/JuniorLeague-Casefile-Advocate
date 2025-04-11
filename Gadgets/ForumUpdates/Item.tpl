<li<$if (it.IsLastItem)$> class="last"<$else$><$endif$>>
	<div class="title"><a href="<$it.Url$>"><$it.Subject$></a></div>
	<div class="author">
		<$if (it.IsAuthorUrl)$>
			<a class="itemAuthor" href="<$it.AuthorUrl$>">posted by <$it.Author$></a>
		<$else$>
			<span class="itemAuthor">posted by <$it.Author$></span>
		<$endif$>
	</div>
	<div class="date">
		<span><$it.MessageDate$></span>
	</div>
</li>
