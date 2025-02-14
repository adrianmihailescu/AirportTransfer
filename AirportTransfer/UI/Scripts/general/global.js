//////
var openBookPath = '../../../DynamicData/Content/Images/ui/x_book_open.png';
var closedBookPath = '../../../DynamicData/Content/Images/ui/x_book_closed.png';
//////

//// filters
                    // toggles a panel on / off based on a trigger's state
function SetToggleOn(controlToToggle, labelToToggle, triggerControl, cookie, image) {
    ///////
    var openCloseBookImage = $(image);
    var currentToggleControl = $(controlToToggle);

    var currentToggleLabel = $(labelToToggle);
    ///////

    $(controlToToggle).hide();

    if (navigator.cookieEnabled) { // check if cookies are enabled

        if ($.cookie(cookie) == 'true') {
            $(controlToToggle).show();
        } else {
            $(controlToToggle).hide();
        }
    }

    else {
        $(controlToToggle).show();
    }

    //////
    ChangeImageUrlOnStatus(currentToggleControl, currentToggleLabel, openCloseBookImage);
    //////

    $(triggerControl).click(function () {

        $(controlToToggle).slideToggle(0, function () {

            try {
                if (navigator.cookieEnabled) {
                    $.cookie(cookie, $(controlToToggle).is(':visible').toString());
                }

                //////
                ChangeImageUrlOnStatus(currentToggleControl, currentToggleLabel, openCloseBookImage);
                //////
            }

            catch (e) {
                alert("error: " + e.Message.toString());
            }
        });

        return false;
    });
    // -->
}

                    function SetImageUrl(image, imageUrl) {
                        var currentImage = $(image);
                        currentImage.attr('src', imageUrl);
                    }

                    function ChangeImageUrlOnStatus(currentControl, currentLabel, currentImage) {
                        if ($(currentControl).is(':hidden')) {
                            SetImageUrl(currentImage, closedBookPath);
                            $(currentLabel).html('show filters');
                        }

                        else if ($(currentControl).is(':visible')) {
                            SetImageUrl(currentImage, openBookPath);
                            $(currentLabel).html('hide filters');
                        }
                    }