<$if (Model.ShowInvoice)$>
    <$if (Model.InvoiceAndPayment.AvailablePayOnlineBool)$>
        <div class="text">
	    	<$Model.InvoiceDetails.Text.PaymentInstructions$>
		</div>
    <$else$>
        <div class="text">
            <$Model.InvoiceDetails.Text.PaymentInstructions$>
        </div>        
        <div class="text">
            <$Model.InvoiceAndPayment.Text.WaitingForPayment$>
        </div>
    <$endif$>
	<$if (Model.InvoiceDetails.IsRecurringDocumentBool)$>
		<div class="text">
			<$Model.InvoiceDetails.Text.RecurringDescription$>
		</div>
    <$endif$>
    <$if (Model.InvoiceAndPayment.DisplayPaymentProcessingFeeDonationCheckBoxBool)$>
       <div class="cww"></div> 
       <div class="cww"></div> 
       <div>  
           <input type="checkbox" id="paymentProcessingFeeDonation" name="paymentProcessingFeeDonation" />
           <label for="paymentProcessingFeeDonation" id="paymentProcessingFeeDonationLabel">
               <$Model.InvoiceAndPayment.Text.PaymentProcessingFeeDonationLabel$>
           </label> 
       </div>
       <$if (Model.InvoiceDetails.IsRecurringDocumentBool)$>
           <div class="recurringInfo"><$Model.InvoiceAndPayment.Text.PaymentProcessingFeeDonationRecurringNote$></div>    
           <div class="cww"></div> 
           <div class="cww"></div>
       <$endif$> 
    <$endif$>

	<$Model.InvoiceAndPayment.PaymentSystemsCardTypes:
	{                
		<div class="waPaymentSystemIcon <$it.Type$>" title="<$it.ToolTip$>"></div>
	}
    $>
    <$if (Model.InvoiceAndPayment.AvailablePayOnlineBool)$>
	    <div id="payButtonsMessageBoxGroup" class="buttons">
		    
			<$if (Model.InvoiceAndPayment.PayOnlineBool)$>
				<input type="submit" class="button" id="payOnlineButton" name="payOnlineButton" onclick="<$if (Model.InvoiceAndPayment.IsInWidgetMode)$>FinDocumentRenderer.DisablePaymentButtonsInWidget();<$else$>FinDocumentRenderer.DisablePaymentButtons();<$endif$>" value="<$Model.InvoiceAndPayment.Text.PayOnlineButtonLabel$>">
			<$endif$>

			<$if (Model.InvoiceAndPayment.PayByCreditCardBool)$>
				<input type="submit" class="button" id="payByCreditCardButton" name="payByCreditCardButton" onclick="<$if (Model.InvoiceAndPayment.IsInWidgetMode)$>FinDocumentRenderer.DisablePaymentButtonsInWidget();<$else$>FinDocumentRenderer.DisablePaymentButtons();<$endif$>" value="<$Model.InvoiceAndPayment.Text.PayByCreditCardButtonLabel$>">
			<$endif$>

			<$if (Model.InvoiceAndPayment.PayByExpressBool)$>
				<input type="submit" class="button" id="payByExpressButton" name="payByExpressButton" onclick="<$if (Model.InvoiceAndPayment.IsInWidgetMode)$>FinDocumentRenderer.DisablePaymentButtonsInWidget();<$else$>FinDocumentRenderer.DisablePaymentButtons();<$endif$>" value="<$Model.InvoiceAndPayment.Text.PayByExpressButtonLabel$>">
			<$endif$>            
            <$if (Model.InvoiceAndPayment.AvailablePayOfflineBool)$>
                <$Model.InvoiceAndPayment.Text.OfflinePaymentAlsoAvailableTextLabel$>
            <$endif$>
			<$if (Model.InvoiceAndPayment.RenewalInvoiceBool)$>
				<a href="#" onclick="FinDocumentRenderer.CancelRenewalClick();"><$Model.InvoiceAndPayment.Text.VoidInvoiceCancelRenewalText$></a>
			<$endif$>
	    </div>
    <$endif$>
	<$if (!Model.InvoiceAndPayment.AvailablePayOnlineBool && Model.InvoiceAndPayment.RenewalInvoiceBool)$>
		<div  class="buttons">
			<a href="#" onclick="FinDocumentRenderer.CancelRenewalClick();"><$Model.InvoiceAndPayment.Text.VoidInvoiceCancelRenewalText$></a>
		</div>
	<$endif$>
<$endif$>
<$if (Model.ShowDonation)$>
    <$Model.InvoiceAndPayment.Text.PaymentInstructions$>
	<div class="buttons" id='payButtonsMessageBoxGroup'>
		<$if (Model.InvoiceAndPayment.PayOnlineBool)$>
			<input type="submit" class="button" id="payOnlineButton" name="payOnlineButton" onclick="<$if (Model.InvoiceAndPayment.IsInWidgetMode)$>FinDocumentRenderer.DisablePaymentButtonsInWidget();<$else$>FinDocumentRenderer.DisablePaymentButtons();<$endif$>" value="<$Model.InvoiceAndPayment.Text.PayOnlineButtonLabel$>">
		<$endif$>

		<$if (Model.InvoiceAndPayment.PayByCreditCardBool)$>
			<input type="submit" class="button" id="payByCreditCardButton" name="payByCreditCardButton" onclick="<$if (Model.InvoiceAndPayment.IsInWidgetMode)$>FinDocumentRenderer.DisablePaymentButtonsInWidget();<$else$>FinDocumentRenderer.DisablePaymentButtons();<$endif$>" value="<$Model.InvoiceAndPayment.Text.PayByCreditCardButtonLabel$>">
		<$endif$>

		<$if (Model.InvoiceAndPayment.PayByExpressBool)$>
			<input type="submit" class="button" id="payByExpressButton" name="payByExpressButton" onclick="<$if (Model.InvoiceAndPayment.IsInWidgetMode)$>FinDocumentRenderer.DisablePaymentButtonsInWidget();<$else$>FinDocumentRenderer.DisablePaymentButtons();<$endif$>"value="<$Model.InvoiceAndPayment.Text.PayByExpressButtonLabel$>">
		<$endif$>
		<input type="submit" class="button" value="<$Model.InvoiceAndPayment.Text.CancelButtonLabel$>" name="cancelDonationButton" id="cancelDonationButton">
	</div>
<$endif$>
