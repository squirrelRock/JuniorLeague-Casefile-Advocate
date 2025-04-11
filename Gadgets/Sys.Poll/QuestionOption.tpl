<$if(it.IsFreetext)$>
<li class="optionItem freetextOption">
  <input class="freetextInput" id="<$ it.Id $>" name="<$ it.Name $>" type="text" value="<$ it.Value $>" maxlength="256" <$if(!Model.AllowSubmit)$>disabled<$endif$>>
</li>
<$elseif(it.IsSuggestion)$>
<li class="optionItem otherOption">
  <input id="<$ it.Id $>" name="<$ it.Name $>" type="<$ it.Type $>" value="<$ it.Value $>" <$if(!Model.AllowSubmit)$>disabled<$endif$>>
  <label for="<$ it.Id $>"><$ it.Title $></label>&nbsp;<input type="text" name="<$ it.Id $>" value="" maxlength="256">
</li>
<$else$>
<li class="optionItem">
  <input id="<$ it.Id $>" name="<$ it.Name $>" type="<$ it.Type $>" value="<$ it.Value $>" <$if(!Model.AllowSubmit)$>disabled<$endif$>>
  <label for="<$ it.Id $>"><$ it.Title $></label>
</li>
<$endif$>