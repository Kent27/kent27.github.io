$(function() {
    $(".rd-nav-item").click(function() {
        $(".rd-nav-item").removeClass("active")
        $(this).addClass("active")
    });
})

// $(document).ready(function () {
     //Smooth scrolling when click to nav
//   $('.rd-nav-item').click(function (e) {
//     e.preventDefault();
//     var curLink = $(this);
//     var scrollPoint = $(curLink.attr('href')).position().top;
//     $('body,html').animate({
//         scrollTop: scrollPoint
//     }, 500);

//     $(window).scroll(function () {
//         onScrollHandle();
//     });

//     function onScrollHandle() {
//         //Navbar shrink when scroll down
//         // $(".navbar-default").toggleClass("navbar-shrink", $(this).scrollTop() > 50);

//         //Get current scroll position
//         var currentScrollPos = $(document).scrollTop();

//         //Iterate through all node
//         $('.rd-nav-item > a').each(function () {
//             var curLink = $(this);
//             var refElem = $(curLink.attr('href'));
//             // console.log([curLink, refElem,currentScrollPos])
//             // console.log([refElem, refElem.position().top, currentScrollPos, refElem.height()])
//             //Compare the value of current position and the every section position in each scroll
//             if (refElem.position().top <= currentScrollPos && !curLink.parent().hasClass("active")) {
//                 //Remove class active in all nav
//                 $('.rd-nav-item').removeClass("active");
//                 //Add class active
//                 curLink.parent().addClass("active");
//                 // console.log(['if', curLink, curLink.parent()])
//             }
//             // else {
//             //     // console.log(['else', curLink, curLink.parent()])
//             //     curLink.parent().removeClass("active");
//             // }
//         });
//     }
// })