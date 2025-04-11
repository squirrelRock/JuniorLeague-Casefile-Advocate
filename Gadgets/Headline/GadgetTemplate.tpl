<$if (Model.Text != "")$>
	<$control.StyledWrappers(GadgetBegin = "true", GadgetBodyBegin = "true", GadgetContent = "true")$>
<$else$>
	<$control.StyledWrappers(GadgetBegin = "true", GadgetBodyBegin = "true", GadgetContent = "true")$>
<$endif$>

<$Model.Text$>

<$if (Model.Text != "")$>
	<$control.StyledWrappers(GadgetBodyEnd = "true", GadgetEnd = "true")$>
<$else$>
	<$control.StyledWrappers(GadgetBodyEnd = "true", GadgetEnd = "true")$>
<$endif$>

<$if (Model.CssStyle.Height != "")$>
	<script type="text/javascript">if (window.WA) { new WaHeadlineGadgetResizer({ id: '<$Model.Id$>' }); }</script>
<$endif$>