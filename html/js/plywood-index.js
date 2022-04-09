$(function() {
    $(".rd-nav-item").click(function() {
        $(".rd-nav-item").removeClass("active")
        $(this).addClass("active")
    });
})