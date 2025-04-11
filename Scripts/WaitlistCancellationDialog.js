(function (window, document) {
    'use strict';

    if (!window.WA.WaitlistCancellationDialog) {
        window.WA.WaitlistCancellationDialog = WaitlistCancellationDialog;
    }

    function WaitlistCancellationDialog(confirmRemovalFromWaitlistDialogTitle,
        closeButtonText,
        leaveWaitListButtonText,
        waitListConfirmationQuestion,
        removeFromWaitListText,
        isButton,
        eventId) {

        var cancellationDialog;

        window.onCancelClick = function (registrationId) {
            if (!cancellationDialog) {
                cancellationDialog = createWaitlistCancellationDialog(registrationId);
            }
            cancellationDialog.show();
            return false;
        };

        window.onRemoveFromWaitlistClick = function onRemoveFromWaitlistClick() {
            if (!waitlistCancellationDialog) {
                var waitlistCancellationDialog = createWaitlistCancellationDialog(eventId);
            }

            waitlistCancellationDialog.show();
        }

        function createWaitlistCancellationDialog(registrationId) {
            var dialogId = 'waitlistCancellationDialog';
            var leaveWaitListButtonId = dialogId + '_LeaveWaitList';
            var closeButtonId = dialogId + '_CloseButton';

            var dialog = WA.UI.WaWindowManager.createDialog(dialogId, {
                width: 400,
                height: 200,
                isModal: true,
                hideCloseButton: true
            });
            dialog.addMainContainerCssClass("waitlistCancellationDialog");
            dialog.setTitle(confirmRemovalFromWaitlistDialogTitle);

            var contentModel = {
                confirmationMessage: waitListConfirmationQuestion
            }
            dialog.setContent(waitlistCancellationDialogContentTemplate(contentModel));

            var footerModel = {
                cancelButtonId: leaveWaitListButtonId,
                cancelButtonText: leaveWaitListButtonText,
                closeButtonId: closeButtonId,
                closeButtonText: closeButtonText
            }
            dialog.setFooter(waitlistCancellationDialogFooterTemplate(footerModel));

            var closeButton = new WA.UI.Button({ id: closeButtonId }, { parentComponent: dialog });
            closeButton.ButtonClick.addHandler(function () {
                dialog.hide();
            });
            closeButton.renderComplete();

            var cancelButton = new WA.UI.Button({ id: leaveWaitListButtonId }, { parentComponent: dialog });
            cancelButton.ButtonClick.addHandler(function () {
                onRemoveWaitlistButtonClick(registrationId, dialog);
            });
            cancelButton.renderComplete();

            return dialog;
        }

        function waitlistCancellationDialogContentTemplate(model) {
            var containerTemplate = WA.UI.ContainerTemplate;
            return containerTemplate({
                cssClass: 'waitlistCancellationDialogContent',
                contentHTML: containerTemplate({
                    cssClass: 'confirmMessage',
                    contentHTML: model.confirmationMessage
                })
            });
        }

        function waitlistCancellationDialogFooterTemplate(model) {
            var buttonTemplate = WA.UI.WaButtonTemplate;
            return WA.UI.ContainerTemplate({
                cssClass: 'actionButtons',
                contentHTML: buttonTemplate({
                    id: model.cancelButtonId,
                    name: model.cancelButtonText,
                    enabled: true
                }, { color: WA.UI.WaButton.ButtonColor.Green }) +
                    buttonTemplate({
                        id: model.closeButtonId,
                        name: model.closeButtonText
                    }, { color: WA.UI.WaButton.ButtonColor.Green })
            });
        }

        function setDisplayStyleForElements(className, displayStyle) {
            var elements = document.getElementsByClassName(className);

            for (var i = 0; i < elements.length; i++) {
                elements[i].style.display = displayStyle;
            }
        }

        function hideMessagesPopup() {
            var messagePopup = document.getElementById('WA_messagePopup');
            if (messagePopup) {
                messagePopup.style.display = 'none';
            }
        }

        function onRemoveWaitlistButtonClick(registrationId, dialog) {
            var cancellationComment = '';
            sendWaitlistCancellationRequest(registrationId, cancellationComment, dialog);
        }
        function sendWaitlistCancellationRequest(registrationId, cancellationComment, dialog) {
            var model = { registrationId: registrationId, comment: cancellationComment, waitlistCancellation: true };
            WA.Ajax({
                url: '/Sys/Finances/MemberProfileAction/CancelRegistration',
                dataType: 'text',
                contentType: "application/json; charset=utf-8",
                global: false,
                type: 'POST',
                data: JSON.stringify(model),
                success: function () {
                    if (!isButton) {
                        var row = document.querySelector('tr[data-registration-id="' + registrationId + '"]');
                        if (row) {
                            row.parentNode.removeChild(row);
                        }
                    }
                    else {
                        setDisplayStyleForElements('cancelMessageBox', 'block');
                        setDisplayStyleForElements('warningMessageBox', 'none');
                        setDisplayStyleForElements('paymentMessageBox', 'none');
                        setDisplayStyleForElements('infoMessageBox', 'none');
                        setDisplayStyleForElements('removeWaitlistButton', 'none');
                        setDisplayStyleForElements('actionInvoiceButton', 'none');
                        setDisplayStyleForElements('newRegistrationButton', 'none');
                        setDisplayStyleForElements('completeRegistrationButton', 'none');

                        hideMessagesPopup();
                    }
                    dialog.hide();
                }
            });
        }

        function getRemoveWaitListLink(item) {
            if (!item.IsWaitList || item.isPast) {
                return "";
            }
        
            return '&nbsp;<a class="noLine" href="#" onclick="onCancelClick(' + item.registrationId + ');">' + removeFromWaitListText + '</a>';
        }

        function processWaitlistLinks() {
            var elements = document.querySelectorAll('div[data-is-waitList]');

            for (var i = 0; i < elements.length; i++) {
                var IsWaitList = elements[i].getAttribute('data-is-waitList') === 'true';
                var registrationId = elements[i].getAttribute('data-registration-id');
                var isPast = elements[i].getAttribute('data-is-past') === 'true';

                var item = {
                    IsWaitList: IsWaitList,
                    registrationId: registrationId,
                    isPast: isPast
                };
                var link = getRemoveWaitListLink(item);

                if (link) {
                    elements[i].innerHTML += link;
                }
            }
        }

        if (isButton) {
            var removeWaitlistButton = WA.$(removeFromWaitListText, window);
            WA.addHandler(removeWaitlistButton, 'click', onRemoveFromWaitlistClick);
        }
        else {
            processWaitlistLinks();
        }
    }
})(window, document);
