$("document").ready(function(){
       
    var swiper = new Swiper('.swiper-container', {
        spaceBetween: 0, //마진값
        slidesPerView: 4,
        loop: false,
        rebuildOnUpdate: true,
        direction: getDirection(),
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        on: {
            resize: function () {
                swiper.changeDirection(getDirection());
            },
        },
    });
    
    function getDirection() {
        var windowWidth = window.innerWidth;
        var direction = window.innerWidth <= 760 ? 'vertical' : 'horizontal';
    
        return direction;
    }

});