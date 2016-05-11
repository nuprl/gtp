#lang scribble/html
@(provide misc-scripts)

@(define (misc-scripts)
  (list
    @script[type: "text/javascript"]{@literal{
      $(document).on('click', '.list', function (e) {
      var ul = $(this).parent('li').find('ul');
      ul.toggleClass('active');
      var i = 1;
      ul.children('li').each(function(){
      $(this).delay(200*i).toggle('slow');
      i++;
      });

      });}}
    @script[type: "text/javascript"]{@literal{
      function stopTopParallax()
      {
      var mainBanner = $('#main-banner');
      if($('.shadow-back').offset().top >150)
      {
      mainBanner.css('position','fixed');
      mainBanner.css('height','75px');
      mainBanner.css('z-index','2');
      $('#content').css('margin-top','260px');
      } else {
      mainBanner.css('position','relative');
      mainBanner.css('height','260px');
      mainBanner.css('z-index','0');
      $('#content').css('margin-top','0px');
      }
      }
      function checkOffset___() {
      if($('#menu').offset().top + $('#menu').height()
      >= $('#sponsors').offset().top -150)
      {
      var height = $('#content').height()-470;
      $('#menu').removeClass('fixed-menu');
      $('#menu').addClass('absolute-menu');
      console.log();
      $('#menu').css('bottom','-'+height+'px');
      }

      if($(document).scrollTop() + window.innerHeight < $('#sponsors').offset().top+150)
                                                        {
                                                        $('#menu').removeClass('absolute-menu');
                                                        $('#menu').addClass('fixed-menu');
                                                        $('#menu').css('bottom','');
                                                        }

                                                        }
                                                        function checkOffset() {
                                                        if ($('#menu').offset().top + $('#menu').height() > $('#sponsors').offset().top && $('#menu').hasClass('menu-fixed'))
        {
        $('#menu').removeClass('menu-fixed');
        $('#menu').addClass('menu-absolute');
        $('#menu').css('top',$('#sponsors').offset().top-$('#menu').height());
        }
        if ($(document).scrollTop() + window.innerHeight-100 < $('#sponsors').offset().top  && $('#menu').hasClass('menu-absolute'))
                                                               {
                                                               $('#menu').removeClass('menu-absolute');
                                                               $('#menu').addClass('menu-fixed');
                                                               $('#menu').removeAttr('style');
                                                               }

                                                               }
                                                               $(document).scroll(function() {
                                                               checkOffset();
                                                               //stopTopParallax();
                                                               });

    }}
    @script{@literal{
      $(document).on('click', '#menu-icon', function (e) {
      $(this).parent('div').find('ul').toggleClass('active');
      });
      $(document).on('mouseover', '#menu li', function (e) {
      $('#menu li').each(function(){
      if (!$(this).hasClass('active'))
      $(this).css('background-image','');
      });
      if (typeof $(this).data('src') !== 'undefined')
      $(this).css('background-image','url("'+$(this).data('src')+'")')
      });
      $(document).on('mouseout', '#menu li', function (e) {
      $('#menu li').each(function(){
      if (!$(this).hasClass('active'))
      $(this).css('background-image','');
      });
      });
      $(document).ready(function () {
      $('#menu li').each(function(){
      if (!$(this).hasClass('active'))
      $(this).css('background-image','');
      else if (typeof $(this).data('src') !== 'undefined')
      $(this).css('background-image','url("'+$(this).data('src')+'")')
      });

      });
    }}
    @script{@literal{
      $(function(){
      $.stellar({
      horizontalScrolling: false,
      verticalOffset: 40
      });
      });
    }}
    @script{@literal{
      new WOW().init();}}))
