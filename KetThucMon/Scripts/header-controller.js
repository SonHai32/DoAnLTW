let user_toggle_login = false;

$(document).ready(function () {
    const user_icon = $("#user-icon");
    const user_container = $(".user-container");

    controller();
    user_icon.click(function () {
        user_toggle_login = !user_toggle_login;
        controller();
    })
    /*
        $(window).click(function (event) {
            if (user_toggle_login) {
                if (event.target.id != 'user-container' && event.target.id != 'user-icon'){
                    user_toggle_login = false;
                    controller();
                }
            }
            
        })
        
        */
    function controller() {
        if (user_toggle_login)
            user_container.show();
        else
            user_container.hide();
    }
})

