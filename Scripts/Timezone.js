(function(window, document)
{
  // Function to get the user's IANA time zone
  function getIanaTimeZone() {
    return Intl.DateTimeFormat().resolvedOptions().timeZone;
}

// Function to process a single item element
function processItem(itemElement, ianaTimeZone, timezoneRegex, timeRegex) {
    var clientTimeZone = itemElement.getAttribute('client-tz-item');
    if (clientTimeZone === ianaTimeZone) {
      return
    }
    
    var formattedTimezone = itemElement.getAttribute('client-tz-formatted');
    if (formattedTimezone && !timezoneRegex.test(itemElement.innerText)) {
        if (itemElement.tagName === 'A') {
            updateAnchorTitle(itemElement, formattedTimezone, timeRegex);
        } else {
            appendTimezone(itemElement, formattedTimezone);
        }
    }
    
}

// Function to update the title of an anchor element
function updateAnchorTitle(itemElement, formattedTimezone, timeRegex) {
    var originalTitle = itemElement.getAttribute('title');
    var formattedTitle = originalTitle.replace(timeRegex, function(match) {
        return match + formattedTimezone;
    });
    itemElement.setAttribute('title', formattedTitle);
}

// Function to append the formatted timezone to the item's inner text
function appendTimezone(itemElement, formattedTimezone) {
    itemElement.innerText += formattedTimezone;
}

// Function to initialize and run the timezone processing
function init() {
    var timezoneRegex = /\(\w+\/[A-Za-z_\/-]+\)|\([A-Z]{2,9}\)$/; // Finds existing values: (Europe/London) or (BST)
    var timeRegex = /\b(\d{1,2}:\d{2})(?:\s?(AM|PM))?\b/g; // Finds time from text tooltip: 3:00 PM or 15:00 
    var items = document.querySelectorAll('[client-tz-item]');

    if (items.length === 0) {
        return;
    }

    var ianaTimeZone = getIanaTimeZone();

    for (var i = 0; i < items.length; i++) {
        processItem(items[i], ianaTimeZone, timezoneRegex, timeRegex);
    }
  }

  BonaPage.addPageStateHandler(BonaPage.PAGE_LOADED, init, BonaPage.HANDLERTYPE_ALWAYS);
})(window, document);